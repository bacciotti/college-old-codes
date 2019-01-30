Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

'------------------------------------------------------------------------------------------
'Classe de Acesso a Dados (DAL)
'Faz a interação direta com o Banco de Dados e retorna informações para a BLL.
'-- Trata a manipulação das Movimentações - Doações e Retiradas e suas propriedades.
'------------------------------------------------------------------------------------------

Public Class MovimentacaoDAL
#Region "Atributos"
    Dim obj_Configuracao_BLL As New ConfiguracaoBLL
    Dim StringConexao As String = obj_Configuracao_BLL.RetornaStrConexao
#End Region

#Region "Métodos"
    'Funções relacionadas às Doações
    Public Function ValidaDoacao(ByVal pId As Integer) As Boolean
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        sql = "UPDATE Movimentacoes set status='1' WHERE id = @Id"
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pId
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
    Public Function InsereDoacao(ByVal pObj_Doacao As Movimentacao) As Boolean
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        sql = "Insert into Movimentacoes (data,sangue_id,credito,debito,pessoa_id,status) values (@Data,@Sangue_id,@Credito,@Debito,@Pessoa_id,@Status)"
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Data", SqlDbType.DateTime)).Value = pObj_Doacao.pData
        Comando.Parameters.Add(New SqlParameter("@Sangue_id", SqlDbType.Int)).Value = pObj_Doacao.pSangue_id
        Comando.Parameters.Add(New SqlParameter("@Credito", SqlDbType.Int)).Value = pObj_Doacao.pCredito
        Comando.Parameters.Add(New SqlParameter("@Debito", SqlDbType.Int)).Value = pObj_Doacao.pDebito
        Comando.Parameters.Add(New SqlParameter("@Pessoa_id", SqlDbType.Int)).Value = pObj_Doacao.pPessoa_id
        Comando.Parameters.Add(New SqlParameter("@Status", SqlDbType.Bit)).Value = 0
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

    'Funções relacionadas às Retiradas
    Public Function RetornaQtdeBolsas(ByVal pId_Sangue As Integer) As Integer
		'------------------------------------------------------------------------------------------
		'-- Retorna a quantidade de bolsas existentes daquele tipo de sangue.
		'------------------------------------------------------------------------------------------
        Dim QtdeBolsas As Integer
        Dim sql As String = "SELECT SUM(credito-debito) FROM Movimentacoes WHERE sangue_id = @Id_Sangue AND status = 1"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Comando.Parameters.Add(New SqlParameter("@Id_Sangue", SqlDbType.Int)).Value = pId_Sangue

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            If IsDBNull(DtReader.Item(0)) Then
                QtdeBolsas = 0
            Else
                QtdeBolsas = DtReader.Item(0)
            End If
        Else
            QtdeBolsas = 0
        End If
        DtReader.Close()
        Conexao.Close()

        Return QtdeBolsas
        Return 0
    End Function
    Public Function InsereRetirada(ByVal pObj_Retirada As Movimentacao) As Boolean
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        sql = "Insert into Movimentacoes (data,sangue_id,credito,debito,pessoa_id,status) values (@Data,@Sangue_id,@Credito,@Debito,@Pessoa_id,@Status)"
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Data", SqlDbType.DateTime)).Value = pObj_Retirada.pData
        Comando.Parameters.Add(New SqlParameter("@Sangue_id", SqlDbType.Int)).Value = pObj_Retirada.pSangue_id
        Comando.Parameters.Add(New SqlParameter("@Credito", SqlDbType.Int)).Value = pObj_Retirada.pCredito
        Comando.Parameters.Add(New SqlParameter("@Debito", SqlDbType.Int)).Value = pObj_Retirada.pDebito
        Comando.Parameters.Add(New SqlParameter("@Pessoa_id", SqlDbType.Int)).Value = pObj_Retirada.pPessoa_id
        Comando.Parameters.Add(New SqlParameter("@Status", SqlDbType.Bit)).Value = 1 'As retiradas SEMPRE são TRUE.
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

    'Outras funçoes diversas
    Public Function RetornaIdMovimentacao(ByVal pObj_Movimentacao As Movimentacao) As Integer
        Dim IdMovimentacao As Integer
        Dim sql As String = "SELECT id FROM Movimentacoes WHERE data = @Data AND pessoa_id = @Pessoa_id"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Comando.Parameters.Add(New SqlParameter("@Data", SqlDbType.Date)).Value = pObj_Movimentacao.pData
        Comando.Parameters.Add(New SqlParameter("@Pessoa_id", SqlDbType.Int)).Value = pObj_Movimentacao.pPessoa_id

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            IdMovimentacao = DtReader.Item(0)
        Else
            IdMovimentacao = 0
        End If
        DtReader.Close()
        Conexao.Close()

        Return IdMovimentacao
        Return 0
    End Function

	'------------------------------------------------------------------------------------------	
    'Não se pode Excluir Movimentação por que o BD vai ficar sem coesão
    'Podem ter pessoas associadas às Movimentações.
    'A rotina vai ficar aqui, talvez para uma futura alteração, mas ninguém vai 
    'chamá-la.
	'------------------------------------------------------------------------------------------
    Public Function ExcluirMovimentacao(ByVal pId As Integer) As Boolean
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        sql = "Delete FROM Movimentacoes WHERE id = @Id"
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Bit)).Value = pId
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
#End Region

End Class
