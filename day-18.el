(defun explode-right (snum indices)
  ;; (if (eq 1 (length indices))
  (if (not indices)
      ;; base case
      (cadr snum)
    ;; recursive step
    (let ((num (explode (nth (car indices) snum) (cdr indices))))
      (if (eq 0 (cadr indices)
              (if (cadr
                   (if num
                       )))

(defun split (x)
  (list (/ x 2) (ceiling (/ (float x) 2))))

(explode-right ...) (last index points to target pair)
(explode-left ...)
[replace pair with 0]
