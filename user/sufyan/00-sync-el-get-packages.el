(require 'el-get)

(setq my-packages
      (append
       '(
	 rcodetools
	 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)
