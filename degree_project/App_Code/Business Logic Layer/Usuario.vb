Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Definição de Obejtos
'Define os atributos dos objetos usados em toda a aplicação
'Contém os métodos Getters e Setters
'------------------------------------------------------------------------------------------

Public Class Usuario : Inherits Pessoa
'------------------------------------------------------------------------------------------
'Classe Usuario é Especialização da Classe Pessoa
'------------------------------------------------------------------------------------------
#Region "Atributos"
    Private cargo As String
    Private nome_usuario As String
    Private senha As String
    Private tipo_usuario_id As Integer
#End Region

#Region "Propriedades Getters e Setters"
    Public Property pCargo As String
        Get
            Return cargo
        End Get
        Set(ByVal value As String)
            cargo = value
        End Set
    End Property
    Public Property pNome_usuario As String
        Get
            Return nome_usuario
        End Get
        Set(ByVal value As String)
            nome_usuario = value
        End Set
    End Property
    Public Property pSenha As String
        Get
            Return senha
        End Get
        Set(ByVal value As String)
            senha = value
        End Set
    End Property

    Public Property pTipo_usuario_id As Integer
        Get
            Return tipo_usuario_id
        End Get
        Set(ByVal value As Integer)
            tipo_usuario_id = value
        End Set
    End Property
#End Region

#Region "Métodos"
    '--------------------------------------------------------------
    '-- Função usuario_disponivel() verifica se existe no banco de dados
    '-- um usuário com o nome digitado.
    '-- Se NÃO existir (ou seja, pode ser cadastrado), retorna TRUE
    '--------------------------------------------------------------
    Function usuario_disponivel() As Boolean
        Return False
    End Function
#End Region

End Class
