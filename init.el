;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;;Setup load path
(load (expand-file-name "load-paths.el" user-emacs-directory))

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))


;; Make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Are we on a mac?
(setq running-on-a-mac (equal system-type 'darwin))

;; Setup el-get
(setq el-get-user-package-directory (expand-file-name "el-get-init-files" user-emacs-directory))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)

;; Setup package
(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     auto-complete
     rsense
     helm
     rvm
     org
     w3m
     jabber
     zencoding-mode
     zenburn-theme
     slime
     ac-slime
     exec-path-from-shell
     smex
     magit
     paredit
     move-text
     pretty-symbols
     dash
     s
     eproject
     rinari
     ;; god-mode
     ;; gist
     htmlize
     ;; visual-regexp
     ;; flycheck
     flx
     flx-ido
     ;; css-eldoc
     ;; yasnippet
     smartparens
     ido-vertical-mode
     ido-at-point
     ido-ubiquitous
     simple-httpd
     ;; guide-key
     nodejs-repl
     restclient
     ;; highlight-escape-sequences
     whitespace-cleanup-mode
     elisp-slime-nav
     git-commit-mode
     gitconfig-mode
     gitignore-mode
     clojure-mode
     find-file-in-project
     smooth-scrolling
     undo-tree
     visual-regexp
     visual-regexp-steroids
     web-mode
     ;;nrepl
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Elisp go-to-definition with M-. and back again with M-,
(autoload 'elisp-slime-nav-mode "elisp-slime-nav")
(add-hook 'emacs-lisp-mode-hook (lambda () (elisp-slime-nav-mode t) (eldoc-mode 1)))

;; Map files to modes
(require 'mode-mappings)

;; Setup extensions
(require 'setup-ffip)

(eval-after-load 'html-mode '(require setup-html-mode))

;; Start autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; Visual regexp
(require 'visual-regexp)
(define-key global-map (kbd "M-&") 'vr/query-replace)
(define-key global-map (kbd "M-/") 'vr/replace)

;; Smart M-x is smart
(require 'smex)
(smex-initialize)

(when running-on-a-mac (require 'mac))

;; Fix whitespace on save, but only if the file was clean
(global-whitespace-cleanup-mode)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Specifics for the current user
(when (file-exists-p user-settings-dir)
  (mapc 'load (directory-files user-settings-dir nil "^[^#].*el$")))
(put 'erase-buffer 'disabled nil)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

;Increase GC threshold
(setq gc-cons-threshold 20000000)
