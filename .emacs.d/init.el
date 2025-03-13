
;;
;; hikarucraft's emacs config
;;

;; LIBRARY_PATH
(setenv "LIBRARY_PATH"
        (string-join
         '("/opt/homebrew/opt/gcc/lib/gcc/14"
           "/opt/homebrew/opt/libgccjit/lib/gcc/14"
           "/opt/homebrew/opt/gcc/lib/gcc/14/gcc/aarch64-apple-darwin23/14")
         ":"))
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))
;; package

(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t) 

;; revert buffer
(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (revert-buffer t t))

(global-set-key (kbd "C-c C-r") 'revert-buffer-no-confirm)

(global-auto-revert-mode 1)
(global-set-key (kbd "M-5") 'query-replace)
;; key-bindings

(global-set-key (kbd "C-h") 'delete-backward-char)
(setq mac-option-modifier nil)
(setq mac-command-modifier 'meta)

(global-unset-key (kbd "C-x C-c"))
(setq keyboard-delay 0)
(setq key-sequence-delay 0.02)
;; display config
(global-display-line-numbers-mode 1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(add-to-list 'default-frame-alist '(font . "JetBrainsMono Nerd Font-16"))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

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

(add-hook 'js-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
(add-hook 'json-mode-hook (lambda () (electric-indent-local-mode -1)))


;; web-mode
;;(require 'web-mode)
;;(add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . web-mode))
(use-package web-mode
  :ensure t
  :mode (("\\.html?\\'" . web-mode)
         ("\\.css\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)
         ;; ("\\.ts[x]?\\'" . web-mode)    
         )
  :config
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-markup-indent-offset 2)  ;; インデント設定
  (setq web-mode-css-indent-offset 2)     ;; CSS インデント設定
  (setq web-mode-code-indent-offset 2)    ;; JavaScript/TypeScript インデント設定
  (setq web-mode-indent-style 2)          ;; インデントスタイル設定
  (setq web-mode-indent-params t))        ;; パラメータのインデント設定
(setq web-mode-tag-auto-close-style 2)

(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" "\\.yaml\\'") ; .yml や .yaml ファイルで自動的に有効化
  :config
  (setq yaml-indent-offset 2)) ; YAMLのインデント幅を設定

(use-package highlight-indent-guides
  :ensure t
  :hook ((prog-mode yaml-mode) . highlight-indent-guides-mode) ; プログラムモードと YAML モードで有効化
  :config
  (setq highlight-indent-guides-method 'character) ; 表示方法を指定 ('character, 'fill, 'column のいずれか)
  (setq highlight-indent-guides-auto-enabled t)   ; 自動的にガイドを有効化
  (setq highlight-indent-guides-responsive 'top)) ; レスポンシブモードを有効化
(put 'upcase-region 'disabled nil)

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode)
  :custom
  (markdown-fontify-code-blocks-natively t) ;; コードブロックのフォントを強調
  (markdown-header-scaling t) ;; ヘッダーのスケーリングを有効化
  (markdown-indent-on-enter 'indent-and-new-item) ;; Enterでインデントと新しいリスト項目を作成
 )


(setq typescript-ts-mode-indent-offset 2)
(setq tsx-ts-mode-indent-offset 2)
(setq treesit-font-lock-level 4)

(use-package typescript-ts-mode
  :mode (("\\.tsx\\'" . tsx-ts-mode)
         ("\\.ts\\'" . typescript-ts-mode))
  :config
  (setq typescript-ts-mode-indent-offset 2))

(use-package treesit-auto
  :ensure t
  :init
  (require 'treesit-auto)
  (global-treesit-auto-mode)
  :config
  (setq treesit-auto-install t))

;; (setq treesit-language-source-alist
;;       '((typescript "https://github.com/tree-sitter/tree-sitter-typescript")
;;         (tsx "https://github.com/tree-sitter/tree-sitter-tsx")))
(use-package eglot
  :ensure t
  :hook ((typescript-ts-mode . eglot-ensure)   ;; typescript-ts-mode 用の設定
         (tsx-ts-mode . eglot-ensure))          ;; tsx-ts-mode 用の設定
  :config
  ;; LSP サーバーが起動した際に自動的に設定されるオプションをカスタマイズできます
  (define-key eglot-mode-map (kbd "M-.") 'xref-find-definitions)
  (define-key eglot-mode-map (kbd "M-,") 'pop-tag-mark)
  (setq eglot-autoshutdown t)                  ;; 編集が終わると自動でサーバーをシャットダウン
  (setq eglot-confirm-server-initiated-edits nil)
  (add-to-list 'eglot-server-programs
                '(typescript-ts-mode . ("typescript-language-server" "--stdio")))

) ;; 編集時に確認を求めないように設定
(use-package corfu
  :ensure t
  :custom ((corfu-auto t)
           (corfu-auto-prefix 1)
           (corfu-auto-delay 0)
           (corfu-cycle t))
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode))

(use-package cape
  :ensure t
  :init
  ;; Add `completion-at-point-functions', used by `completion-at-point'.
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  ;; (add-to-list 'completion-at-point-functions #'cape-history)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  ;; (add-to-list 'completion-at-point-functions #'cape-tex)
  ;; (add-to-list 'completion-at-point-functions #'cape-sgml)
  ;; (add-to-list 'completion-at-point-functions #'cape-rfc1345)
  ;; (add-to-list 'completion-at-point-functions #'cape-abbrev)
  ;; (add-to-list 'completion-at-point-functions #'cape-ispell)
  ;; (add-to-list 'completion-at-point-functions #'cape-dict)
  ;; (add-to-list 'completion-at-point-functions #'cape-symbol)
  ;; (add-to-list 'completion-at-point-functions #'cape-line)
)
;; (use-package eglot
;;   :ensure t
;;   :hook ((web-mode . eglot-ensure))  ;; web-mode で TypeScript の補完を有効化
;;   :config
;;   (add-to-list 'eglot-server-programs
;;                '(web-mode . ("typescript-language-server" "--stdio"))))


