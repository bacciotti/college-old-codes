
Partial Class Doacoes
    Inherits System.Web.UI.Page

    Protected Sub gridDoacoesNaoValidadas_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridDoacoesNaoValidadas.SelectedIndexChanged
        'esse evento vai validar a doação quando o
        'usuario clicar no botao VALIDAR DOAÇÃO, que fica ao lado de cada registro
        Dim obj_Movimentacao_BLL As New MovimentacaoBLL
        If obj_Movimentacao_BLL.ValidaDoacao(gridDoacoesNaoValidadas.SelectedRow.Cells(1).Text) Then
            Response.Redirect("~/Doacoes.aspx")
        Else
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Erro ao validar a doação"
            Page.Session("sSubTituloMsg") = "Ocorreu um erro ao tentar validar a doação. Tente novamente."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If gridDoacoesNaoValidadas.Rows.Count = 0 Then
            lblMsgDoacaoNaoValidada.Visible = True
        End If
    End Sub
End Class
