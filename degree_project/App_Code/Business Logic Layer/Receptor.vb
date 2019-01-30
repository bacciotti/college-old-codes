Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Definição de Obejtos
'Define os atributos dos objetos usados em toda a aplicação
'Contém os métodos Getters e Setters
'------------------------------------------------------------------------------------------

Public Class Receptor : Inherits Pessoa
'------------------------------------------------------------------------------------------
'Classe Receptor é Especialização da Classe Pessoa
'------------------------------------------------------------------------------------------
#Region "Atributos"
    Private cnpj As String
#End Region

#Region "Propriedades Getters e Setters"
    Public Property pCnpj As String
        Get
            Return cnpj
        End Get
        Set(ByVal value As String)
            cnpj = value
        End Set
    End Property
#End Region

End Class
