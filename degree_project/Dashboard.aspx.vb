
Partial Class Dashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
	
	'--------------------------------------------------------------------------------------------
	'-- Página principal, exibe algumas informações sobre o estado atual do sistema.
	'-- Monta e exibe o relatório. 
	'--------------------------------------------------------------------------------------------
        Dim obj_Dashboard_BLL As New DashboardBLL
        Dim obj_Sangue As New Sangue
        Dim NomeRel As String = "RelDashboard"
        Dim oRptDoc As New CrystalDecisions.CrystalReports.Engine.ReportDocument()
        Dim obj_Relatorio_BLL As New RelatorioBLL
        Dim DataInicial As Date
        Dim DataFim As Date


        DataInicial = obj_Relatorio_BLL.DataMenosSeteDias
        DataFim = Date.Now.ToString("d")
        obj_Sangue = obj_Dashboard_BLL.SangueMenorQtde

        lblDoacoesDia.Text = obj_Dashboard_BLL.MovimentacoesDia(1)
        lblRetiradasDia.Text = obj_Dashboard_BLL.MovimentacoesDia(0)
        lblTotDoadores.Text = obj_Dashboard_BLL.TotalPessoas(1)
        lblTotReceptores.Text = obj_Dashboard_BLL.TotalPessoas(0)
        lblSangue.Text = obj_Sangue.pTipo
        lblQtdeSangue.Text = obj_Sangue.pSaldo


		
        oRptDoc.Load(obj_Relatorio_BLL.RetornaCaminho(NomeRel))
        oRptDoc.SetDataSource(obj_Relatorio_BLL.GeraRelatorioComDatas(NomeRel, DataInicial, DataFim))

        viewerDash.ToolPanelView = CrystalDecisions.Web.ToolPanelViewType.None
        viewerDash.HasDrilldownTabs = False
        viewerDash.Visible = True
        viewerDash.ReportSource = oRptDoc
    End Sub
End Class
