;;; ~/dotfiles/doom.d/bindings.el -*- lexical-binding: t; -*-
(map! :leader :desc "Runs docker-compose" "d c" #'docker-compose)
(map! :leader :desc "Runs feed" "e f" #'elfeed)
(map! :leader :desc "Build static org-mode blog" "b p" #'org-static-blog-publish)
