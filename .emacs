(add-to-list 'load-path "~/.emacs.d")

;;Test Key Binding
(defmacro global-defkey (key def)
"*Bind KEY globally to DEF.
nKEY should be a string in the format used for saving keyboard
macros (cf. 'insert-kbd-macro')."
`(global-set-key (read-kbd-macro,key),def))


;;;;;;;;;;;;;;;;;;;;;;;
;;; Eshell Settings ;;;
;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq-default ansi-color-names-vector ["black" "red" "green" "yellow" "blue" "magenta" "cyan"
                                       "white" ] )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Color-theme Settings ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
;(color-theme-katester)
;(color-theme-feng-shui)
(setq color-theme-is-global t)
(color-theme-arjen)


;;;;;;;;;;;;;;;;;;;;;;;;
;;; Icicles Settings ;;;
;;;;;;;;;;;;;;;;;;;;;;;;

;(add-to-list 'load-path "~/.emacs.d/icicles/")
;(require 'icicles)
;(load "~/.emacs.d/icicles/icicles.el")
;(icy-mode 1)

;;;;;;;;;;;;;;;;;;;;;;
;;; Other Settings ;;;
;;;;;;;;;;;;;;;;;;;;;;

(defun reload-dotemacs ()
  "Reload .emacs"
  (interactive)
  (load-file "~/.emacs")
)

(global-defkey "<f3>" 'comment-dwim)
(global-defkey "<C-f5>" 'reload-dotemacs)
;(global-defkey "<C-tab>" 'other-window)
(global-defkey "<backtab>" 'previous-window)
(global-defkey "<RET>" 'newline-and-indent)
(global-defkey "C-x C-b" 'buffer-menu)

(setq-default indent-tabs-mode nil)

(setq inhibit-splash-screen t)         ; hide welcome screen


;; Mac Key Mode
(require 'redo)
(require 'mac-key-mode)
(mac-key-mode 1)

(global-defkey "A-C-z" 'redo)

(set-face-background 'default "#111")
(set-background-color "#111")


;;    (load "YOUR-PATH-TO/nxhtml/autostart.el")
; (load "~/.emacs.d/nxhtml/autostart.el")
; (require 'nxml-mode)

;(add-to-list 'auto-mode-alist '("\\.ctp\\'" . c-mode))
;(add-to-list 'auto-mode-alist '("\\.html\\'" . c-mode))
;(add-to-list 'auto-mode-alist '("\\.xxx\\'" . nxhtml-mumamo-mode))
;(add-to-list 'auto-mode-alist '("\\.ctp\\'" . nxhtml-mumamo-mode))

(add-to-list 'load-path "~/.emacs.d/mmm-mode-0.4.8")
(require 'mmm-mode)
; (setq mmm-global-mode 'maybe)

;;;; Different Background Coloring for javascript and php in mmm-mode
; (setq mmm-submode-decoration-level '0)
; (set-face-background 'mmm-default-submode-face "#222")
(set-face-background 'mmm-default-submode-face nil)


(mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
(mmm-add-mode-ext-class nil "\\.ctp?\\'" 'html-php)
(mmm-add-classes
 '(
   (html-php
    :submode php-mode
    :face mmm-code-submode-face
    :front "<[?]php"
    :back "[?]>"
    )
   (html-js
    :submode javascript-generic-mode
    :face mmm-declaration-submode-face
    :front "<script language=\"javascript\""
    :back "</script>"
    )
   (html-css
    :submode css-mode
    :face mmm-cleanup-submode-face
    :front "<style "
    :back "</style>"
    )
   (html-css-inline
    :submode css-mode
    :face mmm-cleanup-submode-face
    :front "style=\""
    :back "\""
    )
   )
)
(autoload 'php-mode "php-mode" "PHP editing mode" t)
(add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.ctp?\\'" . php-mode))


(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-php))

;; Javascript Mode
(cond
 ((not (eq system-type 'windows-nt))
  (require 'generic-x)
  (add-to-list 'generic-extras-enable-list 'javascript-generic-mode)
))
;; Javascript in HTML Mode
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-js))
;; Javascript in PHP Mode
(add-to-list 'mmm-mode-ext-classes-alist '(php-mode nil html-js))

;; CSS Mode
(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)
(setq auto-mode-alist
      (append '(("\\.css$" . css-mode))
              auto-mode-alist))

;; CSS in HTML and PHP modes
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-css))
(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-css-inline))
(add-to-list 'mmm-mode-ext-classes-alist '(php-mode nil html-css))
(add-to-list 'mmm-mode-ext-classes-alist '(php-mode nil html-css-inline))
; (autoload 'php-mode "php-mode" "PHP editing mode" t)
; (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
; (add-to-list 'auto-mode-alist '("\\.ctp$" . html-mode))




;; Highline
; (require 'highline)
; (highline-mode 1)

;; To customize the background color
; (set-face-background 'highline-face "#080808")

; (blink-cursor-mode nil)
; (scroll-bar-mode nil)

; (set-default 'cursor-type 'bar)


; Copy and Paste
; (transient-mark-mode 1)  ; Now on by default: makes the region act quite like the text "highlight"
; in many apps.
(setq shift-select-mode t) ; Now on by default: allows shifted cursor-keys to control the region.
(setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the
; kill ring
; (setq x-select-enable-primary nil)  ; stops killing/yanking interacting with primary X11 selection
; (setq x-select-enable-clipboard t)  ; makes killing/yanking interact with clipboard X11 selection
;; these will probably be already set to these values, leave them that way if so!
; (setf interprogram-cut-function 'x-select-text)
; (setf interprogram-paste-function 'x-cut-buffer-or-selection-value)
; You need an emacs with bug #902 fixed for this to work properly.
; It has now been fixed in CVS HEAD.
; it makes "highlight/middlebutton" style (X11 primary selection based) copy-paste work as expected
; if you're used to other modern apps (that is to say, the mere act of highlighting doesn't
; overwrite the clipboard or alter the kill ring, but you can paste in merely highlighted
; text with the mouse if you want to)
; (setq select-active-regions t) ;  active region sets primary X11 selection
; (global-set-key [mouse-2] 'mouse-yank-primary)  ; make mouse middle-click only paste from primary
; X11 selection, not clipboard and kill ring.
;; with this, doing an M-y will also affect the X11 clipboard, making emacs act as a sort of
; clipboard history, at
;; least of text you've pasted into it in the first place.
; (setq yank-pop-change-selection t)  ; makes rotating the kill ring change the X11 clipboard.

; (global-set-key "\C-w" 'clipboard-kill-region)
; (global-set-key "\M-w" 'clipboard-kill-ring-save)
; (global-set-key "\C-y" 'clipboard-yank)

;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete 1.3 ;;
;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(set-face-background 'ac-selection-face "steelblue")


(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))

(global-defkey "<A-backspace>" 'backward-kill-line)


;; Whitespace
(require 'whitespace)
(setq whitespace-line-column 100)
(setq whitespace-style '(tabs tab-mark trailing lines-tail))
(global-whitespace-mode 1)

(set-face-attribute 'whitespace-line nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-tab nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-trailing nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)

; (add-hook 'write-file-hooks 'delete-trailing-whitespace)

(defun my-bell-function ()
  (unless (memq this-command
                '(isearch-abort abort-recursive-edit exit-minibuffer
                                keyboard-quit mwheel-scroll down up next-line previous-line
                                backward-char forward-char))
    (ding)))

(setq ring-bell-function 'my-bell-function)


; autobackup
(setq make-backup-files nil)

; scroll bar disable
(scroll-bar-mode -1)

(delete-selection-mode 1) ; make typing override text selection

(global-visual-line-mode 1) ; 1 for on, 0 for off.
(global-linum-mode t)
; (tooltip-mode nil)
; (visual-line-mode nil t)

; set font
(set-default-font "Menlo-13")
(set-fontset-font "fontset-default" '(#x1100 . #xffdc)  '("NANumGothicCoding" . "unicode-bmp"))
;;; 유니코드 한글영역...NanumGothicCoding에다가 원하는폰트를 적는다
(set-fontset-font "fontset-default" '(#xe0bc . #xf66e)  '("NanumGothicCoding" . "unicode-bmp"))
;;;유니코드 사용자 영역

(setq shift-select-mode t)
(cua-selection-mode nil)