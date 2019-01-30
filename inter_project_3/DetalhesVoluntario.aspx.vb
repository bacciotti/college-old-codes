
Partial Class DetalhesDoador
    Inherits System.Web.UI.Page
    Protected Sub btnNovaDoacao_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovaDoacao.Click
        'Vai definir algumas SESSOES (Sessions) com os dados referentes ao voluntario
        Page.Session("NomeDoador") = DetailsDoador.Rows(1).Cells(1).Text
        Page.Session("TipoSangueDoador") = DetailsDoador.Rows(12).Cells(1).Text
        'Chama a funcao ULTIMADOACAO que retorna TRUE ou FALSE
        'Se a pessoa doou ha menos de 90 dias ela nao podera doar de novo.
        If UltimaDoacao() Then
            Response.Redirect("~/PreDoacao.aspx")
        Else
            MsgBox("Período muito curto entre doações!")
        End If
    End Sub
    Public Function UltimaDoacao() As Boolean
        Dim DataUltimaDoacao As Date
        Dim DataAtual = (DateTime.Now.Date)
        Dim diferenca As TimeSpan

        'Aqui faz o calculo para saber a diferenca da data da ultima doacao
        'e da data atual.
        'Se for menor que 90 a pessoa nao pode doar, e a funcao retorna FALSE.
        'Pega a data da ultima doacao da GRIDVIEW, que esta ordenada 'by data'.
        If GridHistorico.Rows.Count > 0 Then
            Dim Dif2 As Integer
            DataUltimaDoacao = CDate(GridHistorico.Rows(0).Cells(0).Text)
            diferenca = DataAtual.Subtract(DataUltimaDoacao)
            Dif2 = diferenca.TotalDays
            If Dif2 > 89 Then
                Return True
            Else
                Return False
            End If
        Else
            Return True
        End If
    End Function

    Protected Sub btnCorresp_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCorresp.Click
        'Gera uma correspondencia, para os usuarios do sistema enviarem cartas aos
        'voluntarios.
        'Aqui estao sendo definidas as sessoes de acordo com o grid DETAILSDOADOR
        Page.Session("NomeDestinatario") = DetailsDoador.Rows(1).Cells(1).Text
        Page.Session("EnderecoDestinatario") = DetailsDoador.Rows(5).Cells(1).Text
        Page.Session("CidadeDestinatario") = DetailsDoador.Rows(6).Cells(1).Text
        Page.Session("EstadoDestinatario") = DetailsDoador.Rows(7).Cells(1).Text
        Page.Session("CEPDestinatario") = DetailsDoador.Rows(8).Cells(1).Text
        Response.Redirect("~/Corresp.aspx") 'redireciona para a pagina da correspondencia
    End Sub

    Protected Sub DetailsDoador_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewDeletedEventArgs) Handles DetailsDoador.ItemDeleted
        Response.Redirect("~/DeletadoComSucesso.aspx")
    End Sub
End Class

