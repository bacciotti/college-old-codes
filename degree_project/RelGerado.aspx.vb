
Imports CrystalDecisions.Shared
Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data.SqlClient
Imports System.Data

Partial Class RelGerado
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim NomeRel As String = Page.Session("sNomeRel")
        Dim oRptDoc As New CrystalDecisions.CrystalReports.Engine.ReportDocument()
        Dim obj_Relatorio_BLL As New RelatorioBLL
        Dim TemDatas As Boolean = False
        Dim DataInicial As Date
        Dim DataFim As Date
        If Not Page.Session("sDataInicial") = "" Or Not Page.Session("sDataFim") = "" Then
			TemDatas = True
            DataInicial = CDate(Page.Session("sDataInicial"))
            DataFim = CDate(Page.Session("sDataFim"))
        End If

        oRptDoc.Load(obj_Relatorio_BLL.RetornaCaminho(NomeRel))
        If TemDatas Then
            oRptDoc.SetDataSource(obj_Relatorio_BLL.GeraRelatorioComDatas(NomeRel, DataInicial, DataFim))
            'Define os parâmetros do CrystalReport
			oRptDoc.SetParameterValue(0, Page.Session("sDataInicial"))
            oRptDoc.SetParameterValue(1, Page.Session("sDataFim"))
            Page.Session("sDataInicial") = ""
            Page.Session("sDataFim") = ""
        Else
            oRptDoc.SetDataSource(obj_Relatorio_BLL.GeraRelatorio(NomeRel))
        End If

        rViewer1.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None
        rViewer1.Visible = True
        rViewer1.ReportSource = oRptDoc
    End Sub
End Class
