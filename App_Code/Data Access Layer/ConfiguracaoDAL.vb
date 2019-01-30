Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

'------------------------------------------------------------------------------------------
'Classe de Acesso a Dados (DAL)
'Faz a interação direta com o Banco de Dados e retorna informações para a BLL.
'-- Trata a manipulação das configurações
'------------------------------------------------------------------------------------------

Public Class ConfiguracaoDAL

#Region "Atributos"
    Dim obj_Configuracao_BLL As New ConfiguracaoBLL
    Dim StringConexao As String = obj_Configuracao_BLL.RetornaStrConexao
#End Region

#Region "Métodos"

    Public Function InsereAlteraConfiguracao(ByVal pObj_configuracao As Configuracao, ByVal pModoInserir As Boolean) As Boolean
        '------------------------------------------------------------------------------------------
		'Nesse caso sempre vai ser para alterar, pois nenhum usuário vai fazer a inserção de configuração, apenas alterá-las.
		'A inserção é feita direto no BD.
        'Vou setar o parâmetro pModoInserir para False
		'------------------------------------------------------------------------------------------
        pModoInserir = False

        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        If pModoInserir Then
            sql = "Insert into Configuracoes (nome_conf, valor_conf) values (@Nome_conf, @Valor_conf)"
        Else
            sql = "UPDATE Configuracoes set nome_conf=@Nome_conf,valor_conf=@Valor_conf WHERE nome_conf=@Nome_conf"
        End If
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Nome_conf", SqlDbType.VarChar)).Value = Trim(pObj_configuracao.pNome_conf)
        Comando.Parameters.Add(New SqlParameter("@Valor_conf", SqlDbType.VarChar)).Value = Trim(pObj_configuracao.pValor_conf)
        '------------------------------------------------------------------------------------------

        'Abre conexão, executa comando e fecha conexão TRATANDO EXCEÇÃO-----
        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
            Return False
        End Try
        Conexao.Close()
        'Se tudo der certo, retorna TRUE--------
        Return True
        '----------------------------------------
    End Function
    Public Function BuscaConfiguracao(ByVal pNomeConf As String) As Configuracao
		'------------------------------------------------------------------------------------------
		'-- Função usada ao longo de toda aplicação para testar as condições das configurações.
		'------------------------------------------------------------------------------------------
        Dim sql As String = "SELECT * FROM Configuracoes where nome_conf = @Nome_conf"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Dim obj_Configuracao As New Configuracao

        Comando.Parameters.Add(New SqlParameter("@Nome_conf", SqlDbType.VarChar)).Value = pNomeConf

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            obj_Configuracao.pNome_conf = Trim(DtReader.Item("nome_conf"))
            If IsDBNull(DtReader.Item("valor_conf")) Then
                obj_Configuracao.pValor_conf = " "
            Else
                obj_Configuracao.pValor_conf = Trim(DtReader.Item("valor_conf"))
            End If
        End If
        DtReader.Close()
        Conexao.Close()
        Return obj_Configuracao
    End Function
#End Region

End Class

