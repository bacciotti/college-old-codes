Imports System.Data.OleDb

Partial Class Inicio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Declaracao de variaveis e objetos
        Dim StringConexao As String
        Dim Commando As OleDbCommand
        Dim Commando2 As OleDbCommand
        Dim Commando3 As OleDbCommand
        Dim Conexao As OleDbConnection
        Dim sql As String
        Dim sql2 As String
        Dim sql3 As String
        Dim tb As OleDbDataReader
        Dim tb2 As OleDbDataReader
        Dim tb3 As OleDbDataReader

        'Pega os dados no banco
        lblData.Text = Date.Now.Date
        StringConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\PIH2011\BancoSangue.mdb'"
        sql = "Select * from Estabelecimento"
        sql2 = "Select tipoSangue from Sangues order by Quantidade"
        sql3 = "Select Count(codigoDoacao) from Doacoes where data = @DataAtual"
        Conexao = New OleDbConnection(StringConexao)
        Commando = New OleDbCommand(sql, Conexao)
        Commando2 = New OleDbCommand(sql2, Conexao)
        Commando3 = New OleDbCommand(sql3, Conexao)
        Commando3.Parameters.Add("@DataAtual", OleDbType.Date).Value = Date.Now.Date 'Pegar todas as doacoes do dia atual
        'Abre a conexao e executa o comando
        Conexao.Open()
        tb = Commando.ExecuteReader 'O reader serve para ler os resultados de um SELECT 
        tb2 = Commando2.ExecuteReader
        tb3 = Commando3.ExecuteReader
        tb.Read() 'Efetivamente lê o resultado
        tb2.Read()
        tb3.Read()

        'Atribui os dados do estabelecimento aos LABELS dispostos na pagina
        lblNomeEstab.Text = tb.Item(0).ToString
        lblTipoSang.Text = tb2.Item(0).ToString
        lblDoacoes.Text = tb3.Item(0).ToString
        Conexao.Close() ' Encerra a conexao
    End Sub
End Class