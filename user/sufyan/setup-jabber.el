(add-to-list 'load-path "el-get/emacs-jabber")
(require 'jabber-autoloads)

(setq jabber-account-list '(
			    ("sufyan.adam@gmail.com"
			     (:network-server . "talk.google.com")
			     (:connection-type . ssl)
			     (:port . 443))
			    ("20346_101211@chat.hipchat.com"
			     (:network-server . "chat.hipchat.com")
			     (:connection-type . ssl))))
