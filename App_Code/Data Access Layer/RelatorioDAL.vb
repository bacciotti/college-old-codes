Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

'------------------------------------------------------------------------------------------
'Classe de Acesso a Dados (DAL)
'Faz a interação direta com o Banco de Dados e retorna informações para a BLL.
'-- Trata a manipulação das informações dos relatórios
'------------------------------------------------------------------------------------------


Public Class RelatorioDAL
    Dim obj_Configuracao_BLL As New ConfiguracaoBLL
    Dim StringConexao As String = obj_Configuracao_BLL.RetornaStrConexao

    Public Function GeraRelatorioComDatas(ByVal pNomeRel As String, ByVal pDataInicial As Date, ByVal pDataFinal As Date) As DataSet1
        Dim sqlAd As New SqlDataAdapter
        Dim ds As New DataSet1

        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        Select Case pNomeRel
            Case "RelMovPeriodo" 'Movimentacoes por periodo
                sql = "SELECT id, data, credito, debito, sangue_id FROM Movimentacoes WHERE data >= @DataInicial AND data <= @DataFinal AND status='1'"
            Case "RelDoaPeriodo" 'Doacoes por periodo
                sql = "SELECT id, data, credito, sangue_id, pessoa_id FROM Movimentacoes WHERE data >= @DataInicial AND data <= @DataFinal AND status='1' AND credito>0"
            Case "RelDashboard" 'Relatorio do dashboard
                sql = "SELECT id, data, credito, debito, sangue_id FROM Movimentacoes WHERE data >= @DataInicial AND data <= @DataFinal AND status='1'"
            Case Else 'Retiradas por periodo
                sql = "SELECT id, data, debito, sangue_id, pessoa_id FROM Movimentacoes WHERE data >= @DataInicial AND data <= @DataFinal AND debito>0"
        End Select
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@DataInicial", SqlDbType.Date)).Value = pDataInicial
        Comando.Parameters.Add(New SqlParameter("@DataFinal", SqlDbType.Date)).Value = pDataFinal
        '------------------------------------------------------------------------------------------

        sqlAd.SelectCommand = Comando
        sqlAd.Fill(ds, "Movimentacoes")
        sqlAd.Fill(ds, "Pessoas")
        sqlAd.Fill(ds, "Sangues")

        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
        End Try
        Return ds
        Conexao.Close()

    End Function

    Public Function GeraRelatorio(ByVal pNomeRel As String) As DataSet1
        Dim sqlAd As New SqlDataAdapter
        Dim ds As New DataSet1

        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        Select Case pNomeRel
            Case "RelQtdeBolsas" 'Quantidade de bolsas
                sql = "SELECT sangue_id,credito, debito FROM Movimentacoes WHERE status = '1'"
            Case "RelDoadoresCad" 'Doadores cadastrados
                sql = "SELECT id, nome, telefone1, cidade, sangue_id FROM Pessoas WHERE tipo_pessoa_id = '1' ORDER BY nome"
            Case "CorrespMassa"
                sql = "SELECT nome, endereco, cep, cidade, estado FROM Pessoas WHERE tipo_pessoa_id = '1'"
            Case Else 'Receptores cadastrados
                sql = "SELECT id,nome, telefone1, cidade FROM Pessoas WHERE tipo_pessoa_id = '2' ORDER BY nome"
        End Select
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        sqlAd.SelectCommand = Comando

        sqlAd.Fill(ds, "Pessoas")
        sqlAd.Fill(ds, "Movimentacoes")
        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
        End Try
        Return ds
        Conexao.Close()

    End Function
End Class
