
Partial Class Relatorios
    Inherits System.Web.UI.Page

    Protected Sub btnGerarRelatorio_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGerarRelatorio.Click
        Dim OpcaoDDL As Integer = ddlRelatorio.SelectedIndex
        Dim NomeRel As String
        Dim obj_Relatorio_BLL As New RelatorioBLL

        If OpcaoDDL = 1 Or OpcaoDDL = 2 Or OpcaoDDL = 3 Then
            If txtDataFim.Text = "" Or txtDataInicio.Text = "" Then
                '---------------------------------------------------------------------------------------------
                'Título e Subtítulo da página de Erro
                Page.Session("sTituloMsg") = "Datas inválidas"
                Page.Session("sSubTituloMsg") = "As datas inseridas estão inválidas."
                Response.Redirect("~/MsgErro.aspx")
                '--------------------------------------------------------------------------------------------
            Else
                Select Case OpcaoDDL
                    Case 1 'Movimentacoes por periodo
                        NomeRel = "RelMovPeriodo"
                    Case 2 'Doacoes por periodo
                        NomeRel = "RelDoaPeriodo"
                    Case 3 'Retiradas por periodo
                        NomeRel = "RelRetPeriodo"
                    Case Else
                        NomeRel = "NULL"
                End Select
                'Sessions com as datas Inicial e Final
                Page.Session("sDataInicial") = txtDataInicio.Text
                Page.Session("sDataFim") = txtDataFim.Text
                Page.Session("sNomeRel") = NomeRel
                If obj_Relatorio_BLL.RelatorioExiste(NomeRel) Then
                    Response.Redirect("RelGerado.aspx")
                Else
                    '-----------------------------------------------------------------------------------------------
                    'Título e Subtítulo da página de Erro
                    Page.Session("sTituloMsg") = "Relatório não localizado"
                    Page.Session("sSubTituloMsg") = "O arquivo de relatório não foi localizado."
                    Response.Redirect("~/MsgErro.aspx")
                    '-----------------------------------------------------------------------------------------------
                End If

            End If
        Else
            txtDataFim.Text = ""
            txtDataInicio.Text = ""

            Select Case OpcaoDDL
                Case 4
                    NomeRel = "RelQtdeBolsas"
                Case 5
                    NomeRel = "RelDoadoresCad"
                Case Else
                    NomeRel = "RelReceptoresCad"
            End Select

            Page.Session("sNomeRel") = NomeRel
            If obj_Relatorio_BLL.RelatorioExiste(NomeRel) Then
                Response.Redirect("RelGerado.aspx")
            Else
                '-----------------------------------------------------------------------------------------------
                'Título e Subtítulo da página de Erro
                Page.Session("sTituloMsg") = "Relatório não localizado"
                Page.Session("sSubTituloMsg") = "O arquivo de relatório não foi localizado."
                Response.Redirect("~/MsgErro.aspx")
                '-----------------------------------------------------------------------------------------------
            End If
        End If

    End Sub

    Protected Sub ddlRelatorio_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlRelatorio.SelectedIndexChanged
        'NOTA IMPORTANTE
        'Para funcionar esse case abaixo, tive que habilitar a propriedade
        'AUTOPOSTBACK da DropDownList 
        Select Case ddlRelatorio.SelectedIndex
            Case 0, 4, 5, 6
                txtDataFim.Enabled = False
                txtDataInicio.Enabled = False
            Case 1, 2, 3
                Dim mes As New DateTime
                Dim primeiroDia As New DateTime

                mes = Date.Now
                primeiroDia = Convert.ToDateTime("01/" + mes.ToString("MM/yyyy"))

                txtDataFim.Enabled = True
                txtDataInicio.Enabled = True
                txtDataFim.Text = Date.Now.ToString("d")
                txtDataInicio.Text = primeiroDia
                txtDataInicio.Focus()
        End Select
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ddlRelatorio.Focus()

        'Botão padrão: Enviar
        Page.Form.DefaultButton = btnGerarRelatorio.UniqueID
    End Sub
End Class

