#!/usr/bin/env ruby

dotfiles_dir = Dir.pwd
dotfiles = %w(
  gitconfig
  vimrc
  zshrc
  amethyst
  gitignore_global
  mackup.cfg
  zprestorc
)

# Link dotfiles
dotfiles.each do |file|
  linking_file = "#{ Dir.home }/.#{ file }"
  linked_file = "#{ dotfiles_dir }/#{ file }"

  if File.exist?(linking_file)
    File.delete linking_file
    puts "Remove existing file: #{ linking_file }"
  end

  File.symlink linked_file, linking_file
  puts "Created symlink for .#{ file }", ''
end
