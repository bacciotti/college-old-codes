Imports System.Data.SqlClient

Partial Class Usuarios
    Inherits System.Web.UI.Page

    Protected Sub gridUsuarios_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridUsuarios.SelectedIndexChanged
        '--------------------------------------------------------------------------------------------
		'esse evento vai chamar a pagina de DETALHES DO USUARIO quando o
        'usuario clicar no botao DETALHES, que fica ao lado de cada registro
        'do GRIDVIEW, definindo uma sessao com o Codigo do Usuario.
		'--------------------------------------------------------------------------------------------
        Page.Session("sCodUsuario") = gridUsuarios.SelectedRow.Cells(1).Text
        Response.Redirect("~/DetalhesUsuario.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtBusca.Focus()
        Page.Form.DefaultButton = btnBusca.UniqueID
        '--------------------------------------------------------------------------------------------
        'Testa se o usuário é Administrador (flag 2) ou Usuário Normal (Flag 1).
		'--------------------------------------------------------------------------------------------
        If Page.Session("sUserRole") = 1 Then
            '---------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Permissão negada"
            Page.Session("sSubTituloMsg") = "Você não tem premissão para acessar essa página."
            Response.Redirect("~/MsgErro.aspx")
            '--------------------------------------------------------------------------------------------
        End If
        '--------------------------------------------------------------------------------------------
    End Sub

    Protected Sub btnCadastrarUsuario_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCadastrarUsuario.Click
        Page.Session("sModoEdicaoUsuario") = 0
        Response.Redirect("~/CadastroUsuario.aspx")
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
            If ddlTipoBusca.SelectedIndex = 0 Then '0 = por nome, 1 = por id
                ds = obj_Pessoa_BLL.BuscaPessoa(3, txtBusca.Text, 1)
            Else
                ds = obj_Pessoa_BLL.BuscaPessoa(3, txtBusca.Text, 0)
            End If
            gridUsuarios.DataSource = ds.Tables("Pessoas").DefaultView
            gridUsuarios.DataSourceID = ""
            gridUsuarios.DataBind()

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
End Class
