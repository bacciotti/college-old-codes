(defun ppar (N L)
	(cond
	((null L) "fim")
	( (evenp N) (print (car l))(ppar (+ n 1)(cdr l)))
	(t (ppar (+ 1 n)(cdr l)))
	)
	)	
	
	
(defun listapar(l)
	(ppar 0 l)
)