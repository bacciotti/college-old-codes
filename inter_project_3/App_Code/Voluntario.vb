Imports Microsoft.VisualBasic
Imports System.Data.OleDb
Imports System

Public Class Voluntario
#Region "Atributos"
    Public NomeCompleto As String
    Public DataNasc As Date
    Public CPF As String
    Public RG As String
    Public Endereco As String
    Public Cidade As String
    Public Estado As String
    Public CEP As String
    Public Email As String
    Public Celular As String
    Public telefone As String
    Public TipoSangue As String
    Public Patologias As String
    Public Obs As String
    Public Exames As String
#End Region

#Region "Métodos"
    Public Sub GravarDados()
        'Criando as estruturas necessarias para conexao
        Dim StringConexao As String
        StringConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\PIH2011\BancoSangue.mdb'"
        Dim Conexao As OleDbConnection
        Conexao = New OleDbConnection(StringConexao)
        Dim sql As String
        'Comando que insere um novo Voluntario com os dados obtidos
        sql = "Insert into Voluntarios (Nome,DataNasc,CPF,RG,Endereco,Cidade,Estado,CEP,Email,Celular,Telefone,TipoSangue,Patologias,Exames,Obs) values (@Nome,@DataNasc,@CPF,@RG,@Endereco,@Cidade,@Estado,@CEP,@Email,@Celular,@Telefone,@TipoSangue,@Patologias,@Exames,@Obs)"
        Dim Commando As OleDbCommand
        Commando = New OleDbCommand(sql, Conexao)
        'Atribuindo os parametros com os atributos
        Commando.Parameters.Add("@Nome", OleDbType.VarChar).Value = NomeCompleto
        Commando.Parameters.Add("@DataNasc", OleDbType.Date).Value = DataNasc
        Commando.Parameters.Add("@CPF", OleDbType.VarChar).Value = CPF
        Commando.Parameters.Add("@RG", OleDbType.VarChar).Value = RG
        Commando.Parameters.Add("@Endereco", OleDbType.VarChar).Value = Endereco
        Commando.Parameters.Add("@Cidade", OleDbType.VarChar).Value = Cidade
        Commando.Parameters.Add("@Estado", OleDbType.VarChar).Value = Estado
        Commando.Parameters.Add("@CEP", OleDbType.VarChar).Value = CEP
        Commando.Parameters.Add("@Email", OleDbType.VarChar).Value = Email
        Commando.Parameters.Add("@Celular", OleDbType.VarChar).Value = Celular
        Commando.Parameters.Add("@Telefone", OleDbType.VarChar).Value = telefone
        Commando.Parameters.Add("@TipoSangue", OleDbType.VarChar).Value = TipoSangue
        Commando.Parameters.Add("@Patologias", OleDbType.VarChar).Value = Patologias
        Commando.Parameters.Add("@Exames", OleDbType.VarChar).Value = Exames
        Commando.Parameters.Add("@Obs", OleDbType.VarChar).Value = Obs
        'Abrindo a conexao, executando o comando e fechando a conexao
        'tudo sendo tratado no bloco de excecao
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

