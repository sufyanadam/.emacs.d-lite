(require 'rinari)

(add-hook 'ruby-mode-hook
	  (lambda ()
      (rvm-activate-corresponding-ruby)
      (ruby-electric-mode)
      (setq rinari-tags-file-name "TAGS")))
