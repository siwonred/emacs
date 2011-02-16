(add-to-list 'load-path "~/.emacs.d")

;;Test Key Binding
(defmacro global-defkey (key def)
"*Bind KEY globally to DEF.
nKEY should be a string in the format used for saving keyboard
macros (cf. 'insert-kbd-macro')."
`(global-set-key (read-kbd-macro,key),def))


(setq vc-handled-backends nil)


;;;;;;;;;;;;;;;;;;;;;;;
;;; Eshell Settings ;;;
;;;;;;;;;;;;;;;;;;;;;;;

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq-default ansi-color-names-vector ["black" "red" "green" "yellow" "blue"
                                       "magenta" "cyan" "white" ] )

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


;; Whitespace
(require 'whitespace)
(setq whitespace-line-column 90)

; (setq whitespace-style '(trailing))

(add-hook 'php-mode-hook (lambda ()
         (setq whitespace-style '(lines-tail))))

; (add-hook 'nxhtml-mode-hook (lambda ()
;         (setq whitespace-style '(trailing))))

; (setq whitespace-style '(trailing))

(global-whitespace-mode 1)

(set-face-attribute 'whitespace-line nil
        :background "#111"
        :foreground "yellow")
(set-face-attribute 'whitespace-tab nil
        :background "red1"
        :foreground "yellow"
        :weight 'bold)
(set-face-attribute 'whitespace-trailing nil
        :background "red1"
        :foreground "yellow"
        :weight 'bold)


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

;(setq-default indent-tabs-mode nil)
;(setq c-syntactic-indentation nil)

; (setq-default c-basic-offset 2
;              tab-width 2)

; (setq-default indent-tabs-mode nil)
; (setq-default tab-width 2)
; (setq indent-line-function 'insert-tab)

(setq inhibit-splash-screen t)         ; hide welcome screen


;; Mac Key Mode
(require 'redo)
(require 'mac-key-mode)
(mac-key-mode 1)

(global-defkey "A-C-z" 'redo)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 '(tab-width 2)
 '(c-basic-offset tab-width)
 '(js-indent-level tab-width)
 '(nxml-child-indent tab-width)
 '(css-indent-offset tab-width)
 '(mumamo-submode-indent-offset tab-width)
)

(add-hook 'nxml-mode-hook
          (lambda () (rng-validate-mode 0) )t)

(setq cssm-indent-level 2)
; (setq cssm-newline-before-closing-bracket t)
(setq cssm-mirror-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun clean-php-mode ()
  (interactive)
  (php-mode)
  (setq c-basic-offset 2) ; 2 tabs indenting
  (setq indent-tabs-mode nil)
  (setq fill-column 88)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-close 'c-lineup-arglist-operators))
(c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
(c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values

(setq indent-tabs-mode nil)

;;    (load "YOUR-PATH-TO/nxhtml/autostart.el")
(load "~/.emacs.d/nxhtml/autostart.el")
(require 'nxml-mode)
(setq mumamo-background-colors nil)
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . nxhtml-mumamo-mode))

(add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))


; (set-face-background 'default "#111")
; (set-background-color "#111")

; (add-to-list 'auto-mode-alist '("\\.ctp\\'" . c-mode))
; (add-to-list 'auto-mode-alist '("\\.html\\'" . c-mode))
;(add-to-list 'auto-mode-alist '("\\.xxx\\'" . nxhtml-mumamo-mode))
;(add-to-list 'auto-mode-alist '("\\.ctp\\'" . nxhtml-mumamo-mode))

;; php

;(autoload 'php-mode "php-mode" "PHP editing mode" t)
;(add-hook 'php-mode-user-hook 'turn-on-font-lock)


;(add-to-list 'load-path "~/.emacs.d/mmm-mode-0.4.8")
;(require 'mmm-mode)
;(setq mmm-global-mode 'maybe)

;;;; Different Background Coloring for javascript and php in mmm-mode
;(setq mmm-submode-decoration-level '1)
;(set-face-background 'mmm-default-submode-face "#050505")

; (set-face-background 'mmm-default-submode-face "#222")
; (set-face-background 'mmm-code-submode-face "#333")

; (set-face-background 'mmm-default-submode-face nil)

;(mmm-add-classes
; '(
;   (html-php
;    :submode php-mode
;    :face mmm-code-submode-face
;    :front "<[?]"
;    :back "[?]>"
;    )
;   (html-css-embedded
;    :submode css-mode
;    :face mmm-declaration-submode-face
;    :front "<style\[^>\]*>"
;    :back "</style>")
;   (html-css-attribute
;    :submode css-mode
;    :face mmm-declaration-submode-face
;    :front "\\bstyle=\\s-*\""
;    :back "\"")
;   (html-javascript-embedded
;    :submode javascript-generic-mode
;    :face mmm-code-submode-face
;    :front "<script\[^>\]*>"
;    :back "</script>")
;   (html-javascript-attribute
;    :submode javascript-generic-mode
;    :face mmm-code-submode-face
;    :front "\\bon\\w+=\\s-*\""
;    :back "\"")
;   )
; )

; (mmm-add-mode-ext-class nil "\\.php\\'" 'html-php)
; (mmm-add-mode-ext-class nil "\\.ctp\\'" 'html-php)

; (add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))
; (add-to-list 'auto-mode-alist '("\\.ctp\\'" . html-mode))

; (add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-php))

;; Javascript Mode
;(cond
; ((not (eq system-type 'windows-nt))
;  (require 'generic-x)
;  (add-to-list 'generic-extras-enable-list 'javascript-generic-mode)
;))
;; Javascript in HTML Mode
;(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-js))
;; Javascript in PHP Mode
;(add-to-list 'mmm-mode-ext-classes-alist '(php-mode nil html-js))

;; CSS Mode
;(autoload 'css-mode "css-mode" "Mode for editing CSS files" t)
;(setq auto-mode-alist
;      (append '(("\\.css$" . css-mode))
;              auto-mode-alist))

;; CSS in HTML and PHP modes
;(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-css))
;(add-to-list 'mmm-mode-ext-classes-alist '(html-mode nil html-css-inline))
;(add-to-list 'mmm-mode-ext-classes-alist '(php-mode nil html-css))
;(add-to-list 'mmm-mode-ext-classes-alist '(php-mode nil html-css-inline))


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

(setq shift-select-mode t)
; Now on by default: allows shifted cursor-keys to control the region.
(setq mouse-drag-copy-region nil)
; stops selection with a mouse being immediately injected to the


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


(add-hook 'write-file-hooks 'delete-trailing-whitespace)

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

; (global-visual-line-mode 1) ; 1 for on, 0 for off.
; (global-linum-mode t)

(line-number-mode 1)                  ; mode line 에 라인수를 표시한다
(column-number-mode 1) ; mode line 에 컬럼을 표시한다(기본이 아니더라)

(setq-default truncate-lines t) ; 화면을 벗어나는 긴 줄처리 toggle-truncate-lines 참고

(tool-bar-mode -1)                   ; toolbar 는 거의 안쓰니 꺼버린다


; (tooltip-mode nil)
; (visual-line-mode nil t)

; set font
;
(set-default-font "Menlo-13")
(set-frame-font "Menlo-13")
; (global-font-lock-mode 1)
; (set-face-attribute 'default nil :font "Menlo-16")
; (set-face-font 'default "Menlo-16")

; (set-default-font "-apple-Menlo-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")
; (set-default-font "-apple-dejavu sans mono-medium-r-normal--0-0-0-0-m-0-mac-roman")

; (set-fontset-font "set-default-font" "NANumGothicCoding-13")
; (set-fontset-font "fontset-default" 'hangul '("NANumGothicCoding" . "unicode-bmp")) ;;; 유니코드 사용자 영역

;(set-fontset-font "fontset-default" '(#x1100 . #xffdc)
;                  '("NANumGothicCoding" . "unicode-bmp"))
;;; 유니코드 한글영역...NanumGothicCoding에다가 원하는폰트를 적는다
; (set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
;                  '("NanumGothicCoding" . "unicode-bmp"))
;;;유니코드 사용자 영역
;;;
;;;
;;;

(set-fontset-font "fontset-default" '(#x1100 . #xffdc)  '("NANumGothicCoding" . "unicode-bmp")) ;
(set-fontset-font "fontset-default" '(#xe0bc . #xf66e)  '("NanumGothicCoding" . "unicode-bmp")) ;
;(set-fontset-font "fontset-default" 'kana '("AppleGothic" . "unicode-bmp"))
;(set-fontset-font "fontset-default" 'han '("AppleGothic" . "unicode-bmp"))

(setq shift-select-mode t)
(cua-selection-mode nil)

;(add-hook 'css-mode-hook
;          '(lambda()
;             (setq css-indent-offset 2)
;             (setq c-basic-offset 2)
;             (setq indent-tabs-mode nil)))
