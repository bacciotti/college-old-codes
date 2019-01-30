Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Definição de Obejtos
'Define os atributos dos objetos usados em toda a aplicação
'Contém os métodos Getters e Setters
'------------------------------------------------------------------------------------------
Public Class Configuracao
#Region "Atributos"
    Private nome_conf As String
    Private valor_conf As String
#End Region

#Region "Propriedades Getters e Setters"
    Public Property pNome_conf As String
        Get
            Return nome_conf
        End Get
        Set(ByVal value As String)
            nome_conf = value
        End Set
    End Property

    Public Property pValor_conf As String
        Get
            Return valor_conf
        End Get
        Set(ByVal value As String)
            valor_conf = value
        End Set
    End Property

#End Region
End Class
