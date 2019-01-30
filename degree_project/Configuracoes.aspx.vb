
Partial Class Configuracoes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Botão padrão: Enviar
        Page.Form.DefaultButton = btnEnviar.UniqueID

        '--------------------------------------------------------------------------------------------
        'Testa se o usuário é Administrador (flag 2) ou Usuário Normal (Flag 1).
        If Page.Session("sUserRole") = 1 Then
            '---------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Permissão negada"
            Page.Session("sSubTituloMsg") = "Você não tem premissão para acessar essa página."
            Response.Redirect("~/MsgErro.aspx")
            '--------------------------------------------------------------------------------------------
        End If
        '--------------------------------------------------------------------------------------------
        If Not IsPostBack Then
            ddlValidarCPFCNPJ.Focus()
            Dim obj_configuracao_BLL As New ConfiguracaoBLL
            txtDiasDoacoes.Text = Trim(obj_configuracao_BLL.BuscaConfiguracao("PeriodoMinimoDoacoes").pValor_conf)
            ddlValidarCPFCNPJ.SelectedIndex = Trim(obj_configuracao_BLL.BuscaConfiguracao("ValidarCPFCNPJ").pValor_conf)
            txtCaminhoRel.Text = Trim(obj_configuracao_BLL.BuscaConfiguracao("CaminhoRel").pValor_conf)
        End If
    End Sub
    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        '--------------------------------------------------------------
        'Como são várias alterações de uma vez, previso de um flag de resposta para cada
		'para saber se todoas deram certo.
		'Vetor que vai armazenar as "Respostas" da função de inserir/alterar no banco.
        '1: Inserção/alteração OK, 0: Inserção/alteração com erro
        '--------------------------------------------------------------
        Dim vRespostas(3) As String
        Dim Resposta As Integer = 1
        Dim obj_configuracao_BLL As New ConfiguracaoBLL
        Dim obj_configuracao As New Configuracao

        For i = 0 To 2
            vRespostas(i) = 0
        Next i

        obj_configuracao.pNome_conf = "ValidarCPFCNPJ"
        obj_configuracao.pValor_conf = ddlValidarCPFCNPJ.SelectedIndex
        vRespostas(0) = obj_configuracao_BLL.InsereAlteraConfiguracao(obj_configuracao)

        obj_configuracao.pNome_conf = "PeriodoMinimoDoacoes"
        obj_configuracao.pValor_conf = txtDiasDoacoes.Text
        vRespostas(1) = obj_configuracao_BLL.InsereAlteraConfiguracao(obj_configuracao)

        obj_configuracao.pNome_conf = "CaminhoRel"
        obj_configuracao.pValor_conf = txtCaminhoRel.Text
        vRespostas(2) = obj_configuracao_BLL.InsereAlteraConfiguracao(obj_configuracao)

        For i = 0 To 2 'Se UMA resposta for false, já teve algum erro.
            If vRespostas(i) = False Then
                Resposta = 0
            End If
        Next i

        If Resposta = "0" Then
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Algum erro ocorreu"
            Page.Session("sSubTituloMsg") = "Algum erro ocorreu na gravação dos dados. Tente novamente."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        Else : Resposta = "1"
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Sucesso 
            Page.Session("sTituloMsg") = "Cadastro realizado com sucesso!"
            Page.Session("sSubTituloMsg") = "Os dados foram gravados."
            Response.Redirect("~/MsgSucesso.aspx")
            '-----------------------------------------------------------------------------------------------
        End If
    End Sub
End Class
