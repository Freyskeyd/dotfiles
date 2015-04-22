require 'fileutils'

module Neobundle
  @neobundles_path = File.expand_path File.join(ENV['HOME'], '.vim', '.bundles.local')

  def self.update_neobundle
    system "vim --noplugin -u #{ENV['HOME']}/.vim/bundles.vim -N \"+set hidden\" \"+syntax on\" +NeoBundleClean +NeoBundleInstall +qall"
  end
end
