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
(setq color-theme-is-global t)
(color-theme-arjen)

(set-face-background 'region "blue")


;;;;;;;;;;;;;;;;;;;;;;;;
;;; Icicles Settings ;;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-to-list 'load-path "~/.emacs.d/icicles/")
;; (require 'icicles)
;; (load "~/.emacs.d/icicles/icicles.el")
;; (icy-mode 1)


;;;;;;;;;;;;;;;;
;; Whitespace ;;
;;;;;;;;;;;;;;;;

(require 'whitespace)

(add-hook 'php-mode-hook (lambda ()
                           (setq whitespace-line-column 90)
                           (setq whitespace-style '(lines-tail))
                           (whitespace-mode 1)))

                                        ; (setq whitespace-line-column 90)
                                        ; (setq whitespace-style '(lines-tail))


                                        ; (add-hook 'nxhtml-mode-hook (lambda ()
                                        ;         (setq whitespace-style '(trailing))))

                                        ; (setq whitespace-style '(trailing))



(set-face-attribute 'whitespace-line nil
                    :background "#444"
                    :foreground "yellow")
(set-face-attribute 'whitespace-tab nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-trailing nil
                    :background "red1"
                    :foreground "yellow"
                    :weight 'bold)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

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

(setq inhibit-splash-screen t)         ; hide welcome screen


;; Mac Key Mode
(require 'redo)
(require 'mac-key-mode)
(mac-key-mode 1)

(global-defkey "A-C-z" 'redo)


;;;;;;;;;;;;
;; Indent ;;
;;;;;;;;;;;;

(setq-default c-basic-offset 2
              js-indent-level 2
              css-indent-offset 2
              mumamo-submode-indent-offset 2
              tab-width 2)

(setq-default indent-tabs-mode nil)

(defun pear/php-mode-init()
  "Set some buffer-local variables."
  (setq case-fold-search t)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close '0)
)

(add-hook 'php-mode-hook 'pear/php-mode-init)

;;;;;;;;;;;;
;; NXHTML ;;
;;;;;;;;;;;;

(load "~/.emacs.d/nxhtml/autostart.el")
(require 'nxml-mode)
(setq mumamo-background-colors nil)
(add-hook 'nxml-mode-hook
          (lambda () (rng-validate-mode 0) )t)


;;;;;;;;;;
;; Mode ;;
;;;;;;;;;;

(add-to-list 'auto-mode-alist '("\\.ctp\\'" . nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.php?\\'" . php-mode))


;;;;;;;;;;;;;;;
;; Selection ;;
;;;;;;;;;;;;;;;

(setq shift-select-mode t)
(setq mouse-drag-copy-region nil)

;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete 1.3 ;;
;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(set-face-background 'ac-selection-face "steelblue")


;;;;;;;;;;;;;;;;;;;;;;;;
;; Backward Kill Line ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(defun backward-kill-line (arg)
  "Kill chars backward until encountering the end of a line."
  (interactive "p")
  (kill-line 0))

(global-defkey "<A-backspace>" 'backward-kill-line)

;;;;;;;;;;;;;;;
;; Selection ;;
;;;;;;;;;;;;;;;
(delete-selection-mode 1) ; make typing override text selection
(setq shift-select-mode t)
(cua-selection-mode nil)

;;;;;;;;;;
;; Line ;;
;;;;;;;;;;

(global-visual-line-mode 1) ; 1 for on, 0 for off.
(global-linum-mode t)
(setq-default truncate-lines nil) ; 화면을 벗어나는 긴 줄처리
; (toggle-truncate-lines nil)

;;;;;;;;;;;;;;;;;
;; transparent ;;
;;;;;;;;;;;;;;;;;

(setq transparency-level 90)
(set-frame-parameter nil 'alpha transparency-level)


;;;;;;;;;;
;; Font ;;
;;;;;;;;;;

(set-default-font "Menlo-13")
(set-frame-font "Menlo-13")

(set-fontset-font "fontset-default" '(#x1100 . #xffdc)  '("NANumGothicCoding" . "unicode-bmp")) ;
(set-fontset-font "fontset-default" '(#xe0bc . #xf66e)  '("NanumGothicCoding" . "unicode-bmp")) ;


;;;;;;;;;;;;
;; Cursor ;;
;;;;;;;;;;;;

(blink-cursor-mode 1)                    ; No blinking cursor
(setq-default cursor-in-non-selected-windows nil)
(setq-default cursor-type 'bar)

;;;;;;;;;;
;; Bell ;;
;;;;;;;;;;
(setq ring-bell-function 'ignore)

;;;;;;;;;;;;;;;;;;;;;;;
(setq make-backup-files nil)

(scroll-bar-mode -1)

(line-number-mode 1)                  ; mode line 에 라인수를 표시한다
(column-number-mode 1) ; mode line 에 컬럼을 표시한다(기본이 아니더라)

(tool-bar-mode -1)                   ; toolbar 는 거의 안쓰니 꺼버린다

;; (server-start)
