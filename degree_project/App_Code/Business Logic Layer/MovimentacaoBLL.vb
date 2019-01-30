Imports Microsoft.VisualBasic
'------------------------------------------------------------------------------------------
'Classe de Regras de Negócios (BLL)
'Faz o intermédio da Classe de Aceso a Dados (DAL) e a de apresentação e modelo.
'-- Trata a manipulação das Movimentações (inserção, etc. de Doações e Retiradas.)
'------------------------------------------------------------------------------------------
Public Class MovimentacaoBLL

    'Doações
    Public Function ValidaDoacao(ByVal pId As Integer) As Boolean
        Dim obj_Movimentacao_DAL As New MovimentacaoDAL
        If obj_Movimentacao_DAL.ValidaDoacao(pId) Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function InsereDoacao(ByVal pObj_Doacao As Movimentacao) As Boolean
        Dim obj_Movimentacao_DAL As New MovimentacaoDAL
        If obj_Movimentacao_DAL.InsereDoacao(pObj_Doacao) Then
            Return True
        Else
            Return False
        End If
    End Function

    'Retiradas
    Public Function InsereRetirada(ByVal pObj_Retirada As Movimentacao) As Boolean
        Dim obj_Movimentacao_DAL As New MovimentacaoDAL
        If obj_Movimentacao_DAL.InsereRetirada(pObj_Retirada) Then
            Return True
        Else
            Return False
        End If
    End Function

    'Outros
    Public Function RetornaQtdeBolsas(ByVal pId_Sangue As Integer) As Integer
        Dim Obj_Movimentacao_DAL As New MovimentacaoDAL
        Return Obj_Movimentacao_DAL.RetornaQtdeBolsas(pId_Sangue)
    End Function
    Public Function RetornaQtdeSangue(ByVal pId_Sangue As Integer) As Double
        Dim Obj_Movimentacao_DAL As New MovimentacaoDAL
        Return Obj_Movimentacao_DAL.RetornaQtdeBolsas(pId_Sangue) * 450 'Retorna a quantidade em ML, cada BOLSA tem 450ml de sangue.
    End Function
    Public Function PodeRetirar(ByVal pId_Sangue As Integer, ByVal pQtde As Integer) As Boolean
        Dim Obj_Movimentacao_DAL As New MovimentacaoDAL
        If Obj_Movimentacao_DAL.RetornaQtdeBolsas(pId_Sangue) - pQtde >= 0 Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function RetornaIdMovimentacao(ByVal pObj_Movimentacao As Movimentacao) As Integer
        Dim Obj_Movimentacao_DAL As New MovimentacaoDAL
        Return Obj_Movimentacao_DAL.RetornaIdMovimentacao(pObj_Movimentacao)
    End Function
End Class
