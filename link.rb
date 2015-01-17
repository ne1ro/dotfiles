#!/usr/bin/env ruby

# Link dotfiles
class Linker
  attr_reader :dotfiles_dir, :dotfiles

  def initialize
    @dotfiles_dir = Dir.pwd
    @dotfiles = %w(
      gitconfig
      vimrc
      gvimrc
      zshrc
      amethyst
      gitignore_global
      mackup.cfg
    )
  end

  def link
    @dotfiles.each do |file|
      linking_file = "#{ Dir.home }/.#{ file }"
      linked_file = "#{ @dotfiles_dir }/#{ file }"

      if File.exist?(linking_file)
        File.delete linking_file
        puts "Remove existing file: #{ linking_file }"
      end

      File.symlink linked_file, linking_file
      puts "Created symlink for .#{ file }", ''
    end
  end
end

# Start linking
Linker.new.link
