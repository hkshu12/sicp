; 1.18.rkt
#lang sicp


; Exercise 1.18: Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

(define (mult a b)
  (mult-iter a b 0))

(define (mult-iter a b product)
  (define (double a) (+ a a))
  (define (half a) (/ a 2))
  (cond ((= b 0) product)
        ((= (remainder b 2) 0) (mult-iter (double a) (half b) product))
        (else (mult-iter a (- b 1) (+ product a)))))

(mult 34 22)