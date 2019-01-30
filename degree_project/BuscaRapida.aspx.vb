Imports System.Data.SqlClient

Partial Class BuscaRapida
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim obj_Pessoa_BLL As New PessoaBLL
        Dim da As SqlDataAdapter = New SqlDataAdapter
        Dim ds As New DataSet1
        Dim ParametroBuscaRapida As String = Page.Session("sParametroBuscaRapida")

        ds = obj_Pessoa_BLL.Buscarapida(ParametroBuscaRapida)
        gridBuscaRapida.DataSource = ds.Tables("Pessoas").DefaultView
        gridBuscaRapida.DataSourceID = ""
        gridBuscaRapida.DataBind()

        If ds.Tables("Pessoas").Rows.Count = 0 Then
            lblResultado.Visible = True
        Else
            lblResultado.Visible = False
        End If
    End Sub

    Protected Sub gridBuscaRapida_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridBuscaRapida.SelectedIndexChanged
        Dim TipoPessoa As String
        Dim idPessoa As String

        TipoPessoa = Trim(gridBuscaRapida.SelectedRow.Cells(3).Text)
        idPessoa = Trim(gridBuscaRapida.SelectedRow.Cells(1).Text)

        Select Case TipoPessoa
            Case "Doador"
                Page.Session("sCodDoador") = idPessoa
                Response.Redirect("~/DetalhesDoador.aspx")
            Case "Receptor"
                Page.Session("sCodReceptor") = idPessoa
                Response.Redirect("~/DetalhesReceptor.aspx")
            Case Else 'Usuario
                Page.Session("sCodUsuario") = idPessoa
                Response.Redirect("~/DetalhesUsuario.aspx")
        End Select

    End Sub
End Class
