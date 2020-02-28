#!/usr/bin/env ruby
# frozen_string_literal: true

dotfiles_dir = Dir.pwd
dotfiles = %w[
  curlrc
  git_commit_msg.txt
  gitconfig
  gitignore_global
  spacemacs
  zshrc
  zshrc.local
]

dotfiles.each do |file|
  linking_file = "#{Dir.home}/.#{file}"
  linked_file = "#{dotfiles_dir}/#{file}"

  if File.exist?(linking_file)
    File.delete linking_file
    puts "Remove existing file: #{linking_file}"
  end

  File.symlink linked_file, linking_file
  puts "Created symlink for .#{file}", ''
end

File.delete("#{Dir.home}/.config/nvim/init.vim")
File.symlink("#{dotfiles_dir}/init.vim", "#{Dir.home}/.config/nvim/init.vim")
