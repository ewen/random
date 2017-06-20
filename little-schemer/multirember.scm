(define multirember
	(lambda (a lat)
		(cond
			((null? lat) ())
			((eq? a (car lat)) (multirember a (cdr lat)))
			(else (cons (car lat) (multirember a (cdr lat)))))))

(multirember 'cup '(coffee cup tea cup and hick cup))
