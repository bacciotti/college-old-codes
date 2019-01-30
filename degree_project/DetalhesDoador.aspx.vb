
Partial Class DetalhesDoador
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '--------------------------------------------------------------------------------------------
        'Testa se o usuário é Administrador (flag 2) ou Usuário Normal (Flag 1).
        If Page.Session("sUserRole") = 2 Then
            btnExcluirDoador.Visible = True
        Else
            btnExcluirDoador.Visible = False
        End If
        '--------------------------------------------------------------------------------------------
    End Sub

    Protected Sub btnEditarDoador_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEditarDoador.Click
        Dim obj_Pessoa_BLL As New PessoaBLL
        Dim obj_Doador As New Doador
        obj_Doador = obj_Pessoa_BLL.BuscaDadosDoador(Page.Session("sCodDoador"))
        Page.Session("sObjDoador") = obj_Doador
        Page.Session("sModoEdicaoDoador") = 1
        Response.Redirect("~/CadastroDoador.aspx")
    End Sub
    Protected Sub btnNovaDoacao_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovaDoacao.Click
        '-----------------------------------------------------------------------------------------------------
        'Testa a última doação: diferença de dias da última doação para a data do dia atual tem que ser definida 
        'na página de Configurações.
        'se TRUE redireciona para a página da ficha de pré-doacao, se FALSE exibe mensagem de Doação Não Permitida.
        '-----------------------------------------------------------------------------------------------------
        Dim CodigoDoador As Integer = Page.Session("sCodDoador")
        Dim obj_Pessoa_BLL As New PessoaBLL

        If obj_Pessoa_BLL.PodeDoar(CodigoDoador) Then
            Dim obj_Doador As New Doador
            Dim IdadeDoador As Integer
            Dim NomeDoador As String
            Dim TipoSangue As String

            obj_Doador = obj_Pessoa_BLL.BuscaDadosDoador(CodigoDoador)
            IdadeDoador = obj_Pessoa_BLL.RetornaIdade(CodigoDoador)
            NomeDoador = obj_Doador.pNome
            TipoSangue = obj_Pessoa_BLL.RetornaTipoSangue(CodigoDoador)

            Page.Session("sObjDoador") = obj_Doador
            Page.Session("sIdadeDoador") = IdadeDoador
            Page.Session("sNomeDoador") = NomeDoador
            Page.Session("sTipoSangueDoador") = TipoSangue
            Response.Redirect("~/FichaAprovacaoPreDoacao.aspx")
        Else
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Doação não permitida"
            Page.Session("sSubTituloMsg") = "A última doação desse doador foi há muito pouco tempo. Aguarde mais alguns dias para efetuar essa doação."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        End If

    End Sub

    Protected Sub btnGerarCorrespondencia_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGerarCorrespondencia.Click
        'Busca no banco os dados do Doador e carrega as Sessions
        'Para a proxima página exibir.

            Dim obj_Pessoa_BLL As New PessoaBLL
            Dim obj_Doador As New Doador
            Dim obj_Corresp As New Corresp
            Dim obj_Configuracao_BLL As New ConfiguracaoBLL

            obj_Doador = obj_Pessoa_BLL.BuscaDadosDoador(Page.Session("sCodDoador"))
            obj_Corresp.pData = Date.Now.ToString("d")
            obj_Corresp.pPessoa_id = Page.Session("sCodDoador")

            If Trim(obj_Doador.pEndereco) = "" Or Trim(obj_Doador.pCep) = "" Or Trim(obj_Doador.pCidade) = "" Or Trim(obj_Doador.pEstado) = "" Then
                '-----------------------------------------------------------------------------------------------
                'Título e Subtítulo da página de Erro
                Page.Session("sTituloMsg") = "Dados incompletos"
                Page.Session("sSubTituloMsg") = "Os campos Endereço, CEP, Cidade ou Estado desse doador estão incompletos. Complete o cadastro e tente novamente."
                Response.Redirect("~/MsgErro.aspx")
                '-----------------------------------------------------------------------------------------------
            Else

                If obj_Pessoa_BLL.GravaCorrespondencia(obj_Corresp) Then
                    Page.Session("sEndDoador") = obj_Doador.pEndereco
                    Page.Session("sCepDoador") = obj_Doador.pCep
                    Page.Session("sCidadeDoador") = obj_Doador.pCidade
                    Page.Session("sEstadoDoador") = obj_Doador.pEstado
                    Page.Session("sNomeDoador") = obj_Doador.pNome
                    Page.Session("sNomeEstab") = Trim(obj_Configuracao_BLL.BuscaConfiguracao("NomeEstab").pValor_conf)
                    Page.Session("sEndEstab") = Trim(obj_Configuracao_BLL.BuscaConfiguracao("EnderEstab").pValor_conf)
                    Page.Session("sCidadeEstab") = Trim(obj_Configuracao_BLL.BuscaConfiguracao("CidadeEstab").pValor_conf)

                    Response.Redirect("~/CorrespGerada.aspx")
                Else
                    '-----------------------------------------------------------------------------------------------
                    'Título e Subtítulo da página de Erro
                    Page.Session("sTituloMsg") = "Algum erro ocorreu"
                    Page.Session("sSubTituloMsg") = "Algum erro ocorreu na gravação dos dados. Tente novamente."
                    Response.Redirect("~/MsgErro.aspx")
                    '-----------------------------------------------------------------------------------------------
                End If
            End If

    End Sub

    Protected Sub btnExcluirDoador_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcluirDoador.Click
        Page.Session("sIDPessoaAExcluir") = Trim(Page.Session("sCodDoador"))
        Page.Session("sNomePessoaAExcluir") = Trim(DetailsView1.Rows(0).Cells(1).Text)
        Page.Session("sTipoPessoaAExcluir") = "doador"
        Page.Session("sCPFCNPJPessoaAExcluir") = Trim(DetailsView1.Rows(2).Cells(1).Text)

        Response.Redirect("~/ConfExclusaoPessoa.aspx")
    End Sub
End Class
