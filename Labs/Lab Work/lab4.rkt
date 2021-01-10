#lang sicp
(#%require simply-scheme)

(define x (cons 4 5))
(car x)
(cdr x)
(define y (cons 'hello 'goodbye))
(define z (cons x y))
(car (cdr z))
(cdr (cdr z))

(cdr (car z))
;5
(car (cons 8 3))
;8
(car z)
;{4 . 5}
;(car 3)
;error argument require expexcted: pair? given: 3


(define (make-rational num den) (cons num den))

(define (numerator rat)
  (car rat))

(define (denominator rat)
  (cdr rat))

(define (*rat a b)
  (make-rational (* (numerator a) (numerator b))
                 (* (denominator a) (denominator b))))

(define (print-rat rat)
  (word (numerator rat) '/ (denominator rat)))

(print-rat (make-rational 2 3))
;2/3
(print-rat (*rat (make-rational 2 3) (make-rational 1 4)))
;2/12

(define (+rat a b)
  (if (equal? (denominator a) (denominator b))
      (make-rational (+ (numerator a) (numerator b))
                     (denominator a))
      (make-rational (+ (* (numerator a) (denominator b)) (* (numerator b) (denominator a)))
                 (* (denominator a) (denominator b))))) 