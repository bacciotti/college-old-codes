Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Regras de Negócios (BLL)
'Faz o intermédio da Classe de Aceso a Dados (DAL) e a de apresentação e modelo.
'-- Trata as informações que aparecem na Dashboard
'------------------------------------------------------------------------------------------
Public Class DashboardBLL
    Public Function MovimentacoesDia(ByVal pDoacao As Boolean) As Integer
        Dim obj_Dashboard_DAL As New DashboardDAL
        Return obj_Dashboard_DAL.MovimentacoesDia(pDoacao)
    End Function
    Public Function TotalPessoas(ByVal pDoador As Boolean) As Integer
        Dim obj_Dashboard_DAL As New DashboardDAL
        Return obj_Dashboard_DAL.TotalPessoas(pDoador)
    End Function
    Public Function SangueMenorQtde() As Sangue
        Dim obj_Dashboard_DAL As New DashboardDAL
        Return obj_Dashboard_DAL.SangueMenorQtde
    End Function
End Class
