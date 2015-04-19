require 'rake'
require 'fileutils'
require File.join(File.dirname(__FILE__), 'bin', 'dotfiles', 'vundle')

desc "Hook our dotfiles into system-standard positions."
task :install do
  puts
  puts "=========================================="
  puts "Installing dotfiles"
  puts "=========================================="

  install_homebrew if RUBY_PLATFORM.downcase.include?("darwin")
  install_oh_my
  install_vim
  file_operation(Dir.glob('git/*')) if want_to_install?('git configs (color, aliases)')
  file_operation(Dir.glob('vimify/*')) if want_to_install?('Vimrc')
  file_operation(Dir.glob('vim')) if want_to_install?('Vim configuration')

  Rake::Task["install_vundle"].execute


end

task :install_vundle do
  puts "=========================================="
  puts "Installing and update vundles."
  puts "=========================================="

  puts ""

  vundle_path = File.join('vim','bundle','vundle')
  unless File.exists?(vundle_path)
    run %{
cd $HOME/.dotfiles
git clone https://github.com/gmarik/vundle.git #{vundle_path}
}
  end
  Vundle::update_vundle
end

task :uninstall do
  puts "=========================================="
  puts "Uninstalling Dotfiles"
  puts "=========================================="

  puts ""

  run %{rm -rf ~/.{vim,vimrc,oh-my-zsh,gitconfig,gitignore,zshrc}}

end

def install_vim
  run %{brew install macvim}
end

def install_homebrew
  run %{which brew}
  unless $?.success?
    puts "======================================================"
    puts "Installing Homebrew, the OSX package manager...If it's"
    puts "already installed, this will do nothing."
    puts "======================================================"
    run %{ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"}	
  end
  puts
  puts
  puts "======================================================"
  puts "Updating Homebrew."
  puts "======================================================"
  run %{brew update}
  puts
  puts
  puts "======================================================"
  puts "Installing Homebrew packages...There may be some warnings."
  puts "======================================================"
  run %{brew install zsh ctags git hub tmux reattach-to-user-namespace the_silver_searcher}
  puts
  puts
end

task :default => 'install'

def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def want_to_install? (section)
  if ENV["ASK"]=="true"
    puts "Would you like to install configuration files for: #{section}? [y]es, [n]o"
    STDIN.gets.chomp == 'y'
  else
    true
  end
end

def file_operation(files, method = :symlink)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    puts "====================== #{file} =============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    if method == :symlink
      run %{ ln -nfs "#{source}" "#{target}" }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end

    if file == 'zshrc'
      File.open(target, 'a') do |zshrc|
        zshrc.puts('for config_file ($home/.dotfiles/zsh/*.zsh) source $config_file')
      end
    end
  end
end

def install_oh_my
  if !File.exists?("#{ENV["HOME"]}/.oh-my-zsh")
    run %{curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh}
  end
end
