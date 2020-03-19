; 1.28.rkt
#lang sicp

; Exercise 1.28: One variant of the Fermat test that cannot be fooled is called the Miller-Rabin test (Miller 1976; Rabin 1980). This starts from an alternate form of Fermat’s Little Theorem, which states that if n is a prime number and a is any positive integer less than n, then a raised to the (n−1)-st power is congruent to 1 modulo n. To test the primality of a number n by the Miller-Rabin test, we pick a random number a<n and raise a to the (n−1)-st power modulo n using the expmod procedure. However, whenever we perform the squaring step in expmod, we check to see if we have discovered a “nontrivial square root of 1 modulo n,” that is, a number not equal to 1 or n−1 whose square is equal to 1 modulo n. It is possible to prove that if such a nontrivial square root of 1 exists, then n is not prime. It is also possible to prove that if n is an odd number that is not prime, then, for at least half the numbers a<n, computing an−1 in this way will reveal a nontrivial square root of 1 modulo n. (This is why the Miller-Rabin test cannot be fooled.) Modify the expmod procedure to signal if it discovers a nontrivial square root of 1, and use this to implement the Miller-Rabin test with a procedure analogous to fermat-test. Check your procedure by testing various known primes and non-primes. Hint: One convenient way to make expmod signal is to have it return 0.

(define (square n) (* n n))

(define (nontrivial-square-root? a n)
  (and (not (= 1 a))
    (not (= (- n 1) a))
    (= 1 (remainder (square a) n))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((nontrivial-square-root? base m) 0)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base
             (expmod base (- exp 1) m))
          m))))

(define (Miller-Rabin-test n)
  (define count (ceiling (/ n 2)))
  (define (test-iter count a)
    (if(< a n)
      (if(= (expmod a n n) a)
        (test-iter n (+ 1 a))
        #f)
      #t))
(test-iter n 1))

(Miller-Rabin-test 5); #t
(Miller-Rabin-test 10); #f
(Miller-Rabin-test 561); #f