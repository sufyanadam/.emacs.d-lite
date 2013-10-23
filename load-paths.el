;; Set up load path
(add-to-list 'load-path user-emacs-directory)

;el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "user/" user-login-name))
(add-to-list 'load-path user-settings-dir)

