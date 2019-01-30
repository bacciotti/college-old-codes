(defun fat (N)
	(cond
		((EQUAL N 0) 1)
		((< N 0) 'ERRO)
		(T (* N (FAT (- N 1))))
	)
)