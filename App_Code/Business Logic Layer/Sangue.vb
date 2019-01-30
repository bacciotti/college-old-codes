Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Definição de Obejtos
'Define os atributos dos objetos usados em toda a aplicação
'Contém os métodos Getters e Setters
'------------------------------------------------------------------------------------------

Public Class Sangue
#Region "Atributos"
    Private tipo As String
    Private saldo As String
#End Region

#Region "Propriedades Getters e Setters"
    Public Property pTipo As String
        Get
            Return tipo
        End Get
        Set(ByVal value As String)
            tipo = value
        End Set
    End Property

    Public Property pSaldo As String
        Get
            Return saldo
        End Get
        Set(ByVal value As String)
            saldo = value
        End Set
    End Property

#End Region
End Class
