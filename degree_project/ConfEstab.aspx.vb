
Partial Class ConfEstab
    Inherits System.Web.UI.Page

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        '--------------------------------------------------------------
        'Vetor que vai armazenar as "Respostas" da função de inserir/alterar n banco.
        '1: Inserção/alteração OK, 0: Inserção/alteração com erro
        '--------------------------------------------------------------
        Dim vRespostas(5) As String
        Dim Resposta As Integer = 1
        Dim obj_configuracao_BLL As New ConfiguracaoBLL
        Dim obj_configuracao As New Configuracao

        For i = 0 To 4 'Se UMA resposta for false, já teve um erro.
            vRespostas(i) = 0
        Next i

        obj_configuracao.pNome_conf = "NomeEstab"
        obj_configuracao.pValor_conf = txtNomeEstab.Text
        vRespostas(0) = obj_configuracao_BLL.InsereAlteraConfiguracao(obj_configuracao)

        obj_configuracao.pNome_conf = "EnderEstab"
        obj_configuracao.pValor_conf = txtEndEstab.Text
        vRespostas(1) = obj_configuracao_BLL.InsereAlteraConfiguracao(obj_configuracao)

        obj_configuracao.pNome_conf = "CEPEstab"
        obj_configuracao.pValor_conf = txtCep.Text
        vRespostas(2) = obj_configuracao_BLL.InsereAlteraConfiguracao(obj_configuracao)

        obj_configuracao.pNome_conf = "CidadeEstab"
        obj_configuracao.pValor_conf = txtCidadeEstab.Text
        vRespostas(3) = obj_configuracao_BLL.InsereAlteraConfiguracao(obj_configuracao)

        obj_configuracao.pNome_conf = "EstadoEstab"
        obj_configuracao.pValor_conf = ddlEstado.SelectedItem.Text
        vRespostas(4) = obj_configuracao_BLL.InsereAlteraConfiguracao(obj_configuracao)

        For i = 0 To 4
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
            txtNomeEstab.Focus()
            Dim obj_configuracao_BLL As New ConfiguracaoBLL

            If IsDBNull(Trim(obj_configuracao_BLL.BuscaConfiguracao("NomeEstab").pValor_conf)) Then
                txtNomeEstab.Text = " "
            Else
                txtNomeEstab.Text = Trim(obj_configuracao_BLL.BuscaConfiguracao("NomeEstab").pValor_conf)
            End If

            If IsDBNull(Trim(obj_configuracao_BLL.BuscaConfiguracao("EnderEstab").pValor_conf)) Then
                txtEndEstab.Text = " "
            Else
                txtEndEstab.Text = Trim(obj_configuracao_BLL.BuscaConfiguracao("EnderEstab").pValor_conf)
            End If

            If IsDBNull(Trim(obj_configuracao_BLL.BuscaConfiguracao("CidadeEstab").pValor_conf)) Then
                txtCidadeEstab.Text = " "
            Else
                txtCidadeEstab.Text = Trim(obj_configuracao_BLL.BuscaConfiguracao("CidadeEstab").pValor_conf)
            End If

            If IsDBNull(Trim(obj_configuracao_BLL.BuscaConfiguracao("CEPEstab").pValor_conf)) Then
                txtCep.Text = " "
            Else
                txtCep.Text = Trim(obj_configuracao_BLL.BuscaConfiguracao("CEPEstab").pValor_conf)
            End If

            If IsDBNull(Trim(obj_configuracao_BLL.BuscaConfiguracao("EstadoEstab").pValor_conf)) Then
                ddlEstado.Text = " "
            Else
                ddlEstado.SelectedItem.Text = Trim(obj_configuracao_BLL.BuscaConfiguracao("EstadoEstab").pValor_conf)
            End If

        End If
    End Sub
End Class
