
Partial Class CorresMassa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		'--------------------------------------------------------------------------------------------
		'-- Correspondência para TODOS os Doadores cadastrados.
		'--------------------------------------------------------------------------------------------
        Dim NomeRel As String = "CorrespMassa"
        Dim oRptDoc As New CrystalDecisions.CrystalReports.Engine.ReportDocument()
        Dim obj_Relatorio_BLL As New RelatorioBLL

        oRptDoc.Load(obj_Relatorio_BLL.RetornaCaminho(NomeRel))

        oRptDoc.SetDataSource(obj_Relatorio_BLL.GeraRelatorio(NomeRel))
        cViewerCorrespM.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None
        cViewerCorrespM.Visible = True
        cViewerCorrespM.ReportSource = oRptDoc

        oRptDoc.SetParameterValue(0, Page.Session("sNomeEstab"))
        oRptDoc.SetParameterValue(1, Page.Session("sEndEstab"))
        oRptDoc.SetParameterValue(2, Page.Session("sCidadeEstab"))

    End Sub
End Class
