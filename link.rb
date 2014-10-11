#!/usr/bin/env ruby

# Link dotfiles
class Linker
  attr_reader :dotfiles_dir, :dotfiles

  def initialize()
    @dotfiles_dir = Dir.pwd
    @dotfiles = ['gitconfig', 'gvimrc', 'vimrc', 'zshrc']
  end

  def link()
    puts "======================================================================================================="
    puts "Start linking files: #{ @dotfiles.join(',') } from #{ dotfiles_dir }"
    puts "======================================================================================================="

    @dotfiles.each do |file|
      linking_file = "#{ Dir.home }/.#{ file }"
      linked_file = "#{ @dotfiles_dir }/#{ file }"

      # Remove file if it exist
      if File.exist?(linking_file)
        File.delete linking_file
        puts "Remove existing file: #{ linking_file }"
      end

      # Link file
      File.symlink linked_file, linking_file
      puts "Created symlink for .#{ file }", ''
    end
  end
end

# Start linking
Linker.new().link()
