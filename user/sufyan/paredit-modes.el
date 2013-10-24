;; Enable paredit for the following modes
(add-hook 'clojure-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'nrepl-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'ruby-mode-hook (lambda () (paredit-mode 1)))
