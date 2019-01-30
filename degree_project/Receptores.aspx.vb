Imports System.Data.SqlClient

Partial Class Voluntarios
    Inherits System.Web.UI.Page

    Protected Sub gridReceptores_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridReceptores.SelectedIndexChanged
        '----------------------------------------------------------------------------------------
        'Esse evento vai chamar a pagina DetalhesReceptor quando o usuario clicar no link "Detalhes", 
        'que fica ao lado de cada registro do GridView, definindo uma Session com o Codigo do Receptor.
        '----------------------------------------------------------------------------------------
        Page.Session("sCodReceptor") = gridReceptores.SelectedRow.Cells(1).Text
        Response.Redirect("~/DetalhesReceptor.aspx")
    End Sub

    Protected Sub btnCadastrarReceptor_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCadastrarReceptor.Click
        Page.Session("sModoEdicaoReceptor") = 0
        Response.Redirect("~/CadastroReceptor.aspx")
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
			'Busca os dados da busca e carrega o grid
            If ddlTipoBusca.SelectedIndex = 0 Then '0=por nome, 1=por id
                ds = obj_Pessoa_BLL.BuscaPessoa(2, txtBusca.Text, 1)
            Else
                ds = obj_Pessoa_BLL.BuscaPessoa(2, txtBusca.Text, 0)
            End If
            gridReceptores.DataSource = ds.Tables("Pessoas").DefaultView
            gridReceptores.DataSourceID = ""
            gridReceptores.DataBind()

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
