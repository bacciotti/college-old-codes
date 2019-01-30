Imports Microsoft.VisualBasic
'------------------------------------------------------------------------------------------
'Classe de Definição de Obejtos
'Define os atributos dos objetos usados em toda a aplicação
'Contém os métodos Getters e Setters
'------------------------------------------------------------------------------------------
Public Class Corresp
    Private pessoa_id As Integer
    Private data As Date

#Region "Propriedades Getters e Setters"
    Public Property pPessoa_id As Integer
        Get
            Return pessoa_id
        End Get

        Set(ByVal value As Integer)
            pessoa_id = value
        End Set
    End Property

    Public Property pData As Date
        Get
            Return data
        End Get
        Set(ByVal value As Date)
            data = value
        End Set
    End Property
#End Region

End Class
