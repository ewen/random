(define multiinsertL
	(lambda (new old lat)
		(cond
			((null? lat) ())
			((eq? old (car lat)) (cons new (cons old (multiinsertL new old (cdr lat)))))
			(else (cons (car lat) (multiinsertL new old (cdr lat)))))))

(multiinsertL 'in 'cup '(coffee cup tea cup and hick cup))
