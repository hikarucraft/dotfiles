
;;
;; hikarucraft's emacs config
;;

;; package

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)


;; key-bindings

(global-set-key (kbd "C-h") 'delete-backward-char)
(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)

(global-unset-key (kbd "C-x C-c"))

;; display config
(global-display-line-numbers-mode 1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-16"))

(setq-default indent-tab-mode nil)
(setq-default tab-width 4)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)

(electric-pair-mode 1)

(which-function-mode 1)
(show-paren-mode 1)

(setq frame-title-format "%f")
(setq ring-bell-function 'ignore)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))