;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
;;
(load! "bindings")
(load! "secrets")

;; Load maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Aleksei Kuznetsov")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 12.5)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 12.5))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org")
(setq find-file-visit-truename t)
(setq vc-follow-symlinks t)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; The built-in package manager package.el supports ahead-of-time native compilation when installing a package
(setq package-native-compile t)

(setq comp-speed 4)

;; Change emacs theme based on system appearance
(add-hook 'ns-system-appearance-change-functions
          #'(lambda (appearance)
              (mapc #'disable-theme custom-enabled-themes)
              (pcase appearance
                ('light (load-theme 'doom-tomorrow-day t))
                ('dark (load-theme 'doom-tomorrow-night t)))))

(use-package! rbenv
  :after ruby-mode
  :init (add-hook 'ruby-mode-hook 'global-rbenv-mode))

(use-package! yaml-mode
  :defer
  :init
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(use-package lsp-mode
  :commands lsp
  :ensure t
  :diminish lsp-mode
  :hook
  (elixir-mode . lsp)
  :init
  (add-to-list 'exec-path "~/Projects/elixir-ls"))

;; Kubernetes configuration
(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview))

;; If you want to pull in the Evil compatibility package.
(use-package kubernetes-evil
  :ensure t
  :after kubernetes)

(use-package plantuml-mode
  :defer
  :config (setq plantuml-executable-path "/usr/local/bin/plantuml" plantuml-default-exec-mode 'executable))

(after! org
  (add-to-list 'org-modules 'org-habit)
  (require 'org-roam-protocol)
  (setq org-roam-directory "~/Dropbox/roam"
        org-pomodoro-long-break-frequency 1
        org-pomodoro-length 52
        org-pomodoro-format "🍅 ~%s"
        org-pomodoro-long-break-length 17
        org-agenda-custom-commands
        '(("w" "Work tasks" tags-todo "@work"
                ((org-agenda-overriding-header "Work"))))
        org-capture-templates
        '(("t" "Todo [inbox]" entry
           (file+headline "~/Dropbox/org/inbox.org" "Tasks")
           "* TODO %i%?")
          ("a" "Anki Deutsch"
           entry
           (file+headline "~/Dropbox/org/anki.org" "Dispatch Shelf")
           "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Basic\n:ANKI_DECK: Deutsch\n:END:\n** Front\n%?\n** Back\n%x\n")
          ("T" "Tickler" entry
           (file+headline "~/Dropbox/org/tickler.org" "Tickler")
           "* %i%? \n %U"))))


;; =============================================================================
;; ORG STATIC BLOG CONFIG
;; =============================================================================
(use-package! org-static-blog
  :config
  (setq
   org-static-blog-page-header
    "<meta name=\"author\" content=\"Aleksei Kuznetsov\">
    <meta name=\"referrer\" content=\"no-referrer\">
    <link href= \"https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css\" rel=\"stylesheet\" type=\"text/css\" />
    <link href= \"static/style.css\" rel=\"stylesheet\" type=\"text/css\" />
    <link rel=\"icon\" href=\"static/favicon.ico\">"
  org-static-blog-page-preamble
  "<div class=\"header\">
    <a href=\"https://neiro.io\">Neiro - Functional programming, software architecture</a>
  </div>"
   org-static-blog-use-preview t
   org-static-blog-publish-title "Neiro - Functional programming, software architecture"
   org-static-blog-publish-url "https://neiro.io/"
   org-static-blog-publish-directory "~/Projects/neiro.io/blog/"
   org-static-blog-posts-directory "~/Projects/neiro.io/posts/"
   org-static-blog-drafts-directory "~/Projects/neiro.io/drafts/"
   org-static-blog-enable-tags t
   org-export-with-toc t
   org-export-with-section-numbers t))

(after! org-agenda
  (setq org-agenda-files
        '("~/Dropbox/org/inbox.org"
          "~/Dropbox/org/habits.org"
          "~/Dropbox/org/gtd.org"
          "~/Dropbox/org/tickler.org")
        org-deadline-warning-days 8
        org-agenda-prefix-format
        '(
          (agenda  . "  • %?-12t% s") ;; file name + org-agenda-entry-type
          (timeline  . "  % s")
          (todo  . " %i %-12:c")
          (tags  . " %i %-12:c")
          (search . " %i %-12:c")))
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (add-hook 'auto-save-hook 'org-save-all-org-buffers nil t)
              (auto-save-mode))))

(when (window-system)
  (set-frame-font "Fira Code"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(beacon-color "#cc6666")
 '(custom-safe-themes
   '("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "bf387180109d222aee6bb089db48ed38403a1e330c9ec69fe1f52460a8936b66" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" "425cf02839fa7c5ebd6cb11f8074f6b8463ae6ed3eeb4cf5a2b18ffc33383b0b" default))
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
