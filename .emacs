;; .emacs

;; default to better frame titles
(setq frame-title-format (concat  "%b - emacs@" (system-name)))

;; title bar format
(setq frame-title-format "%f")

;;---------------------------------------------------------------------------
;; Editor display customizations
;;---------------------------------------------------------------------------

;; Sets the basic indentation
(setq c-basic-offset 2)
(setq-default indent-tabs-mode nil)

;; displays tabs as 2 spaces
(setq-default tab-width 2)

;; turn on column number mode
(setq column-number-mode t)

;; don't reposition the cursor
(setq scroll-conservatively 1)

;; display the date & time
(setq display-time-day-and-date t)
(display-time-mode 1)

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; replace highlighted text (or delete with DEL)	
;; (delete-selection-mode t)


;; ---------------------------------------------------------------------------
;; Editor control
;; ---------------------------------------------------------------------------

;; always end a file with a newline
;; (setq require-final-newline 'query)

;; cut/copy/paste to/from other apps
;; (setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; opens the file at the last position
;; (require 'saveplace)
;; (setq-default save-place t)

;; turn off backup file creation
(setq make-backup-files nil)

;; turn off auto save
(setq auto-save-default nil)

;; create a backup file directory
;; (defun make-backup-file-name (file)
;;  (concat "~/.emacs.backups/" (file-name-nondirectory file) "~"))
;; (setq backup-directory-alist (quote ((".*" . "~/.emacs.backups/"))))

;; where to load other .el files
;; (add-to-list 'load-path "~/dl/elisp")

;; transparently work oncompressed (gzip) files
;; '(auto-compression-mode t nil (jka-compr))

;; make search case sensitive
;; '(case-fold-search nil)

;; for multi-language support
;; '(current-language-environment "UTF-8")
;; '(default-input-method "rfc1345")

;; don't split windows
;; (setq split-window-preferred-function 'no-split-window)
(setq split-window-preferred-function nil)


;; ---------------------------------------------------------------------------
;; Themes: font/colors
;; ---------------------------------------------------------------------------

;; set region background color
;; (set-face-background 'region "darkgray")
;; (set-face-background 'region "#000000")
;; (set-face-foreground 'region "#FFFFFF")
;; (set-face-background 'modeline "#4477aa")

;; set emacs background color
;; (set-background-color "lightgray")

;; custom cpp syntax highlighting
;; ((add-to-list 'load-path (expand-file-name "~/elisp/"))
;; (require 'cpp-font-lock)

;; set font
;; (set-default-font "-schumacher-clean-medium-r-normal-*-16-*-*-*-c-*-iso646.1991-irv")
;; (set-default-font "-schumacher-clean-medium-r-normal-*-*-140-*-*-c-*-iso646.1991-irv")
;; (set-default-font "-misc-fixed-medium-r-normal-*-13-*-*-*-*-*-*-*")
;; (set-default-font "-*-lucida-medium-r-*-*-*-0-*-*-*-*-*-*")

;; (require 'color-theme)
;; (color-theme-late-night)

;; customize face attributes
(setq font-lock-face-attributes
  ;; symbol-for-face foreground background bold italic underline
  '((font-lock-comment-face       nil       nil nil nil nil)
    (font-lock-string-face        "Red"     nil nil nil nil)
    (font-lock-constant-face      "Orchid"  nil t   nil nil)
    (font-lock-keyword-face       "Blue"    nil t   nil nil)
    (font-lock-function-name-face nil       nil nil nil nil)
    (font-lock-type-face          nil       nil nil nil nil)
    (font-lock-reference-face     nil       nil nil nil nil)
    (font-lock-warning-face       "Red"     nil nil nil nil)
    (font-lock-builtin-face       nil       nil t   nil nil)
    (font-lock-variable-name-face nil       nil nil nil nil)))

;; Load the font-lock package
(require 'font-lock)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; Maximum colors
(setq font-lock-maximum-decoration t)

;; ---------------------------------------------------------------------------
;; old themes
;; ---------------------------------------------------------------------------

;; '((font-lock-comment-face       "DarkGreen")
;;   (font-lock-string-face        "snow4")
;;   (font-lock-constant-face      "snow4")
;;   (font-lock-keyword-face       "white")
;;   (font-lock-function-name-face "white" nil nil nil nil)
;;   (font-lock-type-face          "Blue"  nil nil nil nil)
;;   (font-lock-reference-face     "white" nil t   nil nil)
;;   (font-lock-warning-face       "Red"   nil nil nil nil)
;;   (font-lock-builtin-face       "white" nil nil nil nil)
;;   (font-lock-variable-name-face "white" nil nil nil nil)
;;   (html-tag-face                "Blue")
;;   (html-helper-bold-face        "Black")
;;   (html-helper-italic-face      "Black")
;;   (html-helper-underline-face   "Black")
;;   (html-helper-bold-italic-face "Black")
;;   (html-helper-builtin-face     "Black")

;; color-late-night
;; (font-lock-comment-face ((t (:bold t :foreground "dim gray"))))
;; (font-lock-function-name-face ((t (:foreground "gray90"))))
;; (font-lock-variable-name-face ((t (:foreground "gray90"))))
;; (font-lock-constant-face ((t (:foreground "gray90"))))
;; (font-lock-doc-string-face ((t (:foreground "gray90"))))
;; (font-lock-doc-face ((t (:foreground "gray90"))))
;; (font-lock-preprocessor-face ((t (:foreground "gray90"))))
;; (font-lock-reference-face ((t (:foreground "gray90"))))
;; (font-lock-string-face ((t (:foreground "gray90"))))
;; (font-lock-type-face ((t (:bold t :foreground "white"))))
;; (font-lock-builtin-face ((t (:bold t :foreground "white"))))
;; (font-lock-keyword-face ((t (:bold t :foreground "white"))))
;; (font-lock-warning-face ((t (:bold t :foreground "red"))))

;; (custom-set-faces
;;  '(font-lock-builtin-face ((((type tty) (class color)) (:foreground "blue" :weight light))))
;;  '(font-lock-comment-face ((((type tty pc) (class color) (background light)) (:foreground "blue" :weight bold))))
;;  '(font-lock-constant-face ((((type tty) (class color)) (:foreground "blue"))))
;;  '(font-lock-function-name-face ((((type tty) (class color)) (:foreground "blue" :weight bold))))
;;  '(font-lock-keyword-face ((((type tty) (class color)) (:foreground "blue" :weight bold))))
;;  '(font-lock-string-face ((((type tty) (class color)) (:foreground "purple" :weight light))))
;;  '(font-lock-string-face ((((type tty) (class color)) (:foreground "green"))))
;;  '(font-lock-type-face ((((type tty) (class color)) (:foreground "snow" ))))
;;  '(font-lock-variable-name-face ((((type tty) (class color)) (:foreground "snow" ))))
;; )


;;---------------------------------------------------------------------------
;; Shell customizations
;;---------------------------------------------------------------------------


;; Interpret and use ansi color codes in shell output windows
;; (ansi-color-for-comint-mode-on)
;; (setq comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
;; (setq comint-scroll-to-bottom-on-output t) ; always add output at the bottom
;; (setq comint-scroll-show-maximum-output t) ; scroll to show max possible output
;; (setq comint-completion-autolist t)        ; show completion list when ambiguous
;; (setq comint-completion-addsuffix t)       ; insert space/slash after file completion

;; no duplicates in command history
(setq comint-input-ignoredups t)           

;; Hide passwords in Emacs shell
;; (add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; make completion buffers disappear after 3 seconds.
;; (add-hook 'completion-setup-hook
;;   (lambda () (run-at-time 3 nil
;;     (lambda () (delete-windows-on "*Completions*")))))


;;---------------------------------------------------------------------------
;; Window layouts
;;---------------------------------------------------------------------------

;; create 3 shells
;;(fset 'shells
;;   "\C-[xshell\C-m\C-[xrename-buff\C-m1\C-m\C-[xshell\C-m\C-[xrename-buff\C-m2\C-m\C-[xshell\C-m\C-[xrename-buff\C-m3\C-m")

;; add syntax highlighting to the shell
(fset 'hi-lock-shell
   "\C-[shl^+.*\C-m\C-kblue-b\C-m\C-[shr^-.*\C-m\C-kred\C-m")

(fset 'shell1
   "\C-[xshell\C-m\C-[xrename-buffer\C-m1\C-m\C-[xhi-lock-mode\C-m\C-[xhi-lock-shell\C-m")

(fset 'shell2
   "\C-[xshell\C-m\C-[xrename-buffer\C-m2\C-m\C-[xhi-lock-shell\C-m")

(fset 'shell3
   "\C-[xshell\C-m\C-[xrename-buffer\C-m3\C-m\C-[xhi-lock-shell\C-m")

(fset 'shells
   "\C-[xshell1\C-m\C-[xshell2\C-m\C-[xshell3\C-m")

(fset 'terms
   "\C-[xeshell\C-m\C-[xrename-buff\C-meshell\C-mtop\C-m")

(fset 'debugger
   "\C-[xgdb\C-mpadb\C-m\C-[xrename-buff\C-mgdb\C-m")

;; vert-split screen
(fset 'layout
  "\C-x1\C-x3\C-xb")

;; 3-window layout
;; (fset 'layout
;;   "\C-x1\C-x3\C-xo\C-x2")

(fset 'chu
   "\C-[xterms\C-m\C-xb*scratch*\C-m\C-[xshells\C-m\C-[xlayout\C-m")
 

;;---------------------------------------------------------------------------
;; Development
;;---------------------------------------------------------------------------

;; compilation command
;;(setq compile-command '("make -k -f $HOME/dev/Makefile"))
;;(setq compile-command '("make -k"))
;;(setq compile-command "amake padb")
;;(setq compile-command "jmake all")
;;(setq compile-command "amake all -DCOMPILE_SYS -DCOMPILE_ENV -src")
;;(setq compile-command "amake all -src")
(setq compile-command "cd ~/asd;make all")

;; There is a bug in emacs.  split horizontally to display vertically
;; (setq ediff-split-window-function 'split-window-horizontally)

;; default to unified diffs
;; (setq diff-switches "-u")

;; cscope
;; (require 'xcscope)
;; (setq cscope-initial-directory "~/dev/cscope")


(defun xdiff ()
  "highlight diff output"
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "^-[^-][^-]" nil t)
    (backward-char 2)
    (skip-chars-forward " " (line-end-position))
    (let ((start1 (point)) (end1 (line-end-position)))
      (when (and (= 0 (forward-line 1)) (looking-at "+"))
        (forward-char)
        (skip-chars-forward " " (line-end-position))
        (let ((start2 (point)) (end2 (line-end-position)))
          (let (line1 line2 pos endpos1 endpos2)

            ;; find matching prefix
            (setq pos (- (abs (compare-buffer-substrings nil start1 end1 nil start2 end2)) 1))
            
            ;; find matching suffix
            (setq line1 (buffer-substring-no-properties start1 end1))
            (setq line2 (buffer-substring-no-properties start2 end2))
            
            (if (and (< pos (length line2)) (< pos (length line1)))
                (with-temp-buffer
                  (insert (substring line2 pos))
                  (goto-char (point-min))
                  (setq endpos1 pos)
                  (while (progn (search-forward (substring line1 endpos1) nil t)
                                (and (< endpos1 (length line1))
                                     (= (point) (point-min))))
                      (setq endpos1 (+ endpos1 1)))
                    (if (= (point) (point-min))
                      (setq endpos2 (length line2))
                      (setq endpos2 (- (point) (point-min)))
                      (setq endpos2 (- endpos2 (length (substring line1 endpos1))))
                      (setq endpos2 (+ endpos2 pos))))
                  (setq endpos1 (length line1))
                  (setq endpos2 (length line2)))

              ;; highlight 
              (if (and (< pos endpos1) (< (- endpos1 pos) (length line1)))
                  (let ((old (make-overlay (+ start1 pos) (+ start1 endpos1))))
                    (overlay-put old 'face '(:background "red" :foreground "white"))))
              (if (and (< pos endpos2) (< (- endpos2 pos) (length line2)))
                  (let ((new (make-overlay (+ start2 pos) (+ start2 endpos2))))
                    (overlay-put new 'face '(:background "blue" :foreground "white"))))
          )
        )
      )
    )
  )
)




;;---------------------------------------------------------------------------
;; Key Bindings
;;---------------------------------------------------------------------------

;; cscope
;; (global-set-key [f1] 'cscope-find-this-symbol)
;; (global-set-key [f2] 'cscope-find-global-definition-no-prompting)
;; (global-set-key [f3] 'cscope-pop-mark)
;; (global-set-key [f4] 'cscope-display-buffer)
;; (define-key global-map [(control f4)] 'cscope-select-entry-one-window)

;; (global-set-key [f2] 'cscope-find-global-definition)
;; (global-set-key [f10] 'cscope-display-buffer-toggle)

;; (global-set-key [f5] 'cscope-next-symbol)
;; (global-set-key [f6] 'cscope-next-file)
;; (global-set-key [f7] 'cscope-prev-symbol)
;; (global-set-key [f8] 'cscope-prev-file)

;; xdiff highlighter
(global-set-key [f1] 'xdiff)

;; macros
(global-set-key [f8] 'call-last-kbd-macro)


;; compiling / debugging
(global-set-key [f9] 'compile)
(global-set-key [f10] 'goto-line)
;; (define-key global-map [(control f9)] 'gud)

;; search and replace
(global-set-key [f11] 'query-replace)
(global-set-key [f12] 'replace-string)

;; version control
;; (global-set-key [f?] 'ediff-revision)
;; (global-set-key [f?] 'vc-next-action)

;; formatting
;; (global-set-key [f?] 'tabify-buffer)
;; (global-set-key [f?] 'font-lock-fontify-buffer)

;; gdb: map f9 to the previous command
;; not necessary: just use M-p (Alt-p)
;; (add-hook 'comint-mode-hook
;;          '(lambda ()
;;             (define-key comint-mode-map [f9] 'comint-previous-input))) 


;; bind alt-g key to goto-line
;; (global-set-key "\M-g" 'goto-line)

;; (global-set-key "\M-m" 'set-mark-command)

;; bind ctrl-c-c/ctrl-v to copy/paste
;; (global-set-key "\C-cc" 'clipboard-kill-ring-save)
;; (global-set-key "\C-v" 'clipboard-yank)


;;---------------------------------------------------------------------------
;; Formatting Macros
;;---------------------------------------------------------------------------

;; tabify the entire buffer
;; (fset 'tab [tab])
;; (defun tabify-buffer()
;;        (interactive)
;;        (apply-macro-to-region-lines (point-min) (point-max) 'tab))

;; convert dos files to unix
;; (defun ats-ask-eol-to-save ()
;;  "Ask if the user wants to convert the EOL type during save."
;;  (interactive)
;;   (let (eol-name
;;        (eol (coding-system-eol-type buffer-file-coding-system)))
;;    (cond ((vectorp eol) nil)           ; Undecided type
;;          ((eq eol 0) nil)              ; Unix EOL
;;          (t
;;           (setq eol-name (cond ((eq eol 1) "DOS")
;;                                ((eq eol 2) "Mac")))
;;           (if (y-or-n-p (format "Convert this file from %s EOLs to Unix? " 
;;                                 eol-name))
;;               (set-buffer-file-coding-system 
;;                (coding-system-change-eol-conversion buffer-file-coding-system 'unix)))))
;;    nil))
;; (add-hook 'write-file-hooks 'ats-ask-eol-to-save)


;; convert all tabs to spaces in the java source file
;; (defun cc-mode-untabify ()
;;  (save-excursion
;;    (goto-char (point-min))
;;    (while (re-search-forward "[ \t]+$" nil t)
;;      (delete-region (match-beginning 0) (match-end 0)))
;;    (goto-char (point-min))
;;    (if (search-forward "\t" nil t)
;;	(untabify (1- (point)) (point-max))))
;;  nil)
;;(add-hook 'cc-mode-hook
;;	  '(lambda ()
;;	     (make-local-variable 'write-contents-hooks)
;;	     (add-hook 'write-contents-hooks 'cc-mode-untabify)))


;;---------------------------------------------------------------------------
;; SQL Mode
;;---------------------------------------------------------------------------

;; (add-to-list 'load-path (expand-file-name "~/emacs/sql"))
;; (autoload 'sql-mode "sql" "SQL mode" t)
;; (add-to-list 'auto-mode-alist '("\\.sql$" . sql-mode))
;;
;; (eval-after-load "sql"
;;  '(load-library "sql-indent"))
;; (eval-after-load "sql"
;;  '(sql-highlight-ansi-keywords))


;;;;;;;;;;;;;;;;;;;;; original configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;

;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
;; (when (fboundp 'global-font-lock-mode)
;;  (global-font-lock-mode t))

;; enable visual feedback on selections
;;(setq transient-mark-mode t)

;; default to better frame titles
;;(setq frame-title-format
;;      (concat  "%b - emacs@" system-name))

;; default to unified diffs
;; (setq diff-switches "-u")

;; always end a file with a newline
;; (setq require-final-newline 'query)


;;;;;;;;;;;;;;;;;;;;; original configuration ;;;;;;;;;;;;;;;;;;;;;;;;;;

















