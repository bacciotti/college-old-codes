Imports System.Data.OleDb

Partial Class RetiradaDeSangue
    Inherits System.Web.UI.Page

    Protected Sub btnRetirada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRetirada.Click
        If MsgBox("Deseja realmente efetuar a retirada?", vbYesNo) = vbYes Then
            RetiraDoBanco()
        Else
            LimparCampos()
        End If
    End Sub

    Public Sub RetiraDoBanco()
        Dim StringConexao As String
        'Declarando os objetos de Comando e as Strings de Comandos SQL
        Dim Commando As OleDbCommand
        Dim Commando2 As OleDbCommand
        Dim Commando3 As OleDbCommand
        Dim Conexao As OleDbConnection
        Dim sql As String
        Dim sql2 As String
        Dim sql3 As String
        Dim Litrosretirados As Double 'Qtde de litros que o usuário deseja retirar
        Dim tb As OleDbDataReader
        Dim QtdeExistenteBanco As Double 'Vai armazenar a quantidade que existe no banco daquele sangue naquele momento

        Litrosretirados = CDbl(txtLitros.Text)

        StringConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\PIH2011\BancoSangue.mdb'"
        'Insere na tabela retiradas a saida de sangue que acabou de ser efetivada
        sql = "Insert into Retiradas (TipoSangue,Litros,Descricao,Data) values (@TipoSangue,@Litros,@Descricao,Data)"
        'Comando que atualiza o banco de sangue decrementando o tipo de sangue com a quantidade da retirada
        sql2 = "Update Sangues set Quantidade = Quantidade - " & Replace(LitrosRetirados, ",", ".") & " where TipoSangue = (@TipoSangue)"
        sql3 = "Select Quantidade from Sangues where TipoSangue = @TipoSangue"

        'Instancia os objetos
        Conexao = New OleDbConnection(StringConexao)
        Commando = New OleDbCommand(sql, Conexao)
        Commando2 = New OleDbCommand(sql2, Conexao)
        Commando3 = New OleDbCommand(sql3, Conexao)

        'Definindo os parametros para o SQL
        Commando.Parameters.Add("@TipoSangue", OleDbType.VarChar).Value = ddTipoSangue.SelectedItem.ToString
        Commando.Parameters.Add("@Litros", OleDbType.Double).Value = txtLitros.Text
        Commando.Parameters.Add("@Descricao", OleDbType.VarChar).Value = txtDescr.Text
        Commando.Parameters.Add("@Data", OleDbType.Date).Value = CDate(txtData.Text)
        Commando2.Parameters.Add("@TipoSangue", OleDbType.VarChar).Value = ddTipoSangue.SelectedItem.ToString
        Commando3.Parameters.Add("@TipoSangue", OleDbType.VarChar).Value = ddTipoSangue.SelectedItem.ToString

        'Abrindo conexao
        Try
            Conexao.Open()
        Catch ex As Exception
            MsgBox("Algum erro ocorreu:" & ex.ToString & ". Tente novamente.")
        End Try

        'Buscando no banco de dados a quantidade de sangue existente para aquele tipo que
        'deseja efetuar retirada
        tb = Commando3.ExecuteReader
        tb.Read()
        QtdeExistenteBanco = CDbl((tb.Item(0).ToString))

        'testando se a quantidade a ser retirada é menor do que a já existente no banco
        If QtdeExistenteBanco > txtLitros.Text Then
            Commando.ExecuteNonQuery()
            Commando2.ExecuteNonQuery()
            LimparCampos()
            Response.Redirect("~/RetiradaComSucesso.aspx")
        Else
            MsgBox("Não há sangue suficiente para efetuar essa retirada!")
            LimparCampos()
        End If
        Conexao.Close() ' encerra a conexão de qualquer forma
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtData.Text = Date.Now.Date 'Data atual no text box de Data
    End Sub

    Public Sub LimparCampos()
        'limpa os campos do formulario
        txtDescr.Text = ""
        txtLitros.Text = ""
    End Sub
End Class
