Imports System.Data.OleDb
Imports System.Data.SqlClient

Partial Class CadUsu
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.Session("Flag") = 1 Then
            lblTitulo.Text = "Cadastrar novo usuário"
        Else
            lblTitulo.Text = "Editar usuário"
            txtUsuario.Text = Page.Session("NomeUser")
        End If
    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Default.aspx")
    End Sub

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim StringConexao As String
        StringConexao = "Data Source=lucasbaciotti\sqlexpress;Initial Catalog=estudando;User ID=sa;Password=123456"
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        Dim sql As String
        Dim Commando As SqlCommand

        If Page.Session("Flag") = 1 Then
            sql = "Insert into Usuarios (usuario,senha,papel) values (@U,@S,@P)"
            Commando = New SqlCommand(sql, Conexao)
            Commando.Parameters.Add(New SqlParameter("@U", txtUsuario.Text))
            Commando.Parameters.Add(New SqlParameter("@S", txtSenha.Text))
            Commando.Parameters.Add(New SqlParameter("@P", ddlPapel.SelectedItem.Text))
            Conexao.Open()
            Commando.ExecuteNonQuery()
        Else
            sql = "Update Usuarios set usuario = @U, senha = @S, papel = @P where id = @CodUser"
            Commando = New SqlCommand(sql, Conexao)
            Commando.Parameters.Add(New SqlParameter("@U", txtUsuario.Text))
            Commando.Parameters.Add(New SqlParameter("@S", txtSenha.Text))
            Commando.Parameters.Add(New SqlParameter("@P", ddlPapel.SelectedItem.Text))
            Commando.Parameters.Add(New SqlParameter("@CodUser", Page.Session("CodUser")))
            Conexao.Open()
            Commando.ExecuteNonQuery()
        End If
        Response.Redirect("~/CadSuc.aspx")
        Conexao.Close()
    End Sub

End Class
