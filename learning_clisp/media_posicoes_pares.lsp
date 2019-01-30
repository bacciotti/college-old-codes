(defun MpP (l)
	(/ (soma 0 l) (tamanho 0 l))
)

(defun soma (n L)
	(cond
	((null l) 0)
	((evenp n) (+ (car l) (soma (+ 1 n) (cdr l))))
	(t (soma (+ 1 n) (cdr l)))
)
)

(defun tamanho (n L)
	(cond
	((null l) 0)
	((evenp n) (+ 1 (tamanho (+ 1 n) (cdr l))))
	(t(tamanho(+ 1 n) (cdr l)))
)
)


