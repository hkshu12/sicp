; 1.4.rkt
#lang sicp

; Exercise 1.4: Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b)); wow

; if b > 0
;   then evaluate a + b = a + abs(b)
; else
;   evaluate a - b = a + (-b) = a + abs(b)