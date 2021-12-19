(defun explode (snum)
  "Explodes the leftmost pair nested four or more deep, if any.

  Returns new snailfish number string if it exploded something, nil otherwise."
  ;; (if (string-match "\\( \\[ [^][]* [^][]* [^]]* \\)\\{5\\}[0-9],[0-9]\\]" snum)
  (let ((start (find-nest snum 0 5)))
    (if start
        (let* ((left-end (string-match "," snum start))
               (left (substring snum start left-end))
               (right-end (string-match "\\]" snum left-end))
               (right (substring snum (1+ left-end) right-end))
               (exploded
                (concat (explode-push (substring snum 0 (1- start)) left (- start 2) -1)
                        "0"
                        (explode-push (substring snum (1+ right-end)) right 1 1))))
          (if exploded
              (progn (message "Exploded to: %s" exploded) exploded))))))

(defun find-nest (str index nests)
  (if (eq index (length str))
      nil
    (if (= nests 0)
        index
      (let* ((char (substring str index (1+ index)))
             (new-nests (cond ((equal char "[") (1- nests))
                              ((equal char "]") (1+ nests))
                              (t nests))))
            (find-nest str (1+ index) new-nests)))))

(defun explode-push (snum val index inc)
  ;; base case: hit the end
  (if (or (<= index 0) (>= index (length snum)))
      snum
    (let ((prev-char (substring snum (1- index) index)))
      ;; base case: hit the beginning of a number
      (if (and (not (string-match "[0-9]" prev-char))
               (eq index (string-match "[0-9]+" snum index)))
          (concat (substring snum 0 index)
                  (number-to-string (+ (string-to-number (match-string 0 snum))
                                       (string-to-number val)))
                  (substring snum (match-end 0)))
        ;; recursive step: move to the next character
        (explode-push snum val (+ index inc) inc)))))

(defun nump (char)
  (string-match "[0-9]" char))

;; ;; imperative version:
;; (defun explode-push (snum val index inc)
;;   ;; base case: hit the end
;;   (while (and (>= index 0) (< index (length snum)))
;;     (let ((char (substring snum index (1+ index))))
;;       ;; base case: hit a number
;;       (if (string-match "[0-9]" char)
;;           (progn
;;             (setq snum
;;                   (concat (substring snum 0 index)
;;                           (number-to-string (+ (string-to-number char) (string-to-number val)))
;;                           (substring snum (1+ index))))
;;             (setq index -1)) ;; ie break
;;         ;; recursive step: move to the next character
;;         (setq index (+ index inc)))))
;;   snum)

(defun split (snum)
  "Splits the leftmost >10 number, if any.

  Returns new snailfish number string if it made a split, nil otherwise."
  (let ((index (string-match "[1-9][0-9]" snum)))
    (if index
        (let* ((val (string-to-number (match-string 0 snum)))
               (left (/ val 2))
               (right (ceiling (/ (float val) 2)))
               (split (replace-match (format "[%s,%s]" left right) nil nil snum)))
          (if split
              (progn (message "Split to: %s" split) split))))))

(defun reduce (snum)
  (setq cur snum
        new snum)
  (while new
    (setq cur new)
    (setq new (or (explode cur) (split cur))))
  cur)

(add
"[[[0,[4,5]],[0,0]],[[[4,5],[2,6]],[9,5]]]"
"[7,[[[3,7],[4,3]],[[6,3],[8,8]]]]")


    ;;   (let* (()
    ;;          (split (if (not exploded) (split snum))))
    ;; (if exploded
    ;;     (progn
    ;;       (message "Exploded to: %s" exploded)
    ;;       (reduce exploded))
    ;;   (let ((split (split snum)))
    ;;     (if split
    ;;         (progn
    ;;           (message "Split to: %s" split)
    ;;           (reduce split))
    ;;       snum)))))

(defun add (a b)
  (reduce (format "[%s,%s]" a b)))

;; (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add (add
;; "[[[[6,3],7],0],[[7,0],0]]"
;; "[[[4,7],[6,[6,5]]],[4,[[6,5],[9,1]]]]")
;; "[[[[3,7],[6,9]],[3,[4,1]]],8]")
;; "[[[0,[2,0]],3],2]")
;; "[[[[1,3],4],9],[[[1,8],[9,3]],[0,7]]]")
;; "[[[5,9],1],[[[4,8],[4,8]],[[9,7],[3,6]]]]")
;; "[[[0,7],4],[[[0,4],2],[4,2]]]")
;; "[[5,1],[2,5]]")
;; "[[[[4,8],[8,3]],[6,[2,3]]],[[6,0],[1,3]]]")
;; "[[[[1,7],[8,1]],[2,[3,4]]],[[7,[8,7]],[[8,6],5]]]")
;; "[[9,[[8,9],[0,6]]],[[[8,4],5],[0,[1,7]]]]")
;; "[[[[9,8],[6,9]],[[3,5],[6,2]]],[[[7,8],5],8]]")
;; "[[[[7,1],8],[0,2]],[3,5]]")
;; "[[[1,9],3],[8,[8,[7,8]]]]")
;; "[[[9,[8,5]],[1,[9,0]]],5]")
;; "[9,[[[1,1],8],[[3,5],9]]]")
;; "[[[1,[7,8]],2],[8,0]]")
;; "[7,[8,[[6,1],[7,9]]]]")
;; "[[7,[[4,7],7]],[[8,[5,2]],2]]")
;; "[[[[1,7],[9,0]],3],[8,[4,[2,0]]]]")
;; "[[4,3],[[9,[7,7]],7]]")
;; "[[[[9,5],3],[[8,5],5]],5]")
;; "[[[[4,9],2],[[5,6],[9,0]]],[[2,[2,2]],1]]")
;; "[[[[7,9],[6,0]],[1,[5,8]]],[8,8]]")
;; "[[[[0,5],2],[4,[5,7]]],[8,[[8,1],[6,7]]]]")
;; "[9,[7,[[3,7],[6,4]]]]")
;; "[[[[5,3],[5,2]],[[5,0],0]],[[[4,6],[6,4]],[8,8]]]")
;; "[1,[[8,0],0]]")
;; "[[3,[7,9]],[[[1,2],[1,6]],[[9,2],[2,8]]]]")
;; "[[[2,8],[3,[8,3]]],[3,[[9,8],[5,6]]]]")
;; "[[[[2,0],3],[5,1]],[[[2,9],7],[[0,4],[1,4]]]]")
;; "[[3,[[0,0],[9,0]]],[[6,[0,5]],[[5,4],[5,2]]]]")
;; "[[8,[[9,4],[6,8]]],[3,[[8,1],4]]]")
;; "[[[[4,1],[5,1]],[4,[9,1]]],4]")
;; "[2,[[[0,5],[8,7]],[[6,1],[1,0]]]]")
;; "[7,[8,8]]")
;; "[[[[7,3],5],9],[[[5,9],[3,5]],[[9,4],8]]]")
;; "[[[[4,2],[6,1]],[[6,6],7]],[2,2]]")
;; "[[[1,1],4],[[[4,8],0],[[6,7],7]]]")
;; "[[[[5,9],[0,1]],[9,7]],2]")
;; "[[[[6,4],[5,5]],[[2,8],0]],9]")
;; "[[7,[4,9]],[5,[[0,2],2]]]")
;; "[[2,[9,9]],[[8,5],8]]")
;; "[3,[8,[6,[2,8]]]]")
;; "[[[0,1],[[8,5],[8,9]]],0]")
;; "[[[[1,8],[1,4]],8],[[6,8],[8,[5,7]]]]")
;; "[[[[7,1],[2,0]],[2,4]],[[[3,7],[2,2]],1]]")
;; "[[[[0,3],[8,0]],[2,6]],[[6,2],[0,4]]]")
;; "[[[7,1],[[6,8],[3,2]]],[[8,[3,2]],[1,[0,1]]]]")
;; "[[[8,[5,7]],4],[[1,[1,9]],[[4,9],[4,2]]]]")
;; "[[[8,5],3],[[9,8],[[4,4],[7,2]]]]")
;; "[[5,[5,[8,7]]],[[8,0],[[6,3],6]]]")
;; "[[[8,4],[[5,2],[7,0]]],[[[9,7],[8,9]],7]]")
;; "[[5,[3,[3,0]]],5]")
;; "[[[[0,1],[0,0]],[4,[3,7]]],[8,0]]")
;; "[5,[[[8,3],8],5]]")
;; "[[[5,[0,6]],4],[4,[3,[6,3]]]]")
;; "[[[[4,1],[3,5]],[[5,0],7]],[[[7,9],[8,8]],[[8,0],[5,8]]]]")
;; "[[[7,[6,6]],[[6,2],2]],8]")
;; "[1,[4,[[2,9],[3,8]]]]")
;; "[[[9,[5,4]],[[2,5],7]],[[4,2],9]]")
;; "[[9,1],[[0,7],[[4,1],[5,6]]]]")
;; "[[[7,[8,6]],[[4,5],1]],[[[2,1],[6,3]],[4,[0,3]]]]")
;; "[[0,[2,[7,5]]],[[[5,0],5],3]]")
;; "[[[0,[4,1]],7],[[[3,7],5],[[5,9],7]]]")
;; "[[4,[[1,3],1]],[[9,6],[[6,2],3]]]")
;; "[3,[[[8,5],6],4]]")
;; "[[2,7],[[[3,9],3],[[2,1],2]]]")
;; "[[4,[5,[9,9]]],[[[3,0],[4,1]],[[6,4],9]]]")
;; "[[[7,9],[[5,7],[2,1]]],[[[1,4],6],[3,3]]]")
;; "[[[[4,0],3],[3,[6,3]]],[[[6,2],4],5]]")
;; "[[9,[[2,4],3]],[[9,[1,0]],[[5,8],[7,1]]]]")
;; "[8,[1,5]]")
;; "[[[5,5],3],[[[8,9],3],4]]")
;; "[[1,[[8,8],[7,4]]],[[[9,1],[9,6]],[7,8]]]")
;; "[[[7,2],[[0,1],5]],7]")
;; "[[9,3],[7,[1,[9,2]]]]")
;; "[[[[8,2],[8,0]],[[7,1],6]],[0,[[9,4],1]]]")
;; "[[[[1,3],2],[6,[0,0]]],[[[7,8],[4,3]],[[9,4],1]]]")
;; "[[[[2,1],[7,1]],[[5,4],[9,2]]],[[3,0],0]]")
;; "[[[8,6],[[2,1],[9,1]]],[[3,[1,8]],[3,3]]]")
;; "[[[[6,2],[3,6]],3],[5,9]]")
;; "[[[[7,6],7],[[4,2],1]],[[0,4],[[9,8],6]]]")
;; "[[8,[[7,6],[8,5]]],[[2,7],[[7,0],[0,0]]]]")
;; "[[[0,[0,0]],4],[[[6,1],8],[[5,9],[6,5]]]]")
;; "[[[8,[9,9]],9],[[3,[2,8]],[[9,5],[2,9]]]]")
;; "[[[7,5],[[0,7],[3,3]]],[[8,[1,5]],9]]")
;; "[[[6,[9,0]],[[0,7],[7,5]]],[[[4,9],0],[[2,3],7]]]")
;; "[[8,[8,[0,1]]],[[2,6],7]]")
;; "[1,[[9,3],1]]")
;; "[[[[6,2],[0,8]],5],[[[9,4],7],[[6,3],6]]]")
;; "[[[8,[4,2]],[4,9]],[7,[[9,0],8]]]")
;; "[1,[[7,3],2]]")
;; "[[[3,[5,9]],[7,[0,4]]],[[[3,0],7],4]]")
;; "[[[1,[8,3]],[4,[2,3]]],[[3,[1,6]],[[1,6],5]]]")
;; "[[[[1,3],2],9],[5,[4,9]]]")
;; "[[[7,[0,6]],2],[[[1,5],[0,7]],[4,9]]]")
;; "[[[5,0],[0,[1,1]]],5]")
;; "[[[[9,3],[0,0]],[[1,3],[7,3]]],[[5,7],[[6,6],[6,5]]]]")
;; "[[[8,0],[9,0]],[[[4,7],4],[5,[2,6]]]]")