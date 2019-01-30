Imports System.Data.OleDb

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        'Prepara as estruturas necessarias para conectar ao banco 
        Dim StringConexao As String
        Dim Commando As OleDbCommand
        Dim Conexao As OleDbConnection
        Dim sql As String
        Dim tb As OleDbDataReader
        'Variaveis que vao receber os dados para validacao
        Dim NomeUser As String
        Dim PassUser As String

        StringConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\PIH2011\BancoSangue.mdb'"
        'Seleciona todos os registros cujo nome do usuario seja
        'o que foi digitado

        sql = "Select NomeUsuario,Senha from Funcionarios where NomeUsuario = @NomeUsuario"
        Conexao = New OleDbConnection(StringConexao)
        Commando = New OleDbCommand(sql, Conexao)

        'adiciona como parametro o nome digitado para fazer o SELECT
        Commando.Parameters.Add("@NomeUsuario", OleDbType.VarChar).Value = Login1.UserName

        'abre conexao e executa o comando 
        Conexao.Open()
        tb = Commando.ExecuteReader
        tb.Read()
        'se a tabela tiver linhas,ou seja,
        'se tiver algum usuario cadastrado com o nome de usuario
        'que a pessoa digitou, atribui o nome e a senha
        'as respectivas variaveis.
        'senao, da a mensagem de erro.

        If tb.HasRows Then
            NomeUser = tb.Item(0).ToString
            PassUser = tb.Item(1).ToString

            'nesse if e testado se o usuario e a senha estao corretos
            If Login1.UserName = NomeUser And Login1.Password = PassUser Then
                e.Authenticated = True 'Define que o user e senha existem, estao corretos e esta autenticado
            Else
                e.Authenticated = False 'nao esta autenticado
            End If

        Else
            MsgBox("Não existe esse usuário cadastrado")
        End If

        Conexao.Close() 'Fecha conexao

    End Sub
End Class
