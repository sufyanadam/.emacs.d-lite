(require 'el-get)

(setq my-packages
      (append
       '(
         ri-emacs
         rcodetools
         ruby-electric
         org-mode
         epl
         pkg-info
         projectile
         nav
         window-numbering
         edbi
         js2-refactor
         expand-region
         skewer-mode
         skewer-less
         coffee-mode
         haml-mode
         slim-mode
         popwin
         direx
         ;deferred 
         ;epc
         ;ctable
         ;anything
         ;anything-show-completion
         ;anything-rcodetools
         )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get-cleanup my-packages)
(el-get 'sync my-packages)
