
Partial Class CadastroVoluntario
    Inherits System.Web.UI.Page

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim Resposta As Integer
        Dim obj_Configuracao_BLL As New ConfiguracaoBLL
        Dim ValidarCPFCNPJ As String = Trim(obj_Configuracao_BLL.BuscaConfiguracao("ValidarCPFCNPJ").pValor_conf)
        Resposta = 0
        '---------------------------------------------------------
        '-- Chama a camada de negócios
        '---------------------------------------------------------
        'Cria e instancia o objeto do Doador da BLL
        Dim obj_doador_BLL As New PessoaBLL
        'Cria, instancia e atribui valores ao objeto do Doador
        Dim obj_doador As New Doador
        If Page.Session("sModoEdicaoDoador") = 1 Then
            obj_doador.pId = Page.Session("sCodDoador")
        End If
        obj_doador.pNome = txtNomeCompleto.Text
        '------------------------------------------------------------------------------------------------
        'Teste se o CPF é Válido (ValidaCPF) SE tiver nas Conf. que é para validar.
        If ValidarCPFCNPJ = 1 Then
            If Pessoa.ValidaCPF(txtCPF.Text) Then
                obj_doador.pCpf = txtCPF.Text
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
            obj_doador.pCpf = txtCPF.Text
        End If
        obj_doador.pData_nascimento = Convert.ToDateTime(txtDataNascimento.Text)
        obj_doador.pEndereco = txtEndereco.Text
        obj_doador.pCidade = txtCidade.Text
        obj_doador.pEstado = ddlEstado.SelectedItem.Text
        obj_doador.pCep = txtCep.Text
        obj_doador.pTelefone1 = txtCelular.Text
        obj_doador.pTelefone2 = txtTelefone.Text
        obj_doador.pEmail = txtEmail.Text
        obj_doador.pObservacao = txtObservacao.Text
        'sangue_id
        'A+  = 1
        'A-  = 2
        'B+  = 3 
        'B-  = 4
        'O+  = 5 
        'O-  = 6
        'AB+ = 7
        'AB- = 8
        'I've configured the dropdownlist so that dont need to do a case structure
        'the blood ID and the blood index are the same
        'So is just assign each other.
        obj_doador.pSangue_id = ddlTipoSanguineo.SelectedIndex
        'tipo_pessoa
        'Doador   = 1
        'Receptor = 2
        'Usuario  = 3
        'We are registering a donor, so the tipo_pessoa 
        'attribute is 1, as the list of bloods above.
        obj_doador.pTipo_pessoa = 1

        'Testa o retorno: 
        ' 0) O cadastro deu um erro.
        ' 1) O cadastro foi realizado com sucesso.
        ' 2) O doador já está cadastrado
        'e redireciona para as respectivas páginas.
        If Page.Session("sModoEdicaoDoador") = 1 Then
            Resposta = obj_doador_BLL.InsereAlteraDoador(obj_doador, pModoInserir:=False)
        Else
            Resposta = obj_doador_BLL.InsereAlteraDoador(obj_doador, pModoInserir:=True)
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
            Page.Session("sTituloMsg") = "Doador já cadastrado"
            Page.Session("sSubTituloMsg") = "Esse doador já se encontra cadastrado no sistema."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        End If

    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLimpar.Click
        LimparCampos()
    End Sub

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
        ddlTipoSanguineo.SelectedIndex = 0
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Botão padrão: Enviar
        Page.Form.DefaultButton = btnEnviar.UniqueID
        validData.MaximumValue = Date.Now.ToString("d")

        If Not IsPostBack Then
            txtNomeCompleto.Focus()
            If Page.Session("sModoEdicaoDoador") = 1 Then
                lblTituloPagina.Text = "Editar doador"
                Dim obj_Doador As New Doador
                obj_Doador = Page.Session("sObjDoador")
                txtNomeCompleto.Text = Trim(obj_Doador.pNome)
                txtObservacao.Text = Trim(obj_Doador.pObservacao)
                txtCelular.Text = Trim(obj_Doador.pTelefone1)
                txtCep.Text = Trim(obj_Doador.pCep)
                txtCidade.Text = Trim(obj_Doador.pCidade)
                txtCPF.Text = Trim(obj_Doador.pCpf)
                txtDataNascimento.Text = Trim(obj_Doador.pData_nascimento)
                txtEmail.Text = Trim(obj_Doador.pEmail)
                txtEndereco.Text = Trim(obj_Doador.pEndereco)
                txtTelefone.Text = Trim(obj_Doador.pTelefone2)
                ddlEstado.SelectedItem.Text = obj_Doador.pEstado
                ddlTipoSanguineo.SelectedIndex = obj_Doador.pSangue_id
            Else
                lblTituloPagina.Text = "Cadastrar doador"
                txtCelular.Text = ""
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
                ddlTipoSanguineo.SelectedIndex = 0
            End If
        End If
    End Sub
End Class
