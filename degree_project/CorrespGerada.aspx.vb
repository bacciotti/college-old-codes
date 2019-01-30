
Partial Class CorrespGerada
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim oRptDoc As New CrystalDecisions.CrystalReports.Engine.ReportDocument()
        Dim obj_Relatorio_BLL As New RelatorioBLL
        Dim pos As Integer
        Dim PrimeiroNome As String

		'Rotina para pegar só o primeiro nome do doador.
        pos = InStr((Page.Session("sNomeDoador")), " ")
        If Not pos = 0 Then 'se o doador tiver so um nome [bem dificil...], no corpo da carta ira so ele
            PrimeiroNome = Left((Page.Session("sNomeDoador")), pos)
        Else
            PrimeiroNome = Page.Session("sNomeDoador")
        End If

        oRptDoc.Load(obj_Relatorio_BLL.RetornaCaminho("Correspondencia"))

		'--------------------------------------------------------------------------------------------
		'-- Carrega os parâmetros do Relatório Correspondência.
		'--------------------------------------------------------------------------------------------
        oRptDoc.SetParameterValue(0, Page.Session("sNomeDoador"))
        oRptDoc.SetParameterValue(1, Page.Session("sEndDoador"))
        oRptDoc.SetParameterValue(2, Page.Session("sCepDoador"))
        oRptDoc.SetParameterValue(3, Page.Session("sCidadeDoador"))
        oRptDoc.SetParameterValue(7, Page.Session("sEstadoDoador"))

        oRptDoc.SetParameterValue(4, Page.Session("sNomeEstab"))
        oRptDoc.SetParameterValue(5, Page.Session("sEndEstab"))
        oRptDoc.SetParameterValue(6, Page.Session("sCidadeEstab"))
        oRptDoc.SetParameterValue(8, Trim(PrimeiroNome))

        rViewerCorresp.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None
        rViewerCorresp.Visible = True
        rViewerCorresp.ReportSource = oRptDoc

    



    End Sub
End Class
