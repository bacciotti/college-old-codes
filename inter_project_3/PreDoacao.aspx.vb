Imports System.Data.OleDb


Partial Class PreDoacao
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Mostra no inicio da pagina o nome e o tipo de sangue do voluntario
        lblNome.Text = Page.Session("NomeDoador")
        lblTipoSangue.Text = Page.Session("TipoSangueDoador")
    End Sub

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        'Aqui se define se o volutnario esta liberado ou nao para fazer doacoes
        'No questionario tem perguntas booleanas que, caso uma delas seja nao
        'o voluntario nao pode doar [naquele momento, pois nada impede de ele tentar doar posteriormente]

        'O voluntario tem que pesar mais que 50 quilos e ter
        'entre 16 e 68 anos de idade,
        'fora as outras questoes booleanas
        If txtPeso.Text >= 50 And
            txtIdade.Text >= 16 And txtIdade.Text <= 68 And
            ddAborto.SelectedIndex = 0 And
            ddGravidez.SelectedIndex = 0 And
            ddAmamen.SelectedIndex = 0 And
            ddAlimentacao.SelectedIndex = 0 And
            ddTatu.SelectedIndex = 0 And
            ddTransf.SelectedIndex = 0 And
            ddAlco.SelectedIndex = 0 And
            ddDrogas.SelectedIndex = 0 And
            ddDoencas.SelectedIndex = 0 And
            ddGripe.SelectedIndex = 0 And
            ddFerimento.SelectedIndex = 0 Then
            Response.Redirect("~/CadastroDoacao.aspx") 'se tudo estiver ok, redireciona para a pagina de doacao
        Else
            Response.Redirect("~/DoacaoRecusada.aspx") 'pagina que recusa a doacao 
        End If
    End Sub
End Class
