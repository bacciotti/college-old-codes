
Partial Class CadastroReceptor
    Inherits System.Web.UI.Page

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
        Dim obj_receptor_BLL As New PessoaBLL
        'Cria, instancia e atribui valores ao objeto do Doador (Model)
        'Create and assign values to the attributes of  a object of Doador class
        Dim obj_receptor As New Receptor
        If Page.Session("sModoEdicaoReceptor") = 1 Then
            obj_receptor.pId = Page.Session("sCodReceptor")
        End If
        obj_receptor.pNome = txtNomeCompleto.Text
        '---------------------------------------------------------
        'Teste se o CPF é Válido (ValidaCPF) SE tiver nas Conf. que é para validar.
        If ValidarCPFCNPJ = 1 Then
            If obj_receptor.ValidaCNPJ(txtCNPJ.Text) Then
                obj_receptor.pCnpj = txtCNPJ.Text
            Else
                '-----------------------------------------------------------------------------------------------
                'Título e Subtítulo da página de Erro
                Page.Session("sTituloMsg") = "CNPJ Inválido"
                Page.Session("sSubTituloMsg") = "O CNPJ digitado é inválido. Tente novamente."
                Response.Redirect("~/MsgErro.aspx")
                '-----------------------------------------------------------------------------------------------
            End If
            '---------------------------------------------------------
        Else
            obj_receptor.pCnpj = txtCNPJ.Text
        End If
        obj_receptor.pEndereco = txtEndereco.Text
        obj_receptor.pCidade = txtCidade.Text
        obj_receptor.pEstado = ddlEstado.SelectedItem.Text
        obj_receptor.pCep = txtCep.Text
        obj_receptor.pTelefone1 = txtCelular.Text
        obj_receptor.pTelefone2 = txtTelefone.Text
        obj_receptor.pEmail = txtEmail.Text
        obj_receptor.pObservacao = txtObservacao.Text
        'tipo_pessoa
        'Doador   = 1
        'Receptor = 2
        'Usuario  = 3
        'Eh receptor entao é two, duo, dos, dois, 2, II, 10
        obj_receptor.pTipo_pessoa = 2

        'Testa o retorno: 
        ' 0) O cadastro deu um erro.
        ' 1) O cadastro foi realizado com sucesso.
        ' 2) O doador já está cadastrado
        'e redireciona para as respectivas páginas.
        If Page.Session("sModoEdicaoReceptor") = 1 Then
            Resposta = obj_receptor_BLL.InsereAlteraReceptor(obj_receptor, pModoInserir:=False)
        Else
            Resposta = obj_receptor_BLL.InsereAlteraReceptor(obj_receptor, pModoInserir:=True)
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
            Page.Session("sTituloMsg") = "Receptor já cadastrado"
            Page.Session("sSubTituloMsg") = "Esse receptor já se encontra cadastrado no sistema."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        End If

    End Sub

    Private Sub LimparCampos()
        txtNomeCompleto.Text = ""
        txtCNPJ.Text = ""
        txtCep.Text = ""
        txtEndereco.Text = ""
        txtCidade.Text = ""
        txtEmail.Text = ""
        txtCelular.Text = ""
        txtTelefone.Text = ""
        txtObservacao.Text = ""
        txtEmail.Text = ""
        txtObservacao.Text = ""
        ddlEstado.SelectedIndex = 0
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Botão padrão: Enviar
        Page.Form.DefaultButton = btnEnviar.UniqueID

        If Not IsPostBack Then
            txtNomeCompleto.Focus()
            If Page.Session("sModoEdicaoReceptor") = 1 Then
                lblTituloPagina.Text = "Editar receptor"
                Dim obj_Receptor As New Receptor
                obj_Receptor = Page.Session("sObjReceptor")
                txtNomeCompleto.Text = Trim(obj_Receptor.pNome)
                txtObservacao.Text = Trim(obj_Receptor.pObservacao)
                txtCelular.Text = Trim(obj_Receptor.pTelefone1)
                txtCep.Text = Trim(obj_Receptor.pCep)
                txtCidade.Text = Trim(obj_Receptor.pCidade)
                txtCNPJ.Text = Trim(obj_Receptor.pCnpj)
                txtEmail.Text = Trim(obj_Receptor.pEmail)
                txtEndereco.Text = Trim(obj_Receptor.pEndereco)
                txtTelefone.Text = Trim(obj_Receptor.pTelefone2)
                ddlEstado.SelectedItem.Text = obj_Receptor.pEstado
            Else
                lblTituloPagina.Text = "Cadastrar receptor"
                txtCelular.Text = ""
                txtNomeCompleto.Text = ""
                txtObservacao.Text = ""
                txtCelular.Text = ""
                txtCep.Text = ""
                txtCidade.Text = ""
                txtCNPJ.Text = ""
                txtEmail.Text = ""
                txtEndereco.Text = ""
                txtTelefone.Text = ""
                ddlEstado.SelectedIndex = 0
            End If
        End If
    End Sub
End Class
