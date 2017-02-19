#lang racket

;define atom
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

; Atoms
;
;is atom an atom

(atom? `atom)
;is turkey an atom
(atom? `turkey)

;is 1492 an atom
(atom? 1492)

;is u an atom
(atom? `u)

;is *abc$ an atom
(atom? `*abc$)


; Lists
;
;is (atom) a list
`(atom)

;is (atom turkey or) a list
`((atom turkey or))

;is (atom turkey) or a list

;is ((atom turkey) or) a list
`((atom turkey) or)



; S-expression
;
; All atoms and lists are S-express
;
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

;is () a list
`()

;() is an atom
(atom? `())

;is (() () ()) a list
`(() () ())


; The Law of Car
;
;     The primitive car is defined only
;     for non-empty list
;
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


; The Law of Cdr
;
;    The primitive cdr is defined only
;    for non-empty list. The cdr of any
;    non-empty list is always anther list.
;
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



;    The Law of Cons
;
;    The primitive const takes two arguments.
;    The second argument to cons must be a list.
;    The result is a list.
;
;    The first argument is any S-expression.
;    cons adds this to the front of a list.
;
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



;    The Law of Null
;
;    The primitive null? is defined only for lists.
;
;is list null where l is null
(null? `())

;what is (null (quote ()))
(null? (quote ()))

;(null? l) is true of false where l is (a b c)
(null? `(a b c))

;(null? a) true of false where a is spaghetti 
(null? `spaghetti)

;
;    The Law of eq?
;
;    The primitive eq? takes two arguments.
;    Each must be a non-nummeric atom.
;
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

;is (eq? l1 l2) true of false wher l1 is () and l2 is (strawberry)
(eq? `() `(strawberry))

;is (eq? n1 n2) true or false where n1 is 6 and n2 is 7;
(eq? 6 7)

;is (eq? (car l) a) true or false where l is (Marry had a little lamb chop) and a is Mary
(eq? (car `(Marry had a little lamb chop)) `Marry)

;is (eq? (cdr l) a) true of false where l is (soured milk) and a si milk
(eq? (cdr `(soured milk)) `milk)

;is (eq? (car l) (car (cdr l))) true of false where l is (beans beans we need jelly beans)
(eq? (car `(beans beans we need jelly beans)) (car (cdr `(beans beans we need jelly beans))))

