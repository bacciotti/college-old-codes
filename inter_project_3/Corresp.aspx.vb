Imports System.Data.OleDb

Partial Class Corresp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Explicar ao usuário como imprimir a página que sera aberta
        MsgBox("Para imprimir essa página, vá no menu Arquivo -> Imprimir do seu navegador. Ou tecle CTRL + P.")

        Dim pos As Integer
        'Definindo os dados do DESTINATARIO de uma possivel correspondencia a ser enviada
        lblNome.Text = Page.Session("NomeDestinatario")
        lblEndereco.Text = Page.Session("EnderecoDestinatario")
        lblCidade.Text = Page.Session("CidadeDestinatario")
        lblEstado.Text = Page.Session("EstadoDestinatario")
        lblCEP.Text = Page.Session("CEPDestinatario")
        'Por questoes de estetica, no corpo do texto so aparecera o primeiro nome. Isso esta
        'implementado abaixo
        pos = InStr((Page.Session("NomeDestinatario")), " ")
        If Not pos = 0 Then 'se o voluntario tiver so um nome [bem dificil...], no corpo da carta ira so ele
            lblNomeCorresp.Text = Left((Page.Session("NomeDestinatario")), pos)
        Else
            lblNomeCorresp.Text = Page.Session("NomeDestinatario")
        End If
        PegaDadosEstabelecimento() 'chama o metodo que busca os dados do estabelecimento cadastrado
    End Sub
    Public Sub PegaDadosEstabelecimento()
        'conecta no banco
        Dim StringConexao As String
        Dim Commando As OleDbCommand
        Dim Conexao As OleDbConnection
        Dim sql As String
        Dim tb As OleDbDataReader

        StringConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\PIH2011\BancoSangue.mdb'"
        'Pega os dados do estabelecimento
        sql = "Select * from Estabelecimento"
        Conexao = New OleDbConnection(StringConexao)
        Commando = New OleDbCommand(sql, Conexao)

        'Abre a conexao e executa o comando
        'tudo sendo tratado no bloco de excecao
        Try
            Conexao.Open()
            tb = Commando.ExecuteReader 'O reader serve para ler os resultados de um SELECT 
            tb.Read() 'Efetivamente lê o resultado
        Catch ex As Exception
            MsgBox("Algum erro ocorreu:" & ex.ToString & ". Tente novamente.")
        End Try
        'Atribui os dados do estabelecimento aos LABELS dispostos na correspondencia
        lblNomeEst.Text = tb.Item(0).ToString
        lblEndEst.Text = tb.Item(1).ToString
        lblCidEst.Text = tb.Item(2).ToString
        lblUFEst.Text = tb.Item(3).ToString
        lblCEPEst.Text = tb.Item(8).ToString
        Conexao.Close() ' Encerra a conexao
    End Sub

End Class
