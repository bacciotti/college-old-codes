Imports Microsoft.VisualBasic
Imports System.Data.OleDb
Imports System

Public Class Doacao

#Region "Atributos"
    Public data As Date
    Public TipoSangueDoador As String
    Public CodigoDoador As Integer 'Chave da tabela Voluntarios
    Public QtdeSangue As Double 'Medida em LITROS
#End Region

#Region "Métodos"
    Public Sub GravarDados()
        Dim StringConexao As String
        'Declarando os tres objetos de Comando e as Strings de Comandos SQL
        Dim Commando As OleDbCommand
        Dim Commando2 As OleDbCommand
        Dim Commando3 As OleDbCommand
        Dim Conexao As OleDbConnection
        Dim sql As String
        Dim sql2 As String
        Dim sql3 As String

        StringConexao = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\PIH2011\BancoSangue.mdb'"
        'Insere na tabela doacoes a doacao que acabou de ser efetivada
        sql = "Insert into Doacoes (CodigoDoador,QtdSangue,Data) values (@CodigoDoador,@QtdSangue,@Data)"
        'Atualiza o banco de sangue incrementando o tipo de sangue com a quantidade da doacao
        sql2 = "Update Sangues set Quantidade = Quantidade + " & Replace(QtdeSangue, ",", ".") & " where TipoSangue = (@TipoSangue)"
        'O comando abaixo serve para setar o Voluntario como um doador ativo. 
        'Pois podem haver cadastros de voluntarios que nao sao doadores [ainda]
        sql3 = "Update Voluntarios set Doador = 1 where CodigoDoador = @CodigoDoador"
        Conexao = New OleDbConnection(StringConexao)
        Commando = New OleDbCommand(sql, Conexao)
        Commando2 = New OleDbCommand(sql2, Conexao)
        Commando3 = New OleDbCommand(sql3, Conexao)

        'Definindo os parametros com os atributos da classe
        Commando.Parameters.Add("@CodigoDoador", OleDbType.VarChar).Value = CodigoDoador
        Commando.Parameters.Add("@QtdSangue", OleDbType.Double).Value = QtdeSangue
        Commando.Parameters.Add("@Data", OleDbType.Date).Value = data
        Commando2.Parameters.Add("@TipoSangue", OleDbType.VarChar).Value = TipoSangueDoador
        Commando3.Parameters.Add("@CodigoDoador", OleDbType.VarChar).Value = CodigoDoador

        'Abrindo conexao, executando os comandos e fechando conexao
        'tudo sendo tratado no bloco de excecao
        Try
            Conexao.Open()
            Commando.ExecuteNonQuery()
            Commando2.ExecuteNonQuery()
            Commando3.ExecuteNonQuery()
        Catch ex As Exception
            MsgBox("Algum erro ocorreu:" & ex.ToString & ". Tente novamente.")
        End Try
        Conexao.Close()
    End Sub
#End Region

End Class
