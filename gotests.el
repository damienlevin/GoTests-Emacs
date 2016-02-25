
(defconst func-regexp "func\s-*([^\)]*\)\s\\(\\w*\\)")

; Return all go functions found in the selected region
(defun go-functions (string)
  (save-match-data
    (let ((pos 0) functions)
      (while (string-match func-regexp string pos)
        (push (match-string 1 string) functions)
        (setq pos (match-end 0)))
      functions)))

; Execute `gen` if we are not in a test file
(defun gen-if-not-test(gen)
  (if (string-match "_test.go\\'" buffer-file-name)
    (message "Cannot generate gotests from test file.")
  (funcall gen)))

; Generate all missing go tests
(defun gotests()
  (interactive)
  (gen-if-not-test 
   (lambda() (call-process "gotests" nil nil nil "-all" "-w" buffer-file-name))))

; Generate tests for all go functions in region
(defun gotests-region()
  (interactive)
  (gen-if-not-test 
   (lambda() (call-process "gotests" nil nil nil "-w" "-only" (mapconcat 'identity (go-functions (buffer-substring (region-beginning) (region-end))) "|") buffer-file-name))))
