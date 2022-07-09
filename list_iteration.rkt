#lang racket

(first (list 1 2 3))

; in python this would be
; [1, 2, 3][1:]
(rest (list 1 2 3))
empty

; cons -> construct
; to add to the front of the list
(cons "head" empty)
(cons 1 (cons "head" empty))
(empty? empty)
(empty? (cons "head" empty))

; length function
(define (my-length lst)
  (cond
    [(empty? lst) 0]
    [else (+ 1 (my-length (rest lst)))]))

(my-length (list 1 2 3 4 5 6 7))
(my-length (list "a" "b" "c"))
(my-length empty)

;(my-length (list "a" "b" "c"))
; = (+ 1 (my-length (list "b" "c")))
; = (+ 1 (+ 1 (my-length (list "c"))))
; = (+ 1 (+ 1 (+ 1 (my-length (list)))))
; = (+ 1 (+ 1 (+ 1 0)))
; = (+ 1 (+ 1 1))
; = (+ 1 2)
; = 3
; this takes O(n) stack

; map function
(define (my-map func lst)
  (cond
    [(empty? lst) empty]
    [else (cons (func (first lst))
                (my-map func (rest lst)))]))

(my-map string-upcase (list "ready" "set" "go"))

(map string-upcase (list "ready" "set" "go"))

; constant space verison
(define (my-length2 lst)
  ; local function iter
  (define (iter lst len)
    (cond
      [(empty? lst) len]
      [else (iter (rest lst) (+ len 1))]))
  (iter lst 0))

;(my-length (list "a" "b" "c"))
;= (iter (list "a" "b" "c") 0)
;= (iter (list "b" "c") 1)
;= (iter (list "c") 2)
;= (iter (list) 3)
;3
; This evaluation behavior is sometimes called tail-call optimization

; recursively removing duplicates
(define (remove-dups lst)
  (cond
    [(empty? lst) empty]
    [(empty? (rest lst)) lst]
    [else
      (let ([i (first lst)])
        (if (equal? i (first (rest lst)))
          (remove-dups (rest lst))
          (cons i (remove-dups (rest lst)))))]))
