(add-to-list 'load-path "~/.emacs.d")

;;Test Key Binding
(defmacro global-defkey (key def)
  "*Bind KEY globally to DEF.
nKEY should be a string in the format used for saving keyboard
macros (cf. 'insert-kbd-macro')."
  `(global-set-key (read-kbd-macro,key),def))


;; To stop vc
; (setq vc-handled-backends nil)

; (require 'git)Applications/

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
(set-variable 'x-select-enable-clipboard t)

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

; (add-hook 'diff-mode-hook (lambda () (setq truncate-lines nil)))
; (toggle-truncate-lines nil)
; (set-variable 'truncate-lines nil)
(setq truncate-lines nil)
(setq truncate-partial-width-windows nil)

(global-set-key (kbd "<f7>") 'toggle-truncate-lines)

;;;;;;;;;;;;;;;;;
;; Transparent ;;
;;;;;;;;;;;;;;;;;

(setq transparency-level 90)
(set-frame-parameter nil 'alpha transparency-level)

(defun djcb-opacity-modify (&optional dec)
  "modify the transparency of the emacs frame; if DEC is t,
    decrease the transparency, otherwise increase it in 10%-steps"
  (let* ((alpha-or-nil (frame-parameter nil 'alpha)) ; nil before
         setting
         (oldalpha (if alpha-or-nil alpha-or-nil 100))
         (newalpha (if dec (- oldalpha 10) (+ oldalpha 10))))
    (when (and (>= newalpha frame-alpha-lower-limit) (<= newalpha
                                                         100))
      (modify-frame-parameters nil (list (cons 'alpha newalpha))))))

;; C-8 will increase opacity (== decrease transparency)
;; C-9 will decrease opacity (== increase transparency
;; C-0 will returns the state to normal
(global-set-key (kbd "C-8")
                '(lambda()(interactive)(djcb-opacity-modify)))
(global-set-key (kbd "C-9")
                '(lambda()(interactive)(djcb-opacity-modify t)))
(global-set-key (kbd "C-0") '(lambda()(interactive)
                               (modify-frame-parameters nil `((alpha
                                                               . 100)))))


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


;;;;;;;;;;;;;;;;;
;; Auto Backup ;;
;;;;;;;;;;;;;;;;;

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control nil)       ; don't use versioned backups

(setq make-backup-files nil)
(setq vc-make-backup-files nil)


;;;;;;;;;;;;;
;; Scratch ;;
;;;;;;;;;;;;;

;;; auto save and restore scratch buffer
(defun save-scratch-data ()
  (let ((str (progn
               (set-buffer (get-buffer "*scratch*"))
               (buffer-substring-no-properties
                (point-min) (point-max))))
        (file "~/.scratch"))
    (if (get-file-buffer (expand-file-name file))
        (setq buf (get-file-buffer (expand-file-name file)))
      (setq buf (find-file-noselect file)))
    (set-buffer buf)
    (erase-buffer)
    (insert str)
    (save-buffer)
    (kill-buffer buf)))

(defadvice save-buffers-kill-emacs
  (before save-scratch-buffer activate)
  (save-scratch-data))

(defun read-scratch-data ()
  (let ((file "~/.scratch"))
    (when (file-exists-p file)
      (set-buffer (get-buffer "*scratch*"))
      (erase-buffer)
      (insert-file-contents file))
    ))

(read-scratch-data)

;;;;;;;;;;;;;;;;;;;;;;;
;; Recent open Files ;;
;;;;;;;;;;;;;;;;;;;;;;;

(when (require 'recentf nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-save-timer
        (run-with-idle-timer 10 t 'recentf-save-list))
  (recentf-mode 1))

;;;;;;;;;;
;; Redo ;;
;;;;;;;;;;

(require 'redo)


;;;;;;;;;;;;;
;; Mac Key ;;
;;;;;;;;;;;;;

(require 'mac-key-mode)
(mac-key-mode 1)

(global-defkey "A-C-z" 'redo)

;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-splash-screen t)         ; hide welcome screen

(scroll-bar-mode -1)

(line-number-mode 1)                  ; mode line 에 라인수를 표시한다
(column-number-mode 1) ; mode line 에 컬럼을 표시한다(기본이 아니더라)

(tool-bar-mode -1)                   ; toolbar 는 거의 안쓰니 꺼버린다

;; (server-start)


;;;;;;;;;;;;;;;;
;; Stop Debug ;;
;;;;;;;;;;;;;;;;

(setq debug-on-error nil)
(setq-default debug-on-error nil)


;;;;;;;;;;;
;; Growl ;;
;;;;;;;;;;;
(defun growl (title message)
  (start-process "growl" " growl"
                 "/usr/local/bin/growlnotify"
                 title
                 "-a" "Emacs")
  (process-send-string " growl" message)
  (process-send-string " growl" "\n")
  (process-send-eof " growl"))

;;;;;;;;;
;; Erc ;;
;;;;;;;;;

(defun my-erc-hook (match-type nick message)
  "Shows a growl notification, when user's nick was mentioned. If the buffer is currently not visible, makes it sticky."
  (and ; (eq match-type 'current-nick)
       (not (erc-buffer-visible (current-buffer)))
       (growl
        (concat "ERC: name mentioned on: " (buffer-name (current-buffer)))
        message
        )))

(add-hook 'erc-text-matched-hook 'my-erc-hook)

;; (setq erc-insert-timestamp-function 'erc-insert-timestamp-left)
