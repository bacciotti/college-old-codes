
Partial Class ConfCorrespMassa
    Inherits System.Web.UI.Page

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Dashboard.aspx")
    End Sub

    Protected Sub btnContinuar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinuar.Click
            Dim obj_Configuracao_BLL As New ConfiguracaoBLL
            Dim obj_Doador As New Doador
            Dim obj_Corresp As New Corresp
            Dim obj_Pessoa_BLL As New PessoaBLL
            obj_Corresp.pData = Date.Now.ToString("d")

            obj_Corresp.pPessoa_id = 1 'É UM por que no banco, na tabela PESSOAS, criei um registro como nome de MASSA com id = 1, para
            'representar quando o envio é "em massa"

            If obj_Pessoa_BLL.GravaCorrespondencia(obj_Corresp) Then
                Page.Session("sNomeEstab") = Trim(obj_Configuracao_BLL.BuscaConfiguracao("NomeEstab").pValor_conf)
                Page.Session("sEndEstab") = Trim(obj_Configuracao_BLL.BuscaConfiguracao("EnderEstab").pValor_conf)
                Page.Session("sCidadeEstab") = Trim(obj_Configuracao_BLL.BuscaConfiguracao("CidadeEstab").pValor_conf)

                Response.Redirect("CorresMassa.aspx")
            Else
                '-----------------------------------------------------------------------------------------------
                'Título e Subtítulo da página de Erro
                Page.Session("sTituloMsg") = "Algum erro ocorreu"
                Page.Session("sSubTituloMsg") = "Algum erro ocorreu na gravação dos dados. Tente novamente."
                Response.Redirect("~/MsgErro.aspx")
                '-----------------------------------------------------------------------------------------------
            End If
    End Sub
End Class
