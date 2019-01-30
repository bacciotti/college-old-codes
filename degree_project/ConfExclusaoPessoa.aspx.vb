
Partial Class ConfExclusaoPessoa
    Inherits System.Web.UI.Page

    Protected Sub lblCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Dashboard.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        btnCancelar.Focus()
        lblIdPessoa.Text = Page.Session("sIDPessoaAExcluir")
        lblNomePessoa.Text = Page.Session("sNomePessoaAExcluir")
        lblTipoPessoa.Text = Page.Session("sTipoPessoaAExcluir")
        lblCPFCNPJPessoa.Text = Page.Session("sCPFCNPJPessoaAExcluir")
    End Sub

    Protected Sub btnExcluir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcluir.Click
            Dim obj_Pessoa_BLL As New PessoaBLL
            If obj_Pessoa_BLL.ExcluirPessoa(Page.Session("sIDPessoaAExcluir")) Then
                '-----------------------------------------------------------------------------------------------
                'Título e Subtítulo da página de Sucesso 
                Page.Session("sTituloMsg") = "Exclusão realizada com sucesso!"
                Page.Session("sSubTituloMsg") = "Os dados foram excluídos."
                Response.Redirect("~/MsgSucesso.aspx")
                '-----------------------------------------------------------------------------------------------
            Else
                '-----------------------------------------------------------------------------------------------
                'Título e Subtítulo da página de Erro
                Page.Session("sTituloMsg") = "Algum erro ocorreu"
                Page.Session("sSubTituloMsg") = "Algum erro ocorreu na gravação dos dados. Tente novamente."
                Response.Redirect("~/MsgErro.aspx")
                '-----------------------------------------------------------------------------------------------
            End If
    End Sub
End Class
