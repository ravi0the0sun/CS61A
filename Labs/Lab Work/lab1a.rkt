#lang sicp
(#%require simply-scheme)
(define (pigl wd)
  (if (pl-done? wd)
      (word wd 'ay)
      (pigl (word (bf wd) (first wd)))))

(define (pl-done? wd)
  (vowel? (first wd)))

(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (plural wd)
  (if (equal? (last wd) 'y)
      (if (> (count wd) 1)
          (if (vowel? (last (bl wd)))
              (word wd 's)
              (word (bl wd) 'ies))
          wd)
      (word wd 's)))

(define (add a b)
  (+ a b))

(define (square a)
  (* a a))

(define (compare a b c)
  (if (> a b)
     (if (> b c)
         (add (square a) (square b))
         (add (square a) (square c)))
     (if (> a c)
         (add (square a) (square b))
         (add (square b) (square c)))))