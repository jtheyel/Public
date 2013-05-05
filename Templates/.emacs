(add-to-list 'auto-mode-alist '("\\.F90\\'" . f90-mode))
(add-to-list 'auto-mode-alist '("\\.par\\'" . makefile-mode))
(add-hook 'c-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'f90-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'java-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'python-mode-hook (lambda () (hs-minor-mode 1)))
(add-to-list 'load-path "~/.installs/g-client/")
(load-library "g")

(load-file "/home/joshua/.emacs.d/mathematica.el")

;; ------------------------------------------------------------------------
;; 			   Buffer switching
;; ------------------------------------------------------------------------
 
;; ido makes competing buffers and finding files easier
;; http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
;; (require 'ido) 
;; (ido-mode 'both) ;; for buffers and files

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

;; (load auto-complete.el)

(add-to-list 'load-path "~/LaTex/")
(set-face-foreground 'font-lock-comment-face "magenta")
(set-face-foreground 'font-lock-keyword-face "green")


;; (load "auto-complete-latex")

;; (autoload 'ac-latex-setup "auto-complete-latex" "ac and aucTeX" t)
;; (add-hook 'LaTeX-mode-hook (lambda() (ac-latex-setup)))


(which-function-mode)
(column-number-mode)

(defun emacs-buffer-p (name)
  (string-match-p "\\*.*\\*" name))

(defun next-non-emacs-buffer (&optional original)
  "Similar to next-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (next-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (next-non-emacs-buffer tmp-orig))))

(defun previous-non-emacs-buffer (&optional original)
  "Similar to previous-buffer, but ignores emacs buffer such as *scratch*, *messages* etc."
  (interactive)
  (let ((tmp-orig (or original (buffer-name))))
    (previous-buffer)
    (if (and
         (not (eq (buffer-name) tmp-orig))
         (emacs-buffer-p (buffer-name)))
        (previous-non-emacs-buffer tmp-orig))))

(global-set-key (kbd "C-x <right>") 'next-non-emacs-buffer)
(global-set-key (kbd "C-x <left>") 'previous-non-emacs-buffer)
(global-set-key (kbd "C-c w") 'count-words-region)

;; ------------------------------------------------------------------------
;; 			     Minor Modes
;; ------------------------------------------------------------------------

(setq 
  ido-save-directory-list-file "~/.emacs.d/cache/ido.last"

  ido-ignore-buffers ;; ignore these guys
  '("\\` " "^\*Mess" "^\*Back" ".*Completion" "^\*Ido" "^\*trace"

     "^\*compilation" "^\*GTAGS" "^session\.*" "^\*")
  ido-work-directory-list '("~/" "~/Desktop" "~/Documents" "~src")
  ido-case-fold  t                 ; be case-insensitive
  
  ido-enable-last-directory-history t ; remember last used dirs
  ido-max-work-directory-list 30   ; should be enough
  ido-max-work-file-list      50   ; remember many
  ido-use-filename-at-point nil    ; don't use filename at point (annoying)
  ido-use-url-at-point nil         ; don't use url at point (annoying)

  ;; ido-enable-flex-matching nil     ; don't try to be too smart
  ido-max-prospects 8              ; don't spam my minibuffer
  ;; ido-confirm-unique-completion t
  ) ; wait for RET, even with unique completion

;; when using ido, the confirmation is rather annoying...
 (setq confirm-nonexistent-file-or-buffer nil)




(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))

(add-to-list 'load-path "~/.emacs.d/")

;; (load "hide-region.el")

;; ------------------------------------------------------------------------
;; 			  ;; CUSTOM BINDINGS
;; ------------------------------------------------------------------------


(global-set-key (kbd "C-DEL") 'backward-kill-word)
(global-set-key (kbd "C-d") 'backward-kill-word)
;; (global-set-key (kbd "C-x h") 'hide-region-hide)
;; (global-set-key (kbd "C-x u") 'hide-region-unhide)
(global-set-key (kbd "<C-tab>") 'dabbrev-expand)
(global-set-key (kbd "C-^") 'yank-pop)
(global-set-key (kbd "<backtab>") 'dabbrev-expand)
(global-set-key (kbd "C-x m") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-m") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x s") 'save-buffer)
(global-set-key (kbd "C-c s") 'ispell)



(global-set-key (kbd "C-l") 'goto-line) 
(global-set-key (kbd "C-x w") 'just-one-space) 
(global-set-key (kbd "C-x g") 'replace-string)

(global-set-key (kbd "C-x l") 'LaTeX-math-mode)

;; ------------------------------------------------------------------------
;; 			      ALIGNMENT
;; ------------------------------------------------------------------------

 
(defun align-repeat (start end regexp)
    "Repeat alignment with respect to 
     the given regular expression."
    (interactive "r\nsAlign regexp: ")
    (align-regexp start end 
        (concat "\\(\\s-*\\)" regexp) 1 1 t))

(global-set-key (kbd "C-x C-a") 'align-repeat)

(global-set-key (kbd "C-x t") 'indent-region)

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))


(global-set-key (kbd "C-x C-j C-h") 'java-insert-header)

;; ------------------------------------------------------------------------
;; 			       FOLDING
;; ------------------------------------------------------------------------

(global-set-key (kbd "C-c C-a") 'recenter-top-bottom)
(global-set-key (kbd "C-c C-v") 'recenter-top-bottom)
(global-set-key (kbd "C-c C-r") 'compile)
(global-set-key (kbd "C-x ,") 'hs-hide-block)
(global-set-key (kbd "C-x .") 'hs-show-block)
(global-set-key (kbd "C-x <") 'hs-hide-level)
(global-set-key (kbd "C-x >") 'hs-show-all)
(global-set-key (kbd "C-x p") 'replace-string)

;; ------------------------------------------------------------------------
;; 			     JAVA HEADER
;; ------------------------------------------------------------------------


(defun Template-LaTex ()
  (interactive)
  (insert-file-contents "~/Public/Templates/TEMPLATE.tex"))


(defun Template-Matplotlib ()
  (interactive)
  (insert-file-contents "~/Public/Templates/matplotTEMPLATE.py"))

(defun Template-C ()
  (interactive)
  (insert-file-contents "~/Public/Templates/c.c"))


(defun java-insert-header ()
    (interactive) 
     (insert "   /*   \n    *   \n    *   \n    *   \n    *   \n    *   \n    */"))

;; ------------------------------------------------------------------------
;; 			    General Header
;; ------------------------------------------------------------------------

(global-set-key (kbd "C-x C-h") 'make-header) ; [Ctrl]-[x] [Ctrl]-[h]
(global-set-key (kbd "C-x h") 'make-header) ; [Ctrl]-[x] [Ctrl]-[h]


(defun emph ()
  (insert  "\\emph{"))

(defun bf ()
  (insert  "\\textbf{"))




(defun make-header ()
    (interactive) 
    (center-line) 
    (defvar beg (line-beginning-position))
    (goto-char (line-beginning-position))     
    (insert  "------------------------------------------------------------------------\n")
    (goto-char (line-end-position))
    (insert "\n------------------------------------------------------------------------\n")
    (defvar end (line-end-position)))
    ;; (comment-or-uncomment-region beg end))



;; ------------------------------------------------------------------------
;;				 MISC
;; ------------------------------------------------------------------------


    (defun count-words-region (start end)
       (interactive "r")
       (save-excursion
          (let ((n 0))
           (goto-char start)
           (while (< (point) end)
             (if (forward-word 1)
                 (setq n (1+ n))))
           (message "Region has %d words" n)
           n)))


(setq default-frame-alist (append (list 
  '(width  . 81)  ; Width set to 81 characters 
  '(height . 40)) ; Height set to 60 lines 
  default-frame-alist)) 

(setq inhibit-startup-message   t)   ; Don't want any startup message 
(setq make-backup-files         nil) ; Don't want any backup files 
(setq auto-save-list-file-name  nil) ; Don't want any .saves files 
(setq auto-save-default         nil) ; Don't want any auto saving 

(setq search-highlight           t) ; Highlight search object 
(setq query-replace-highlight    t) ; Highlight query object 
(setq mouse-sel-retain-highlight t) ; Keep mouse high-lightening 


;; (setq org-fontify-done-headline t)
;; (custom-set-faces
;;  '(org-done ((t (:foreground "PaleGreen"   
;;                  :weight normal
;;                  :strike-through t))))
;;  '(org-headline-done 
;;             ((((class color) (min-colors 16) (background dark)) 
;;                (:foreground "LightSalmon" :strike-through t)))))  

        ;; HATE *MESSAGES*

;; ; necessary support function for buffer burial
;; (defun crs-delete-these (delete-these from-this-list)
;;   "Delete DELETE-THESE FROM-THIS-LIST."
;;   (cond
;;    ((car delete-these)
;;     (if (member (car delete-these) from-this-list)
;;         (crs-delete-these (cdr delete-these) (delete (car delete-these)
;;                                                  from-this-list))
;;       (crs-delete-these (cdr delete-these) from-this-list)))
;;    (t from-this-list)))
;; ; this is the list of buffers I never want to see
;; (defvar crs-hated-buffers
;;   '("KILL" "*Compile-Log*"))
;; ; might as well use this for both
;; (setq iswitchb-buffer-ignore (append '("^ " "*Buffer") crs-hated-buffers))
;; (defun crs-hated-buffers ()
;;   "List of buffers I never want to see, converted from names to buffers."
;;   (delete nil
;;           (append
;;            (mapcar 'get-buffer crs-hated-buffers)
;;            (mapcar (lambda (this-buffer)
;;                      (if (string-match "^ " (buffer-name this-buffer))
;;                          this-buffer))
;;                    (buffer-list)))))
;; ; I'm sick of switching buffers only to find KILL right in front of me
;; (defun crs-bury-buffer (&optional n)
;;   (interactive)
;;   (unless n
;;     (setq n 1))
;;   (let ((my-buffer-list (crs-delete-these (crs-hated-buffers)
;;                                           (buffer-list (selected-frame)))))
;;     (switch-to-buffer
;;      (if (< n 0)
;;          (nth (+ (length my-buffer-list) n)
;;               my-buffer-list)
;;        (bury-buffer)
;;        (nth n my-buffer-list)))))
;; (global-set-key [(control tab)] 'crs-bury-buffer)
;; (global-set-key [(control meta tab)] (lambda ()
;;                                        (interactive)
;;                                        (crs-bury-buffer -1)))

;; (add-to-list 'crs-hated-buffers "*Messages*")
;; (add-to-list 'crs-hated-buffers "*scratch*")




    ;; (setq default-frame-alist '((background-color . "black")
                                ;; (foreground-color . "white")))


(defun my-select-current-line ()
  (interactive)
  (move-beginning-of-line nil)
  (set-mark-command nil)
  (move-end-of-line nil)
  (setq deactivate-mark nil))



(global-set-key (kbd "<C-f6>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-f8>") 'enlarge-window-horizontally)
;; (global-set-key (kbd "S-C-<down>") 'shrink-window)
;; (global-set-key (kbd "S-C-<up>") 'enlarge-window)



;; easy spell check
(global-set-key (kbd "<f7>") 'ispell-word)
(global-set-key (kbd "C-S-<f7>") 'flyspell-mode)
(global-set-key (kbd "C-M-<f7>") 'flyspell-buffer)
(global-set-key (kbd "C-<f7>") 'flyspell-check-previous-highlighted-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word)
  )
(global-set-key (kbd "M-<f7>") 'flyspell-check-next-highlighted-word)


