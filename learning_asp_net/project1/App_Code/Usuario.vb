Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class Usuario
#Region "Atributos"
    Public id As Integer
    Public usuario As String
    Public senha As String
    Public papel As String
#End Region

#Region "Métodos"

    Public Shared Function ValidarUsuario(ByVal paramUsuario As String) As Usuario
        Dim objUsr As Usuario = Nothing
        Dim strConexao As String
        strConexao = "Data Source=lucasbaciotti\sqlexpress;Initial Catalog=estudando;User ID=sa;Password=123456"
        Dim conexao As SqlConnection
        conexao = New SqlConnection(strConexao)
        Dim comando As SqlCommand
        comando = New SqlCommand("ChecarUsuario", conexao)
        comando.CommandType = Data.CommandType.StoredProcedure
        comando.Parameters.Add("Usuario", Data.SqlDbType.VarChar).Value = paramUsuario
        conexao.Open()
        Dim dataReader As SqlDataReader
        dataReader = comando.ExecuteReader()
        If dataReader.HasRows Then
            dataReader.Read()
            objUsr = New Usuario
            If Not IsDBNull(dataReader("Id")) Then
                objUsr.id = CInt(dataReader("Id"))
            End If
            objUsr.usuario = paramUsuario
            If Not IsDBNull(dataReader("Senha")) Then
                objUsr.senha = dataReader("Senha")
            End If
            If Not IsDBNull(dataReader("Papel")) Then
                objUsr.papel = dataReader("Papel")
            End If
        End If
        Return objUsr
    End Function

#End Region

End Class
