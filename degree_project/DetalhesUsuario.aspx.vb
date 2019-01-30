
Partial Class DetalhesDoador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '--------------------------------------------------------------------------------------------
        'Testa se o usuário é Administrador (flag 2) ou Usuário Normal (Flag 1).
        If Page.Session("sUserRole") = 2 Then
            btnExcluirUsuario.Visible = True
        Else
            '---------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Permissão negada"
            Page.Session("sSubTituloMsg") = "Você não tem premissão para acessar essa página."
            Response.Redirect("~/MsgErro.aspx")
            '--------------------------------------------------------------------------------------------
        End If
        '--------------------------------------------------------------------------------------------

    End Sub

    Protected Sub btnEditarUsuario_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditarUsuario.Click
        Dim obj_Pessoa_BLL As New PessoaBLL
        Dim obj_Usuario As New Usuario

        obj_Usuario = obj_Pessoa_BLL.BuscaDadosUsuario(Page.Session("sCodUsuario"))

        Page.Session("sObjUsuario") = obj_Usuario
        Page.Session("sModoEdicaoUsuario") = 1
        Page.Session("sNomeUsuario") = obj_Usuario.pNome_usuario

        Response.Redirect("~/CadastroUsuario.aspx")
    End Sub

    Protected Sub btnExcluirUsuario_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcluirUsuario.Click
        Page.Session("sIDPessoaAExcluir") = Trim(Page.Session("sCodUsuario"))
        Page.Session("sNomePessoaAExcluir") = Trim(DetailsView1.Rows(0).Cells(1).Text)
        Page.Session("sTipoPessoaAExcluir") = "usuário"
        Page.Session("sCPFCNPJPessoaAExcluir") = Trim(DetailsView1.Rows(1).Cells(1).Text)

        Response.Redirect("~/ConfExclusaoPessoa.aspx")
    End Sub
End Class
