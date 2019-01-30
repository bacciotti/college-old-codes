Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Definição de Obejtos
'Define os atributos dos objetos usados em toda a aplicação
'Contém os métodos Getters e Setters
'------------------------------------------------------------------------------------------

Public Class FichaPreDoacao
#Region "Atributos"
    Private aprovada As Boolean
    Private peso_doador As Double
    Private aborto_parto As Boolean
    Private gravida As Boolean
    Private amamentando As Boolean
    Private tatuagem_piercing_acupuntura As Boolean
    Private transfusao As Boolean
    Private bebidas_alcoolicas As Boolean
    Private usuario_drogas As Boolean
    Private doencas_infectocontagiosas As Boolean
    Private gripe_resfriado_diarreia As Boolean
    Private ferimento As Boolean
#End Region

#Region "Atributos Getters e Setters"
    Public Property pAprovada As Boolean
        Get
            Return aprovada
        End Get
        Set(ByVal value As Boolean)
            aprovada = value
        End Set
    End Property
    Public Property pPeso_doador As Double
        Get
            Return peso_doador
        End Get
        Set(ByVal value As Double)
            peso_doador = value
        End Set
    End Property

    Public Property pAborto_parto As Boolean
        Get
            Return aborto_parto
        End Get
        Set(ByVal value As Boolean)
            aborto_parto = value
        End Set
    End Property
    Public Property pGravida As Boolean
        Get
            Return gravida
        End Get
        Set(ByVal value As Boolean)
            gravida = value
        End Set
    End Property
    Public Property pAmamentando As Boolean
        Get
            Return amamentando
        End Get
        Set(ByVal value As Boolean)
            amamentando = value
        End Set
    End Property
    Public Property pTatuagem_piercing_acupuntura As Boolean
        Get
            Return tatuagem_piercing_acupuntura
        End Get
        Set(ByVal value As Boolean)
            tatuagem_piercing_acupuntura = value
        End Set
    End Property
    Public Property pTransfusao As Boolean
        Get
            Return transfusao
        End Get
        Set(ByVal value As Boolean)
            transfusao = value
        End Set
    End Property
    Public Property pBebidas_alcoolicas As Boolean
        Get
            Return bebidas_alcoolicas
        End Get
        Set(ByVal value As Boolean)
            bebidas_alcoolicas = value
        End Set
    End Property
    Public Property pUsuario_drogas As Boolean
        Get
            Return usuario_drogas
        End Get
        Set(ByVal value As Boolean)
            usuario_drogas = value
        End Set
    End Property
    Public Property pDoencas_infectocontagiosas As Boolean
        Get
            Return doencas_infectocontagiosas
        End Get
        Set(ByVal value As Boolean)
            doencas_infectocontagiosas = value
        End Set
    End Property
    Public Property pGripe_resfriado_diarreia As Boolean
        Get
            Return gripe_resfriado_diarreia
        End Get
        Set(ByVal value As Boolean)
            gripe_resfriado_diarreia = value
        End Set
    End Property
    Public Property pFerimento As Boolean
        Get
            Return ferimento
        End Get
        Set(ByVal value As Boolean)
            ferimento = value
        End Set
    End Property
#End Region
End Class
