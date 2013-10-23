(when (equal system-type 'darwin)
  (require 'exec-path-from-shell)
  (exec-path-from-shell-initialize))
