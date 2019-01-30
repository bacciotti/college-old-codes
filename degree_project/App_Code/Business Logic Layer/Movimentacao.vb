Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Definição de Obejtos
'Define os atributos dos objetos usados em toda a aplicação
'Contém os métodos Getters e Setters
'------------------------------------------------------------------------------------------

Public Class Movimentacao
#Region "Atributos"
    Private credito As Double
    Private debito As Double
    Private data As Date
    '----------------------------------------------
    '-- A quantidade movimentada é medida em número de bolsas, cada bolsa contendo 450ml de sangue, no âmbito de todo o software
    '----------------------------------------------
    Private pessoa_id As Integer
    Private sangue_id As Integer
#End Region

#Region "Propriedades Getters e Setters"
    Public Property pPessoa_id As Integer
        Get
            Return pessoa_id
        End Get
        Set(ByVal value As Integer)
            pessoa_id = value
        End Set
    End Property
    Public Property pCredito As Double
        Get
            Return credito
        End Get
        Set(ByVal value As Double)
            credito = value
        End Set
    End Property
    Public Property pDebito As Double
        Get
            Return debito
        End Get
        Set(ByVal value As Double)
            debito = value
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
