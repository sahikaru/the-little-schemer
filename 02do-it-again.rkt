#lang racket

;define atom
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))


;define lat
(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))

;True or false (lat? l) if l is (Jack Sprat could eat no chicken fat)
(lat? `(Jack Sprat could eat no chicken fat))

;True or false (lat? l) if l is ((Jack (Sprat could) eat no chicken fat)
(lat? `((Jack (Sprat could)) eat no chicken fat))

;True or false (lat? (Jack (Sprat could) eat no chicken fat))
(lat? `(Jack (Sprat could) eat no chicken fat))


;True of false (lat? ())
(lat? `())

;what is value of (lat? l) when l is (bacon and eggs)
(lat? `(bacon and eggs))

;what is the value of (lat? l) when l is (bacon (and eggs))
(lat? `(bacon (and eggs)))

;is (or (null? l1) (atom? l2)) true of false if l1 is () and l2 is (d e f g)
(or (null? `()) (atom? `(d e f g)))

;is (or (null? l1)(null? l2)) where l1 is (a b c) and l2 is ()
(or (null? `(a b c)) (null? `()))

;is (or (null? l1) (null? l2)) true of false where l1 is (a b c) and l2 is (atom)
(or (null? `(a b c)) (null? `(atom)))


;define number
(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))

; what is the value of (member? a lat) when a is meat and lat is (mashed potatoes and meat gravy)
(member? `meat `(mashed potatoes and meat gravy))

; what is the value of (member? a lat) when a is liver and lat is (begels and lox)
(member? `liver `(begels and lox))

