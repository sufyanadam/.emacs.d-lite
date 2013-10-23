(require 'el-get)

(setq sa-my-packages
      (append
       '(
	 rvm
	 rcodetools
	 org-mode
	 emacs-w3m
	 emacs-jabber
	 zencoding-mode
	 zenburn-theme
	 slime
	 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get-cleanup sa-my-packages)
(el-get 'sync sa-my-packages)
