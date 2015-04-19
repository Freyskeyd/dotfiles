require 'fileutils'

module Vundle
	@vundles_path = File.expand_path File.join(ENV['HOME'], '.vim', '.bundles.local')

	def self.update_vundle
		system "vim --noplugin -u #{ENV['HOME']}/.vim/bundles.vim -N \"+set hidden\" \"+syntax on\" +PluginClean +PluginInstall +qall"
	end
end
