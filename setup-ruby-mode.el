;; avoid ridiculous ruby indentation
(setq ruby-deep-indent-paren nil)

(defun ruby--jump-to-test ()
  (find-file
   (replace-regexp-in-string
    "/lib/" "/spec/"
    (replace-regexp-in-string
     "/\\([^/]+\\).rb$" "/spec_\\1.rb"
     (buffer-file-name)))))

(defun ruby--jump-to-lib ()
  (find-file
   (replace-regexp-in-string
    "/spec/" "/lib/"
    (replace-regexp-in-string
     "/spec_\\([^/]+\\).rb$" "/\\1.rb"
     (buffer-file-name)))))

(defun ruby-jump-to-other ()
  (interactive)
  (if (string-match-p "/spec/" (buffer-file-name))
      (ruby--jump-to-lib)
    (ruby--jump-to-test)))

(define-key ruby-mode-map (kbd "M- t") 'ruby-jump-to-other)

(provide 'setup-ruby-mode)
