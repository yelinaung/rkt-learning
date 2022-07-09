#lang racket
(if (> 2 3)
  "2 is bigger than 3"
  "2 is smaller than 3")
(printf "\n")

(define (reply s)
  (if (string-prefix? s "hello")
    "hi!"
    "huh?"))
(reply "hello racket")
(reply "I am a cat")
(printf "\n")

(define (reply-non-string s)
  (if (string? s)
    (if (string-prefix? s "hello")
      "hi!" "huh?") "huh?"))
(reply-non-string "hello racket")
(reply-non-string "cat")
(reply-non-string 1)
(printf "\n")

; we can combine the condition
; but difficult to read
(define (reply-non-string2 s)
  (if (if (string? s)
        (string-prefix? s "hello")
        #f)
    "hi!"
    "huh?"))
(reply-non-string2 "hello racket")
(reply-non-string2 "cat")
(reply-non-string2 1)
(printf "\n")

; and and or
(define (reply-non-string3 s)
  (if (and (string? s) (string-prefix? s "hello"))
    "hi!"
    "huh?"))

(reply-non-string3 "hello racket")
(reply-non-string3 "cat")
(reply-non-string3 1)
(printf "\n")

; combine multiple conditions
(define (reply-only-enthusiastic s)
  (if (and (string? s)
           (string-prefix? s "hello")
           (string-suffix? s "!"))
    "hi!"
    "huh?"))
(reply-only-enthusiastic "hello racket!")
(reply-only-enthusiastic "hello racket ...")
(printf "\n")
 
; nested conditions
(define (reply-more s)
  (if (string-prefix? s "hello")
    "hi!"
    (if (string-prefix? s "goodbye")
      "bye!"
      (if (string-suffix? s "?")
        "I don't know"
        "huh?"))))
(reply-more "hello racket!")
(reply-more "goodbye")
(reply-more "no?")
(reply-more "no!")
(printf "\n")

; The shorthand for a sequence of tests is the cond form
; reply-more can be rewritten like this
(define (reply-more-cond s)
  (cond
    [(string-prefix? s "hello")
     "hi!"]
    [(string-prefix? s "goodbye ")
     "bye!"]
    [(string-suffix? s "?")
     "I don't know"]
    [else "huh?"]))
(reply-more-cond "hello racket")
(reply-more-cond "goodbye cruel world")
(reply-more-cond "what's your favorite color?")
(reply-more-cond "lime green")
(printf "\n")
