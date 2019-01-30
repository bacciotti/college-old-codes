Imports System.Data.SqlClient

Partial Class Voluntarios
    Inherits System.Web.UI.Page

    Protected Sub gridDoadores_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridDoadores.SelectedIndexChanged
        'esse evento vai chamar a pagina de DETALHES DO DOADOR quando o
        'usuario clicar no botao DETALHES, que fica ao lado de cada registro
        'do GRIDVIEW, definindo uma sessao com o Codigo do Doador.
        Page.Session("sCodDoador") = gridDoadores.SelectedRow.Cells(1).Text
        Response.Redirect("~/DetalhesDoador.aspx")
    End Sub

    Protected Sub btnCadastrarDoador_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCadastrarDoador.Click
        Page.Session("sModoEdicaoDoador") = 0
        Response.Redirect("~/CadastroDoador.aspx")
    End Sub

    Protected Sub btnBusca_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBusca.Click

        If txtBusca.Text = "" Then
            '---------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Busca inválida"
            Page.Session("sSubTituloMsg") = "O campo de busca está vazio."
            Response.Redirect("~/MsgErro.aspx")
            '--------------------------------------------------------------------------------------------
        Else
            Dim obj_Pessoa_BLL As New PessoaBLL
            Dim da As SqlDataAdapter = New SqlDataAdapter
            Dim ds As New DataSet1
            If ddlTipoBusca.SelectedIndex = 0 Then '0=por nome, 1=por id
                ds = obj_Pessoa_BLL.BuscaPessoa(1, txtBusca.Text, 1)
            Else
                ds = obj_Pessoa_BLL.BuscaPessoa(1, txtBusca.Text, 0)
            End If
            gridDoadores.DataSource = ds.Tables("Pessoas").DefaultView
            gridDoadores.DataSourceID = ""
            gridDoadores.DataBind()

            If ds.Tables("Pessoas").Rows.Count = 0 Then
                lblResultado.Visible = True
            Else
                lblResultado.Visible = False
            End If
        End If
    End Sub

    Protected Sub ddlTipoBusca_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTipoBusca.SelectedIndexChanged
        If ddlTipoBusca.SelectedIndex = 0 Then
            RangeValidator1.Enabled = False
        Else
            RangeValidator1.Enabled = True
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtBusca.Focus()
        Page.Form.DefaultButton = btnBusca.UniqueID
    End Sub
End Class
