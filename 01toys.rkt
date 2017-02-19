#lang racket

;define atom?
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

;is atom an atom
`atom

;is turkey an atom
`turkey

;is 1492 an atom
`1492

;is u an atom
`u

;is *abc$ an atom
`*abc$

;is (atom) a list
`(atom)

;is (atom turkey or) a list
`((atom turkey or))

;is (atom turkey) or a list

;is ((atom turkey) or) a list
`((atom turkey) or)

;is (x y z) is a S-expression
`(x y z)

;is ((x y) z) a S-expression
`((x y) z)

;is (how ara you doing so far) a list
`(how are you doing so far)

;how many S-expression in (how are you doing so far)  
(length `(how are you doing so far))

;is (((how) are)((you)(doing so))far) a list
`(((how) are)((you)(doing so))far)

;how many S-expression in (((how) are)((you)(doing so))far)
(length `(((how) are)((you)(doing so))far))

;() is a list
`()

;() is an atom
`()

;is (() () ()) a list
`(() () ())

;car of l where l is (a b c)
(car `(a b c))

;car of l where l is ((a b c) x y z)
(car `((a b c) x y z))

;car of l where l is hotdog
;(car `hotdog)

;car of l where l is ()
;(car `())

;car of l where l is (((hotdog)) (and) (pickle) relish)
(car `(((hotdog)) (and) (pickle) relish))

;(car l)
(car `(((hotdog)) (and) (pickle) relish))

;car of (car l) where is (((hotdog)) (and))
(car (car `(((hotdog)) (and))))

;cdr of l where l is (a b c)
(cdr `(a b c))

;cdr of l where is ((a b c) x y z)
(cdr `((a b c) x y z))

;cdr of l where l is (hamburger)
(cdr `(hamburger))


;(cdr l) where l is ((x) t r)
(cdr `((x) t r))

;(cdr a) where a is hotdog
;(cdr `hotdog)

;(cdr l) where l is ()
;(cdr `())

;(car (cdr l)) where l is ((b) (x y) ((c)))
(car (cdr `((b) (x y) ((c)))))
              
;(cdr (cdr l)) where l is ((b) (x y) ((c))
(cdr (cdr `((b) (x y) ((c)))))

;(cdr (car l)) where l is (a (b (c)) d)
;(cdr (car `(a (b (c)) d)))

;cons a and l where a is peanut and l is (butter and jelly)
(cons `peanut `(butter and jelly))

;cons s and l where s is (banana and) l is (peanut butter jelly)
(cons `(banana and) `(peanut butter jelly))

; cons s and l where s is ((help) this) and l is (is very ((hard) to learn))
(cons `((help) this) `(is very ((hard) to learn)))

;cons s and l where s is (a b (c)) and l is ()
(cons `(a b (c)) `())

;cons s and l where s is a and l is ()
(cons `a `())

;cons s and l where s is ((a b c)) and l is b
;(cons `((a b c)) b)

;cons s and l where s is a and l is b
;(cons `a `b)

;cons s (car l) where s is a and l is ((b) c d)
(cons `a (car `((b) c d)))

;cons s (cdr l) where s is a and l is ((b) c d)
(cons `a (cdr `((b) c d)))

;is list null where l is null
(null? `())

;what is (null (quote ()))
(null? (quote ()))

;(null? l) is true of false where l is (a b c)
(null? `(a b c))

;(null? a) true of false where a is spaghetti 
(null? `spaghetti)

;is true of false s is an atom where s is Harry
(atom? `Harry)

;is (atom? s) true of false where s is (Harry had a heap of apples)
(atom? `(Harry had a heap of apples))

;is (atom? (car l)) true or false where l is (Harry had a heap of apples)
(atom? (car `(Harry had a heap of apples)))

; is (atom? (cdr l)) true of fasle where l is (Harry had a heap of apples)
(atom? (cdr `(Harry had a heap of apples)))

;is (atom? (cdr l)) true of false where l is (Harry)
(atom? (cdr `(Harry)))

;is (atom? (car (cdr l))) true of false where l is (swing (low sweet ) cherry oat)
(atom? (car (cdr `(swing (low sweet) cherry oat))))

;is a1 and a2 is the same atom where a1 is Harry and a2 is Harry
(eq? `Harry `Harry)

;is (eq? a1 a2) true or false where a1 is Harry and a2 is Harry
(eq? `Harry `Harry)

;is (eq? a1 a2) where a1 is margarine and a2 is butter
(eq? `margarine `butter)

