Imports System.Data.OleDb

Partial Class ListagemGeral
    Inherits System.Web.UI.Page

    Protected Sub GridDoadores_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridDoadores.SelectedIndexChanged
        'esse evento vai chamar a pagina de DETALHES DO DOADOR quando o
        'usuario clicar no botao DETALHES, que fica ao lado de cada registro
        'do GRIDVIEW, definindo uma sessao com o Codigo do Doador.
        Page.Session("CodigoDoador") = GridDoadores.SelectedRow.Cells(1).Text
        Response.Redirect("~/DetalhesVoluntario.aspx")
    End Sub

    Protected Sub btnBuscar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBuscar.Click
        Dim StringConexao As String
        StringConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\PIH2011\BancoSangue.mdb'"
        'Comando que vai fazer o select no banco onde o Nome do Funcionario for igual ao
        'que o usuario digitou no textbox de busca
        Dim SQL As String = "SELECT * FROM [Voluntarios] WHERE ([Nome] LIKE '%' + @NomeBusca + '%')"
        Dim Conn As New OleDbConnection(StringConexao)
        'Criando e instanciando um dataset e um adaptador
        Dim ds As Data.DataSet = New Data.DataSet()
        Dim da As OleDbDataAdapter = New OleDbDataAdapter
        Dim Cmd As New OleDbCommand(SQL, Conn)

        da.SelectCommand = Cmd
        Cmd.Parameters.Add(New OleDbParameter("@NomeBusca", txtBuscarVol.Text))
        da.Fill(ds, "Voluntarios")
        'Atribuindo o dataset ao gridview, para mostrar os resultados
        GridDoadores.DataSource = ds.Tables("Voluntarios").DefaultView
        GridDoadores.DataSourceID = ""
        GridDoadores.DataBind()
    End Sub
End Class
