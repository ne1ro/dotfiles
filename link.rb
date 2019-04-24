#!/usr/bin/env ruby

dotfiles_dir = Dir.pwd
dotfiles = %w(
  amethyst
  curlrc
  git_commit_msg.txt
  gitconfig
  gitignore_global
  thymerc
  tmux.conf
  tmuxinator
  zshrc
  zshrc.local
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

File.delete("#{ Dir.home }/.config/nvim/init.vim")
File.symlink("#{ dotfiles_dir }/init.vim", "#{ Dir.home }/.config/nvim/init.vim")
