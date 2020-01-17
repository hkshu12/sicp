; 1.21.rkt
#lang sicp

; Exercise 1.21: Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test)
  (cond ((> (* test test) n) n)
        ((= (remainder n test) 0) test)
        (else (find-divisor n (+ 1 test)))))

(smallest-divisor 4); 2
(smallest-divisor 199); 199
(smallest-divisor 1999); 1999
(smallest-divisor 19999); 7