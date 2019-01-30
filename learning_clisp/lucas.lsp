(defun a(L)
	(car l)
)

(defun b(L)
	(cdr l)
)

(defun c (l)
	(cons 2 l)
)

(defun d(l)
	(cond
	( (null l) "fim")
	(t (print  (car l)) (d (cdr l)))
	)
)

(defun e(l)
	(length l)
)

(defun f (L)
	(reverse l) 
)

(defun g (l)
	(cond
	( (null l) 0)
	((+ (car l ) (g (cdr l) )))  
	
	)
)

(defun h (l)
	(cond
	( (null l) 0)
	( (evenp (car l))  (print (car l))(h (cdr l) ))
	(t (h (cdr l)))
	)
)

(defun i (l)
	(cond
	( (null l) 0)
	( (oddp (car l))  (print (car l))(h (cdr l) ))
	(t (h (cdr l)))
	)
)


(defun j (l)
	(cond
	( (null l) 'fim)
	(  (oddp (length l)) (print (car l))(j (cdr l)) )
	(t (j (cdr l)))
	)
)


(defun k (l)
	(cond
	( (null l) 0)
	(  (even (length l)) (print (car l))(k (cdr l)) )
	(t (k (cdr l)))
	)
)

(defun mediapimp (l)
	(/ (somapimp l 1) (contapimp l 1))
	)
	
(defun somapimp(l c)
	(cond
	((null l) 0)
	((oddp c)(+(car l) (somapimp (cdr l)(+ 1 c))))
	(t (somapimp (cdr l) (+ 1 c)))

))
(defun mediapimp(l c)
	(cond
	((null l) 0)
	((oddp c) (+ 1 (mediapimp (cdr l)(+ 1 c))))
	(t (mediapimp (cdr l) (+ 1 c)))

))





(defun LISTASOPAR (l)
	(cond
	((null l) '())
	((oddp (car l)) (cons (+ 1 (car l)) (listasopar(cdr l))))
	(t (cons (car l ) (listasopar(cdr l))))

))