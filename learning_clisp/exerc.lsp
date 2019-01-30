(defun um (L)
	(cond
		(( null L) '())
		((listp (car l)) (cons (um (car l))(um (cdr l))))
		((numberp (car l)) (cons (car l) (um (cdr l))))
		( T (um (cdr l)))
	)
)

(defun dois (L)
	(cond
		(( null L) '())
		((> (car l) -1)(cons (car l) (dois (cdr l))))
		( T (dois (cdr l)))
	)
)

(defun quatro (L N)
	(cond
		((null l) 0)
		((equal (car l) n) (+ 1 (quatro (cdr l) n)))
		(T(quatro (cdr l) n))
	)
)

(defun media (L)
	(/ (soma L) (length l))
)

(defun soma (L)
	( cond
		((null l) 0)
		(T(+ (car l) (soma (cdr l))))
	)
)