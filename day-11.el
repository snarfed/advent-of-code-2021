;;
;; PART 1
;;
(setq octs '(
 (6 3 1 8 1 8 5 7 3 2)
 (1 1 2 2 6 8 7 1 3 5)
 (5 1 7 3 2 3 7 6 7 6)
 (8 7 5 4 3 6 2 6 1 2)
 (5 7 1 8 4 7 4 6 6 6)
 (8 4 4 3 6 5 4 1 3 7)
 (1 2 4 7 6 3 4 3 4 6)
 (1 4 4 6 5 1 4 5 8 5)
 (6 7 1 7 2 8 8 2 6 7)
 (1 7 2 7 8 7 1 2 2 8)
))

(defun flash (x y)
  (+ 1
     (apply '+
            (mapcar (lambda (delta) (inc (+ x (car delta)) (+ y (cadr delta))))
             '((-1 -1) (-1  0) (-1 1) (0 -1) (0  1) (1 -1) (1 0) (1 1))))))

(defun inc (x y)
  (if (or (< x 0) (< y 0) (>= x 10) (>= y 10))
      0
    (let* ((line (nth y octs))
           (val (nth x line)))
      (if (< val 0)
          0
        (if (<= (setcar (nthcdr x line) (+ 1 val)) 9)
            0
          (setcar (nthcdr x line) -1)
          (flash x y))))))

(defun step (i)
  (mapcar (lambda (y)
            (mapcar (lambda (x)
                      (let ((line (nth y octs)))
                        (if (< (nth x line) 0)
                            (setcar (nthcdr x line) 0))))
                    (number-sequence 0 9)))
            (number-sequence 0 9))

  ;; (mapcar (lambda (line) (message "%s" line)) octs)

  (apply '+ (mapcar (lambda (y)
                      (apply '+ (mapcar (lambda (x) (inc x y))
                                        (number-sequence 0 9))))
                    (number-sequence 0 9))))

(apply '+ (mapcar 'step (number-sequence 0 99)))
