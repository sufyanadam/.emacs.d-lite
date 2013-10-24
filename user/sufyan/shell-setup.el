(when (equal system-type 'darwin)
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
