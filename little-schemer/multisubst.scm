(define multisubst
	(lambda (new old lat)
		(cond
			((null? lat) ())
			((eq? old (car lat)) (cons new (multisubst new old (cdr lat))))
			(else (cons (car lat) (multisubst new old (cdr lat)))))))

(multisubst 'mug 'cup '(coffee cup tea cup and hick cup))
