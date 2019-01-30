Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

'------------------------------------------------------------------------------------------
'Classe de Acesso a Dados (DAL)
'Faz a interação direta com o Banco de Dados e retorna informações para a BLL.
'-- Trata a manipulação das informações da tela principal Dashboard.
'------------------------------------------------------------------------------------------

Public Class DashboardDAL
    Dim obj_Configuracao_BLL As New ConfiguracaoBLL
    Dim StringConexao As String = obj_Configuracao_BLL.RetornaStrConexao

    Public Function MovimentacoesDia(ByVal pDoacao As Boolean) As Integer
        'Parâmetro pDoacao indica se a movimentação requerida
        'é DOAÇÃO (true) ou RETIRADA (false)
        Dim sqlAd As New SqlDataAdapter
        Dim ds As New DataSet1
        Dim DtReader As SqlDataReader
        Dim QtdeMov As Integer

        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        If pDoacao Then
            sql = "SELECT COUNT(*) FROM Movimentacoes WHERE data=@Data AND credito > 0"
        Else
            sql = "SELECT COUNT(*) FROM Movimentacoes WHERE data=@Data AND debito > 0"
        End If
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Data", SqlDbType.Date)).Value = Date.Today
        '------------------------------------------------------------------------------------------

        sqlAd.SelectCommand = Comando
        sqlAd.Fill(ds, "Movimentacoes")

        Try
            Conexao.Open()
            DtReader = Comando.ExecuteReader()
            DtReader.Read()
            QtdeMov = DtReader.Item(0)
            DtReader.Close()
        Catch ex As Exception
            Conexao.Close()
        End Try
        Return QtdeMov
        Conexao.Close()

    End Function
    Public Function TotalPessoas(ByVal pDoador As Boolean) As Integer
        'Parâmetro pDoador indica se a pessoa requerida
        'é DOADOR (true) ou RECEPTOR (false)
        Dim sqlAd As New SqlDataAdapter
        Dim ds As New DataSet1
        Dim DtReader As SqlDataReader
        Dim QtdeMov As Integer

        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        If pDoador Then
			'É [COUNT-1] por que tem um registro chamado MASSA, usado para enviar correspondências em massa.
            sql = "SELECT (COUNT(*) -1) FROM Pessoas WHERE tipo_pessoa_id = 1"
        Else
            sql = "SELECT COUNT(*) FROM Pessoas WHERE tipo_pessoa_id = 2"
        End If
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        sqlAd.SelectCommand = Comando
        sqlAd.Fill(ds, "Movimentacoes")

        Try
            Conexao.Open()
            DtReader = Comando.ExecuteReader()
            DtReader.Read()
            QtdeMov = DtReader.Item(0)
            DtReader.Close()
        Catch ex As Exception
            Conexao.Close()
        End Try
        Return QtdeMov
        Conexao.Close()
    End Function
    Public Function SangueMenorQtde() As Sangue

        Dim sql As String = "SELECT S.tipo, SUM (credito-debito) as saldo from Movimentacoes M, Sangues S where m.sangue_id=s.id group by S.tipo order by saldo"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Dim obj_Sangue As New Sangue

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            obj_Sangue.pTipo = DtReader.Item("tipo")
            obj_Sangue.pSaldo = DtReader.Item("saldo")
        End If
        DtReader.Close()
        Conexao.Close()
        Return obj_Sangue

    End Function
End Class
