Imports Microsoft.VisualBasic
'------------------------------------------------------------------------------------------
'Classe de Regras de Negócios (BLL)
'Faz o intermédio da Classe de Aceso a Dados (DAL) e a de apresentação e modelo.
'-- Trata a manipulação de relatórios.
'-- Funções que verificam se o relatório existe são tratadas aqui na BLL, pois se trata de uma
'-- regra de negócio, por exemplo.
'------------------------------------------------------------------------------------------
Public Class RelatorioBLL
    Public Function GeraRelatorioComDatas(ByVal pNomeRel As String, ByVal pDataInicial As Date, ByVal pDataFinal As Date) As DataSet1
        Dim obj_Relatorio_DAL As New RelatorioDAL
        Return obj_Relatorio_DAL.GeraRelatorioComDatas(pNomeRel, pDataInicial, pDataFinal)
    End Function
    Public Function GeraRelatorio(ByVal pNomeRel As String) As DataSet1
        Dim obj_Relatorio_DAL As New RelatorioDAL
        Return obj_Relatorio_DAL.GeraRelatorio(pNomeRel)
    End Function
    Public Function RetornaCaminho(ByVal pNomeRel As String) As String
        Dim obj_Configuracao_DAL As New ConfiguracaoDAL
        Dim CaminhoRel As String
        Dim CaminhoNome As String
		'------------------------------------------------------------------------------------------
		'-- Busca na tabela de configuração (por intermédio da DAL - Data Access Layer e retorna 
		'-- o nome do relatório.
		'------------------------------------------------------------------------------------------
        CaminhoRel = Trim(obj_Configuracao_DAL.BuscaConfiguracao("CaminhoRel").pValor_conf)
        CaminhoNome = CaminhoRel & pNomeRel & ".rpt"

        Return CaminhoNome

    End Function
    Public Function RelatorioExiste(ByVal pNomeRel As String) As Boolean
	'------------------------------------------------------------------------------------------
	'-- Função que testa se o relatório existe.
	'------------------------------------------------------------------------------------------
        If Not IO.File.Exists(RetornaCaminho(pNomeRel)) Then
            Return False
        Else
            Return True
        End If
    End Function
    Public Function DataMenosSeteDias() As Date
        Return DateTime.Now.AddDays(-7).ToString()
    End Function
End Class

