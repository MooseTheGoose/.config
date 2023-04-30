; I like this personal convention and I occasionally
; hack the kernel, so I keep this as a solid default.
(setq c-default-style "linux" c-basic-offset 8)

; Various EVIL configurations I like
(global-set-key (kbd "M-u") 'universal-argument)
(setq evil-want-C-u-scroll t)

; Commands to install packages
; I don't like to update packages automatically as
; it impacts the startup time of emacs quite a bit.
; Instead, I'll occasionally uncomment this out to update.
; Even if I live inside emacs, I'd like to get inside
; my home as conveniently as possible.
;;;;;;;; COMMENT BLOCK ;;;;;;;;
;(require 'package)
;(add-to-list 'package-archives
;             '("melpa" . "https://melpa.org/packages/"))
;(package-initialize)
;(package-refresh-contents)
;(unless (package-installed-p 'evil) (package-install 'evil))
;;;;;;;; END COMMENT ;;;;;;;;

(require 'evil)
(evil-mode 1)

