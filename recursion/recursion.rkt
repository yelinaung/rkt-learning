#lang racket

; counting length recursively
(printf "==== length ====\n")
(define (recursive-length lst)
  (if (empty? lst) 0 (+ 1 (recursive-length (rest lst)))))

(recursive-length (list 1 2 3 4 7))
(recursive-length (list 1))
(recursive-length empty)
(printf "\n")

; david's recursion review
; https://www.dabeaz.com/recursion.html

; count function with start, stop
(printf "==== count ====\n")
(define (count start stop)
  (if (>= start stop)
      (void)
      (begin
        (displayln start)
        (count (+ 1 start) stop))))
(printf "count from 1 to 5\n")
(count 1 5)
(printf "count from 0 to 10\n")
(count 0 10)
(printf "\n")

; factorial
(printf "==== factorial ====\n")
(define (factorial n)
  (if (<= n 1) 1 (* n (factorial (- n 1)))))

(factorial 2)
(factorial 3)
(factorial 4)
(factorial 5)

(printf "==== count multiples ====\n")
(define (count-multiples a b)
  (if (equal? 0 (modulo b a)) (+ 1 (count-multiples a (/ b a))) 0))

(count-multiples 2 3)
(count-multiples 2 5)
(count-multiples 2 12)
(count-multiples 3 11664)
