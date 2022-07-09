#lang racket
; with a lot of inspiration from
; https://www.reddit.com/r/Racket/comments/ggph67/my_first_racket_program_fizzbuzz_help_me_improve/
(define (fizzbuzz n)
  (cond
    [(and (equal? 0 (modulo n 3))
          (equal? 0 (modulo n 5)))
     (string-append (number->string n) " is FizzBuzz")]
    [(equal? 0 (modulo n 3))
     (string-append (number->string n) " is Fizz")]
    [(equal? 0 (modulo n 5))
     (string-append (number->string n) " is Buzz")]
    [else n]))

; (fizzbuzz 1)
; (fizzbuzz 3)
; (fizzbuzz 5)
; (fizzbuzz 15)
; (fizzbuzz 17)

(for ([i (in-range 1 101)])
  (displayln (fizzbuzz i)))
