#lang racket

;define rember
(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) a) (cdr lat))
      (else (cons (car lat) (rember a (cdr lat)))))))

;what is the value of (rember a lat) when a is mint and lat is (lamb chops and mint jelly)
(rember 'mint '(lamb chops and mint jelly))

;what is the value of (rember a lat) when a is and and lat is (bacon lettuce and tomato)
(rember 'and '(bacon lettuce and tomato))

(rember 'sauce '(soy sauce and tomato sauce))

;define firsts
(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else (cons (car(car l)) (firsts (cdr l)))))))

(firsts '((a b) (c d) (e f)))

;define insertR
(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old)(cons old
                                (cons new (cdr lat))))
      (else (cons (car lat)
                  (insertR new old (cdr lat)))))))

(insertR 'jalapeno 'and '(tacos tamales and salsa))

(insertR 'e 'd '(a b c d f g d h))

(insertR 'topping 'fudge '(ice cream fudge for dessert))

;define insertL
(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old) (cons new
                                 (cons old (cdr lat))))
      (else (cons (car lat)
                  (insertL new old (cdr lat)))))))


;define subst
(define subst
  (lambda (new old lat)
    (cond
    ((null? lat) '())
    ((eq? (car lat) old) (cons new
                               (cdr lat)))
    (else (cons (car lat)
                (subst new old
                       (cdr lat)))))))

;define subst2
(define subst2
  (lambda (new o1 o2 lat)
    (cond
    ((null? lat) '())
    ((or (eq? (car lat) o1) (eq? (car lat) o2)) (cons new (cdr lat)))
    (else (cons (car lat) (subst2 new o1 o2 lat))))))

(subst2 'vanilla 'chocolate 'banana '(banana ice cream with chocolate topping))

;define multirember
(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) a) (multirember a (cdr lat)))
      (else (cons (car lat) (multirember a (cdr lat)))))))

(multirember 'cup '(coffee cup tea cup and hick cup))

;define multiinsertR
(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old) (cons old
                                 (cons new 
                                       (multiinsertR new old (cdr lat)))))
      (else (cons (car lat)
                  (multiinsertR new old (cdr lat)))))))

;deine multiinsertL
(define multiinsertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat) old) (cons new
                             (cons old
                                   (multiinsertL new old (cdr lat)))))
      (else (cons (car lat)
                  (multiinsertL new old (cdr lat)))))))
      
(multiinsertL 'fried 'fish '(chips and fish and fried))

;deine multisubst
(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      ((eq? (car lat)) (cons new
                             (multisubst new old (cdr lat))))
      (else (cons (car lat)
                  (multisubst new old (cdr lat)))))))

;first six functions oprator a lat
;    (rember a lat)              remove member first a from lat
;    (insertR new old lat）      insert new atom to first old atom's right when find first old atom in lat
;    (insertL new old lat)       insert new atom to first old atom's left when find first old atom in lat
;    (firsts list)               cons a list that every item is the car of list's item
;    (subst new old lat)         replace first old in lat with new
;    (sub new o1 o2 lat)         replace first o1 or o2 in lat with new
;
;then four functions that multi*
;    (mulitirember a lat)           remove all member equal a from lat
;    (multiinsertR new old lat)     insert new atom to all old atom's right in the lat
;    (multiinsertL new old lat)     insert new atom to all old atom's left in the lat   
;    (multisubst new old lat)       replace all old with new in lat
;
;and we get 3 Commandments
;
;The first Comandment
;
;
;
;
;