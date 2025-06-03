function zed_file_search() {
  local FILE
  FILE=$(
    rg --files --hidden --color=always \
      --glob '!**/.git/' \
      --glob '!**/node_modules' \
    | fzf --ansi --preview 'bat --decorations=always --color=always {} --style=full --line-range :50' \
          --preview-window 'up:60%:wrap' \
          --layout=reverse
  )

  if [ -n "$FILE" ]; then
    zed "$FILE"
  fi
}

function zed_search() {
  local query="${1:-}"
  local OUT

  # Run fzf in multi-selection mode with dynamic reload based on the query.
  # The first line of output is the final query, followed by one or more selected results.
  OUT=$(
    fzf --ansi --cycle --exact --delimiter ':' --nth 4.. \
      --preview 'bat --decorations=always --color=always {1} --highlight-line {2} --style=full' \
      --preview-window 'up:60%:+{2}+3/3' \
      --layout=reverse \
      --query "$query" \
      --phony \
      --print-query \
      --multi \
      --bind 'start:reload:rg --column --hidden --line-number --no-heading --color=always --smart-case \
        --colors match:fg:green --colors path:fg:white --colors path:style:nobold \
        --glob "!**/.git/" --glob "!**/node_modules" {q} .' \
      --bind 'change:reload:rg --column --hidden --line-number --no-heading --color=always --smart-case \
        --colors match:fg:green --colors path:fg:white --colors path:style:nobold \
        --glob "!**/.git/" --glob "!**/node_modules" {q} .'
  )

  # If nothing was selected, do nothing
  if [ -z "$OUT" ]; then
    return
  fi

  # The first line of OUT is the query used, append it to history
  local FINAL_QUERY
  FINAL_QUERY=$(echo "$OUT" | head -n1)

  if [ -n "$FINAL_QUERY" ]; then
    echo "$FINAL_QUERY" >> ~/.zed_search_history
  fi

  # Now extract the selected file lines (everything after the first line)
  # Each line is in the format: filepath:line:col:...
  echo "$OUT" | tail -n +2 | while IFS= read -r FILE_LINE; do
    if [ -n "$FILE_LINE" ]; then
      local LINE COL PATH
      # Not sure why, but I have to use absolute paths to `cut` and `zed` here
      LINE=$(echo "$FILE_LINE" | /usr/bin/cut -d':' -f2)
      COL=$(echo "$FILE_LINE" | /usr/bin/cut -d':' -f3)
      PATH=$(echo "$FILE_LINE" | /usr/bin/cut -d':' -f1)
      /usr/local/bin/zed "$PATH:$LINE:$COL"
    fi
  done
}

function zed_search_history() {
  # FZF to choose a past query
  local HIST_QUERY=$(fzf --prompt="History> " < ~/.zed_search_history)
  if [ -n "$HIST_QUERY" ]; then
    # Run zed_search again with the chosen query
    zed_search "$HIST_QUERY"
  fi
}
