
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub MasterPage_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblData.Text = Date.Now.ToString("d") 'Exibe a data atual no lblData que esta na Pagina-Mestre

        '-------------------------------------------------------------------------------------------
		'Testa se o Usuário Logado é Admin ou Normal, e "limpa" 
		'os menus que os usuários comuns não podem acessar.
        'sUserRole = 1: Usuário Comum
        'sUserRole = 2: Administrador
        If Page.Session("sUserRole") = 1 Then
            Menu1.Items(8).Text = "" 'Página de Usuários
            Menu1.Items(9).Text = "" 'Página de Cadastro de Usuários
            Menu1.Items(11).Text = "" 'Página de Configurações
            Menu1.Items(12).Text = "" 'Página de Configurações -> Estabelecimento
        End If
        '-------------------------------------------------------------------------------------------

    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        Dim OpcaoEscolhida As String
        'OpcaoEscolhida = Trim(Menu1.SelectedValue.ToString)
        OpcaoEscolhida = Menu1.SelectedItem.Text
        Page.Session("sModoEdicaoDoador") = 0
        Page.Session("sModoEdicaoReceptor") = 0
        Page.Session("sModoEdicaoUsuario") = 0

        Select Case OpcaoEscolhida
            Case "- Cadastrar doador"
                Response.Redirect("~/CadastroDoador.aspx")
            Case "- Cadastrar receptor"
                Response.Redirect("~/CadastroReceptor.aspx")
            Case "- Cadastrar usuário"
                Response.Redirect("~/CadastroUsuario.aspx")
            Case "Sair"
                Page.Session("sUserRole") = 1
                FormsAuthentication.SignOut()
                Response.Redirect("~/Dashboard.aspx")
        End Select

        'If Menu1.SelectedValue = "Cadastrar doador" Then
        '    Page.Session("sModoEdicaoDoador") = 0
        '    Response.Redirect("~/CadastroDoador.aspx")
        'ElseIf Menu1.SelectedValue = "Cadastrar receptor" Then
        '    Page.Session("sModoEdicaoReceptor") = 0
        '    Response.Redirect("~/CadastroReceptor.aspx")
        'ElseIf Menu1.SelectedValue = "Cadastrar usuário" Then
        '    Page.Session("sModoEdicaoUsuario") = 0
        '    Response.Redirect("~/CadastroUsuario.aspx")
        'ElseIf Menu1.SelectedValue = "Sair" Then
        '    Page.Session("sUserRole") = 1
        '    FormsAuthentication.SignOut()
        '    Response.Redirect("~/Dashboard.aspx")
        'End If
    End Sub

    Protected Sub btnBuscaRapida_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnBuscaRapida.Click
        If txtBuscaRapida.Text = "" Then
            '---------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Busca inválida"
            Page.Session("sSubTituloMsg") = "O campo de busca está vazio."
            Response.Redirect("~/MsgErro.aspx")
            '--------------------------------------------------------------------------------------------
        Else
            Page.Session("sParametroBuscaRapida") = txtBuscaRapida.Text
            Response.Redirect("~/BuscaRapida.aspx")
        End If
    End Sub
End Class

