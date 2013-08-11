#!/usr/bin/env ruby
require 'fileutils'

old_dotfiles_dir = Dir.home + '/.old_dotfiles/'

FileUtils.rm_rf old_dotfiles_dir if Dir.exists? old_dotfiles_dir
Dir.mkdir old_dotfiles_dir 

dotfiles_dir = Dir.pwd + '/'
dotfiles = %w(gitconfig gtkrc gvimrc vimrc zshrc)
old_dotfiles = dotfiles.map {|file| Dir.home + '/.' + file}

# Move old dotfiles to directory
old_dotfiles.each {|file| FileUtils.mv(file, old_dotfiles_dir) if File.exists? file}

# Link dotfiles
dotfiles.each {|file| File.symlink(dotfiles_dir + file, Dir.home + '/.' + file) if File.exists? dotfiles_dir + file}

puts "Successfully linking #{dotfiles.join ','}"
