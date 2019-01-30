Imports Microsoft.VisualBasic
Imports System.Security.Cryptography

'------------------------------------------------------------------------------------------
'Classe de Criptografia: salva a senha criptografada no banco 
'------------------------------------------------------------------------------------------
Public Class Crypto
    Private Shared TripleDES As New TripleDESCryptoServiceProvider
    Private Shared MD5 As New MD5CryptoServiceProvider
    '------------------------------------------------------------------------------------------
	' Definição da chave de encriptação/desencriptação 
	'------------------------------------------------------------------------------------------
    Private Const key As String = "3SX86.VPI\~).[a5+{S8'WxV|M62P*I&"
    Public Shared Function MD5Hash(ByVal value As String) As Byte()
        '------------------------------------------------------------------------------------------
		' Converte a chave para um array de bytes  
		'------------------------------------------------------------------------------------------
        Dim byteArray() As Byte = ASCIIEncoding.UTF8.GetBytes(value)
        Return MD5.ComputeHash(byteArray)
    End Function
    Public Function Encrypt(ByVal stringToEncrypt As String) As String
        '------------------------------------------------------------------------------------------
		' Encripta uma string com base em uma chave 
		'------------------------------------------------------------------------------------------
        Try
			'------------------------------------------------------------------------------------------
            ' Definição da chave e da cifra (que neste caso é Electronic 
            ' Codebook, ou seja, encriptação individual para cada bloco) 
			'------------------------------------------------------------------------------------------
            TripleDES.Key = Crypto.MD5Hash(key)
            TripleDES.Mode = CipherMode.ECB
			'------------------------------------------------------------------------------------------
            ' Converte a string para bytes e encripta 
			'------------------------------------------------------------------------------------------
            Dim Buffer As Byte() = ASCIIEncoding.ASCII.GetBytes(stringToEncrypt)
            Return Convert.ToBase64String _
                (TripleDES.CreateEncryptor(). _
TransformFinalBlock(Buffer, 0, Buffer.Length))

        Catch ex As Exception

            MsgBox("Erro: " & ex.Message)
            Return String.Empty

        End Try

    End Function
    Public Function Decrypt(ByVal encryptedString As String) As String
		'------------------------------------------------------------------------------------------
        ' Decripta uma string com base em uma chave 
		'------------------------------------------------------------------------------------------
        Try
			'------------------------------------------------------------------------------------------
            ' Definição da chave e da cifra 
			'------------------------------------------------------------------------------------------
            If encryptedString = String.Empty Then Return String.Empty
            TripleDES.Key = Crypto.MD5Hash(key)
            TripleDES.Mode = CipherMode.ECB
			'------------------------------------------------------------------------------------------
            ' Converte a string encriptada para bytes e decripta 
			'------------------------------------------------------------------------------------------
            Dim Buffer As Byte() = Convert.FromBase64String(encryptedString)
            Return ASCIIEncoding.ASCII.GetString _
                (TripleDES.CreateDecryptor(). _
TransformFinalBlock(Buffer, 0, Buffer.Length))

        Catch ex As Exception

            MsgBox("Erro: " & ex.Message)
            Return String.Empty

        End Try

    End Function
End Class
