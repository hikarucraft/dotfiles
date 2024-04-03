
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

;; executable path
(setq exec-path (append exec-path '("~/.nvm/versions/node/v20.11.0/bin")))
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;;(require 'lsp-tailwindcss)
;; web-mode

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts[x]?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))
(add-hook 'web-mode-hook #'lsp)


;; company

(require 'company)

(global-company-mode)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-h") nil)

(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-m") 'company-complete-selection)

;; key-bindings

(global-set-key (kbd "C-h") 'delete-backward-char)

;; display config
(global-display-line-numbers-mode 1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(add-to-list 'default-frame-alist '(font . "Inconsolata Nerd Font Mono-18"))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(exec-path-from-shell magit git-gutter web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
