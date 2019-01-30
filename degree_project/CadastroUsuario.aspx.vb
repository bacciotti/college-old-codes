Partial Class CadastroUsuario
    Inherits System.Web.UI.Page
    Private Sub LimparCampos()
        txtNomeCompleto.Text = ""
        txtDataNascimento.Text = ""
        txtCPF.Text = ""
        txtCep.Text = ""
        txtEndereco.Text = ""
        txtCidade.Text = ""
        txtEmail.Text = ""
        txtCelular.Text = ""
        txtTelefone.Text = ""
        txtObservacao.Text = ""
        txtEmail.Text = ""
        ddlEstado.SelectedIndex = 0
        txtNomeUsuario.Text = ""
        txtSenha.Text = ""
        txtConfirmacaoSenha.Text = ""
    End Sub
    Protected Sub btnLimpar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLimpar.Click
        LimparCampos()
    End Sub

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim Resposta As Integer
        Dim obj_Configuracao_BLL As New ConfiguracaoBLL
        Dim ValidarCPFCNPJ As String = Trim(obj_Configuracao_BLL.BuscaConfiguracao("ValidarCPFCNPJ").pValor_conf)
        Resposta = 0
        '---------------------------------------------------------
        '-- Chama a camada de negócios
        '---------------------------------------------------------
        'Cria e instancia o objeto do Doador da BLL
        Dim obj_usuario_BLL As New PessoaBLL
        'Cria, instancia e atribui valores ao objeto do Usuario
        Dim obj_usuario As New Usuario
        If Page.Session("sModoEdicaoUsuario") = 1 Then
            obj_usuario.pId = Page.Session("sCodUsuario")
        End If
        obj_usuario.pNome = txtNomeCompleto.Text
        '------------------------------------------------------------------------------------------------
        'Teste se o CPF é Válido (ValidaCPF) SE tiver nas Conf. que é para validar.
        If ValidarCPFCNPJ = 1 Then
            If Pessoa.ValidaCPF(txtCPF.Text) Then
                obj_usuario.pCpf = txtCPF.Text
            Else
                '---------------------------------------------------------------------------------------------
                'Título e Subtítulo da página de Erro
                Page.Session("sTituloMsg") = "CPF Inválido"
                Page.Session("sSubTituloMsg") = "O CPF digitado é inválido. Tente novamente."
                Response.Redirect("~/MsgErro.aspx")
                '--------------------------------------------------------------------------------------------
            End If
            '------------------------------------------------------------------------------------------------
        Else
            obj_usuario.pCpf = txtCPF.Text
        End If
        obj_usuario.pEndereco = txtEndereco.Text
        obj_usuario.pCidade = txtCidade.Text
        obj_usuario.pEstado = ddlEstado.SelectedItem.Text
        obj_usuario.pCep = txtCep.Text
        obj_usuario.pTelefone1 = txtCelular.Text
        obj_usuario.pTelefone2 = txtTelefone.Text
        obj_usuario.pEmail = txtEmail.Text
        obj_usuario.pObservacao = txtObservacao.Text
        obj_usuario.pCargo = txtCargo.Text
        obj_usuario.pData_nascimento = txtDataNascimento.Text

        'Testa se tem espaço no nome de usuário
        If Trim(txtNomeUsuario.Text).Contains(" ") Then
            '---------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Nome de usuário inválido"
            Page.Session("sSubTituloMsg") = "O nome de usuário não pode conter espaços."
            Response.Redirect("~/MsgErro.aspx")
            '--------------------------------------------------------------------------------------------
        Else
            obj_usuario.pNome_usuario = txtNomeUsuario.Text
        End If
        '--------------------------------------------------------------------------------------
        'Criptografar a senha e atribuir ao objeto.
        Dim obj_Crypto As New Crypto
        obj_usuario.pSenha = obj_Crypto.Encrypt(txtSenha.Text)
        '--------------------------------------------------------------------------------------
        'tipo_pessoa
        'Doador   = 1
        'Receptor = 2
        'Usuario  = 3
        obj_usuario.pTipo_pessoa = 3

        'tipo_usuario
        '1 = Usuário Normal
        '2= Administrador
        If chkAdmin.Checked = True Then
            obj_usuario.pTipo_usuario_id = 2
        Else
            obj_usuario.pTipo_usuario_id = 1
        End If

        'Testa o retorno: 
        ' 0) O cadastro deu um erro.
        ' 1) O cadastro foi realizado com sucesso.
        ' 2) O usuário já está cadastrado
        'e redireciona para as respectivas páginas.
        If Page.Session("sModoEdicaoUsuario") = 1 Then
            Resposta = obj_usuario_BLL.InsereAlteraUsuario(obj_usuario, pModoInserir:=False)
        Else
            Resposta = obj_usuario_BLL.InsereAlteraUsuario(obj_usuario, pModoInserir:=True)
        End If

        If Resposta = "0" Then
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Algum erro ocorreu"
            Page.Session("sSubTituloMsg") = "Algum erro ocorreu na gravação dos dados. Tente novamente."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        ElseIf Resposta = "1" Then
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Sucesso 
            Page.Session("sTituloMsg") = "Cadastro realizado com sucesso!"
            Page.Session("sSubTituloMsg") = "Os dados foram gravados."
            Response.Redirect("~/MsgSucesso.aspx")
            '-----------------------------------------------------------------------------------------------
        ElseIf Resposta = "2" Then
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Usuário já cadastrado"
            Page.Session("sSubTituloMsg") = "Esse usuário já se encontra cadastrado no sistema."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Botão padrão: Enviar
        Page.Form.DefaultButton = btnEnviar.UniqueID
        validData.MaximumValue = Date.Now.ToString("d")

        '--------------------------------------------------------------------------------------------
        'Testa se o usuário é Administrador (flag 2) ou Usuário Normal (Flag 1).
        If Page.Session("sUserRole") = 2 Then
            chkAdmin.Visible = True
        Else
            '---------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Permissão negada"
            Page.Session("sSubTituloMsg") = "Você não tem premissão para acessar essa página."
            Response.Redirect("~/MsgErro.aspx")
            '--------------------------------------------------------------------------------------------
        End If
        '--------------------------------------------------------------------------------------------

        If Not IsPostBack Then
            txtNomeCompleto.Focus()
            If Page.Session("sModoEdicaoUsuario") = 1 Then
                lblTituloPagina.Text = "Editar usuário"
                Dim obj_Usuario As New Usuario
                obj_Usuario = Page.Session("sObjUsuario")
                txtNomeCompleto.Text = Trim(obj_Usuario.pNome)
                txtObservacao.Text = Trim(obj_Usuario.pObservacao)
                txtCelular.Text = Trim(obj_Usuario.pTelefone1)
                txtCep.Text = Trim(obj_Usuario.pCep)
                txtCidade.Text = Trim(obj_Usuario.pCidade)
                txtCPF.Text = Trim(obj_Usuario.pCpf)
                txtDataNascimento.Text = Trim(obj_Usuario.pData_nascimento)
                txtEmail.Text = Trim(obj_Usuario.pEmail)
                txtEndereco.Text = Trim(obj_Usuario.pEndereco)
                txtTelefone.Text = Trim(obj_Usuario.pTelefone2)
                ddlEstado.SelectedItem.Text = obj_Usuario.pEstado
                txtCargo.Text = obj_Usuario.pCargo
                txtNomeUsuario.Text = obj_Usuario.pNome_usuario
                If obj_Usuario.pTipo_usuario_id = 2 Then
                    chkAdmin.Checked = True
                End If
            Else
                lblTituloPagina.Text = "Cadastrar usuário"
                txtNomeCompleto.Text = ""
                txtObservacao.Text = ""
                txtCelular.Text = ""
                txtCep.Text = ""
                txtCidade.Text = ""
                txtCPF.Text = ""
                txtDataNascimento.Text = ""
                txtEmail.Text = ""
                txtEndereco.Text = ""
                txtTelefone.Text = ""
                ddlEstado.SelectedIndex = 0
                txtCargo.Text = ""
                txtNomeUsuario.Text = ""
                txtSenha.Text = ""
                txtConfirmacaoSenha.Text = ""
            End If
        End If
    End Sub
End Class