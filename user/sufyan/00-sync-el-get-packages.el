(require 'el-get)

(setq sa-my-packages
      (append
       '(
	 rcodetools
	 ;; org-mode
	 ;; emacs-w3m
	 ;; emacs-jabber
	 ;; zencoding-mode
	 ;; zenburn-theme
	 ;; slime
	 ;; exec-path-from-shell
	 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get-cleanup sa-my-packages)
(el-get 'sync sa-my-packages)
