(define add1
	(lambda (n)
		(+ n 1)))

(define sub1
	(lambda (n)
		(- n 1)))

(define o+
	(lambda (a b)
		(cond
			((zero? a) b)
			(else (o+ (sub1 a) (add1 b))))))

(define o-
	(lambda (a b)
		(cond
			((zero? b) a)
			(else (o- (sub1 a) (sub1 b))))))

(define addtup
	(lambda (tup)
		(cond
			((null? tup) 0)
			(else (o+ (car tup) (addtup (cdr tup)))))))

(define x
	(lambda (a b)
		(cond
			((zero? b) 0)
			(else (o+ a (x a (sub1 b)))))))

(define tup+
	(lambda (tup1 tup2)
		(cond
			((null? tup1) tup2)
			((null? tup2) tup1)
			(else (cons (o+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))))))

(define >
	(lambda (a b)
		(cond
			((zero? a) #f)
			((zero? b) #t)
			(else (> (sub1 a) (sub1 b))))))

(define <
	(lambda (a b)
		(cond
			((zero? b) #f)
			((zero? a) #t)
			(else (< (sub1 a) (sub1 b))))))

(define =
	(lambda (a b)
		(cond
			((< a b) #f)
			((> a b) #f)
			(else #t))))

(define ^
	(lambda (a b)
		(cond
			((zero? b) 1)
			(else (x a (^ a (sub1 b)))))))

(define %
	(lambda (a b)
		(cond
			((< a b) 0)
			(else (add1 (% (o- a b) b))))))
