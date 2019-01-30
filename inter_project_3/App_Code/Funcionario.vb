Imports Microsoft.VisualBasic
Imports System.Data.OleDb
Imports System

Public Class Funcionario
#Region "Atributos"
    Public Nome As String
    Public Datanasc As Date
    Public CPF As String
    Public RG As String
    Public Endereco As String
    Public CEP As String
    Public Celular As String
    Public Email As String
    Public telefone As String
    Public cargo As String
    Public NomeUsuario As String
    Public Senha As String
#End Region

#Region "Métodos"
    Public Sub GravarDados()
        'Criando e definindo as principais estruturas para conectar ao banco
        Dim StringConexao As String
        StringConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\PIH2011\BancoSangue.mdb'"
        Dim Conexao As OleDbConnection
        Conexao = New OleDbConnection(StringConexao)
        Dim sql As String
        'O comando abaixo vai inserir um novo Funcionario no banco de dados
        sql = "Insert into Funcionarios (Nome,DataNasc,CPF,RG,Endereco,CEP,Email,Celular,Telefone,Cargo,NomeUsuario,Senha) values (@Nome,@DataNasc,@CPF,@RG,@Endereco,@CEP,@Email,@Celular,@Telefone,@Cargo,@NomeUsuario,@Senha)"
        Dim Commando As OleDbCommand
        Commando = New OleDbCommand(sql, Conexao)

        'Definindo os parametros com os atributos
        Commando.Parameters.Add("@Nome", OleDbType.VarChar).Value = Nome
        Commando.Parameters.Add("@DataNasc", OleDbType.Date).Value = Datanasc
        Commando.Parameters.Add("@CPF", OleDbType.VarChar).Value = CPF
        Commando.Parameters.Add("@RG", OleDbType.VarChar).Value = RG
        Commando.Parameters.Add("@Endereco", OleDbType.VarChar).Value = Endereco
        Commando.Parameters.Add("@CEP", OleDbType.VarChar).Value = CEP
        Commando.Parameters.Add("@Email", OleDbType.VarChar).Value = Email
        Commando.Parameters.Add("@Celular", OleDbType.VarChar).Value = Celular
        Commando.Parameters.Add("@Telefone", OleDbType.VarChar).Value = telefone
        Commando.Parameters.Add("@Cargo", OleDbType.VarChar).Value = cargo
        Commando.Parameters.Add("@NomeUsuario", OleDbType.VarChar).Value = NomeUsuario
        Commando.Parameters.Add("@Senha", OleDbType.VarChar).Value = Senha

        'Abre a conexao, executa o comando e fecha a conexao
        'no bloco de excecao
        Try
            Conexao.Open()
            Commando.ExecuteNonQuery()
        Catch ex As Exception
            MsgBox("Algum erro ocorreu:" & ex.ToString & ". Tente novamente.")
        End Try
        Conexao.Close()



    End Sub
#End Region
End Class
