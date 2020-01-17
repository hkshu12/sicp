; 1.2.rkt
#lang sicp

; Translate the following expression into prefix form:
; (5+4+(2âˆ’(3âˆ’(6+4/5))))/(3(6âˆ’2)(2âˆ’7)).

(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6
               (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))