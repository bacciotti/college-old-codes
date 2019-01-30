Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Definição de Obejtos
'Define os atributos dos objetos usados em toda a aplicação
'Contém os métodos Getters e Setters
'------------------------------------------------------------------------------------------

Public Class Doador : Inherits Pessoa
'------------------------------------------------------------------------------------------
'Classe Doador é Especialização da Classe Pessoa
'------------------------------------------------------------------------------------------
#Region "Atributos"
    '----------------------------------------------
    '-- Atributo sangue_id é chave estrangeira que referencia o tipo de sangue da tabela SANGUE
    '----------------------------------------------
    Private sangue_id As Integer
#End Region
#Region "Propriedades Getters e Setters"
    Public Property pSangue_id As Integer
        Get
            Return sangue_id
        End Get
        Set(ByVal value As Integer)
            sangue_id = value
        End Set
    End Property
#End Region
End Class
