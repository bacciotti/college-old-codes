Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Regras de Negócios (BLL)
'Faz o intermédio da Classe de Aceso a Dados (DAL) e a de apresentação e modelo.
'-- Trata a manipulação das configurações (busca e definção de novas configurações)
'------------------------------------------------------------------------------------------

Public Class ConfiguracaoBLL
    Public Function InsereAlteraConfiguracao(ByVal pObj_configuracao As Configuracao) As Boolean
        Dim obj_configuracao_DAL As New ConfiguracaoDAL
        If obj_configuracao_DAL.InsereAlteraConfiguracao(pObj_configuracao, False) Then
            'Se editado com sucesso, retorna 1
            Return "1"
        Else
            'Se edicao der erro, retorna 0
            Return "0"
        End If
    End Function

    Public Function BuscaConfiguracao(ByVal pNomeConf As String) As Configuracao
        Dim obj_configuracao_DAL As New ConfiguracaoDAL
        Return obj_configuracao_DAL.BuscaConfiguracao(pNomeConf)
    End Function

    Public Function RetornaStrConexao() As String
	'------------------------------------------------------------------------------------------
	'-- Quando mudar de servidor/Banco mudar essa string aqui!
	'------------------------------------------------------------------------------------------
        Return "Data Source=.\SQLEXPRESS;Initial Catalog=Banco;Integrated Security=True"
    End Function
End Class
