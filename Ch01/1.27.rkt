; 1.27.rkt
#lang sicp

; Exercise 1.27: Demonstrate that the Carmichael numbers listed in Footnote 47 really do fool the Fermat test. That is, write a procedure that takes an integer n and tests whether an is congruent to a modulo n for every a<n, and try your procedure on the given Carmichael numbers.

(define (square n) (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base
             (expmod base (- exp 1) m))
          m))))

(define (Carmichael-test n)
  (define (test-iter n a)
    (if(< a n)
      (if(= (expmod a n n) a)
        (test-iter n (+ 1 a))
        #f)
      #t))
(test-iter n 1))

(Carmichael-test 5); #t
(Carmichael-test 10); #f
(Carmichael-test 561); #t, but 561 = 11 * 51, so Fermat test is fooled.