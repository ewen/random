(define multiinsertR
	(lambda (new old lat)
		(cond
			((null? lat) ())
			((eq? old (car lat)) (cons old (cons new (multiinsertR new old (cdr lat)))))
			(else (cons (car lat) (multiinsertR new old (cdr lat)))))))

(multiinsertR 'coaster 'cup '(coffee cup tea cup and hick cup))
