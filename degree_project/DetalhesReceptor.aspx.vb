
Partial Class DetalhesDoador
    Inherits System.Web.UI.Page
    Protected Sub btnEditarReceptor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditarReceptor.Click
        Dim obj_Pessoa_BLL As New PessoaBLL
        Dim obj_Receptor As New Receptor

        obj_Receptor = obj_Pessoa_BLL.BuscaDadosReceptor(Page.Session("sCodReceptor"))
        Page.Session("sObjReceptor") = obj_Receptor
        Page.Session("sModoEdicaoReceptor") = 1

        Response.Redirect("~/CadastroReceptor.aspx")
    End Sub

    Protected Sub btnNovaRetirada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovaRetirada.Click
        Dim obj_Pessoa_BLL As New PessoaBLL
        Dim obj_Receptor As New Receptor
        Dim CodigoReceptor As Integer = Page.Session("sCodReceptor")
        Dim NomeReceptor As String

        obj_Receptor = obj_Pessoa_BLL.BuscaDadosReceptor(CodigoReceptor)
        NomeReceptor = obj_Receptor.pNome

        Page.Session("sObjReceptor") = obj_Receptor
        Page.Session("sNomeReceptor") = NomeReceptor

        Response.Redirect("~/CadastrarRetirada.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '--------------------------------------------------------------------------------------------
        'Testa se o usuário é Administrador (flag 2) ou Usuário Normal (Flag 1).
        If Page.Session("sUserRole") = 2 Then
            btnExcluirReceptor.Visible = True
        Else
            btnExcluirReceptor.Visible = False
        End If
        '--------------------------------------------------------------------------------------------
    End Sub

    Protected Sub btnExcluirReceptor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcluirReceptor.Click
        Page.Session("sIDPessoaAExcluir") = Trim(Page.Session("sCodReceptor"))
        Page.Session("sNomePessoaAExcluir") = Trim(DetailsView1.Rows(0).Cells(1).Text)
        Page.Session("sTipoPessoaAExcluir") = "receptor"
        Page.Session("sCPFCNPJPessoaAExcluir") = Trim(DetailsView1.Rows(1).Cells(1).Text)

        Response.Redirect("~/ConfExclusaoPessoa.aspx")
    End Sub
End Class
