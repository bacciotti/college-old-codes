Imports Microsoft.VisualBasic

'------------------------------------------------------------------------------------------
'Classe de Definição de Obejtos
'Define os atributos dos objetos usados em toda a aplicação
'Contém os métodos Getters e Setters
'------------------------------------------------------------------------------------------

Public Class Pessoa
    '-----------------------------------------------------------------
    '-- Classe pessoa é a gerenalização das classes Usuario, Doador e Receptor
    '-----------------------------------------------------------------
#Region " Atributos"
    Private telefone2 As String
    Private cidade As String
    Private id As Integer 'pk
    Private cpf As String
    Private cep As String
    Private data_nascimento As Date
    Private email As String
    Private endereco As String
    Private estado As String
    Private nome As String
    Private observacao As String
    Private telefone1 As String
    '-----------------------------------------------------------------
    '--- Atributo tipo_pessoa define a função da pessoa no sistema:
    'Doador   = 1
    'Receptor = 2
    'Usuario  = 3
    '-----------------------------------------------------------------
    Private tipo_pessoa_id As Integer

#End Region

#Region "Propriedades Getters e Setters"
    Public Property pTelefone2 As String
        Get
            Return telefone2
        End Get
        Set(ByVal value As String)
            telefone2 = value
        End Set
    End Property
    Public Property pCidade As String
        Get
            Return cidade
        End Get
        Set(ByVal value As String)
            cidade = value
        End Set
    End Property
    Public Property pId As Integer
        Get
            Return id
        End Get
        Set(ByVal value As Integer)
            id = value
        End Set
    End Property
    Public Property pCpf As String
        Get
            Return cpf
        End Get
        Set(ByVal value As String)
            cpf = value
        End Set
    End Property
    Public Property pCep As String
        Get
            Return cep
        End Get
        Set(ByVal value As String)
            cep = value
        End Set
    End Property
    Public Property pData_nascimento As Date
        Get
            Return data_nascimento
        End Get
        Set(ByVal value As Date)
            data_nascimento = value
        End Set
    End Property
    Public Property pEmail As String
        Get
            Return email
        End Get
        Set(ByVal value As String)
            email = value
        End Set
    End Property
    Public Property pEndereco As String
        Get
            Return endereco
        End Get
        Set(ByVal value As String)
            endereco = value
        End Set
    End Property

    Public Property pEstado As String
        Get
            Return estado
        End Get
        Set(ByVal value As String)
            estado = value
        End Set
    End Property
    Public Property pNome As String
        Get
            Return nome
        End Get
        Set(ByVal value As String)
            nome = value
        End Set
    End Property
    Public Property pObservacao As String
        Get
            Return observacao
        End Get
        Set(ByVal value As String)
            observacao = value
        End Set
    End Property
    Public Property pTelefone1 As String
        Get
            Return telefone1
        End Get
        Set(ByVal value As String)
            telefone1 = value
        End Set
    End Property
    Public Property pTipo_pessoa As Integer
        Get
            Return tipo_pessoa_id
        End Get
        Set(ByVal value As Integer)
            tipo_pessoa_id = value
        End Set
    End Property
#End Region

#Region "Métodos"
    Public Shared Function ValidaCPF(ByVal pCPF As String) As Boolean
        Dim i, a, n1, n2 As Integer

        pCPF = pCPF.Replace(".", "").Replace(",", "").Replace("/", "").Replace("-", "")
        pCPF = pCPF.Trim

        If pCPF = "" OrElse _
          pCPF.Trim.Length <> 11 OrElse _
          pCPF = "11111111111" OrElse _
          pCPF = "22222222222" OrElse _
          pCPF = "33333333333" OrElse _
          pCPF = "44444444444" OrElse _
          pCPF = "55555555555" OrElse _
          pCPF = "66666666666" OrElse _
          pCPF = "77777777777" OrElse _
          pCPF = "88888888888" OrElse _
          pCPF = "99999999999" Then
            Return False
        End If

        For a = 0 To 1
            n1 = 0
            For i = 1 To 9 + a
                n1 = n1 + Val(Mid(pCPF, i, 1)) * (11 + a - i)
            Next
            n2 = 11 - (n1 - (Int(n1 / 11) * 11))
            If n2 = 10 Or n2 = 11 Then n2 = 0
            If n2 <> Val(Mid(pCPF, 10 + a, 1)) Then
                Return False
            End If
        Next
        Return True
    End Function
    Public Function ValidaCNPJ(ByVal pCGC As String) As Boolean
        Dim RecebeCNPJ As String
        Dim Numero(14) As Integer
        Dim Soma, Resultado1, Resultado2 As Integer

        RecebeCNPJ = pCGC.Trim

        If RecebeCNPJ.Length <> 14 Or _
        RecebeCNPJ = "00000000000000" Or _
        RecebeCNPJ = "11111111111111" Or _
        RecebeCNPJ = "22222222222222" Or _
        RecebeCNPJ = "33333333333333" Or _
        RecebeCNPJ = "44444444444444" Or _
        RecebeCNPJ = "55555555555555" Or _
        RecebeCNPJ = "66666666666666" Or _
        RecebeCNPJ = "77777777777777" Or _
        RecebeCNPJ = "88888888888888" Or _
        RecebeCNPJ = "99999999999999" Then
            Return False
        Else
            Numero(1) = CInt(Mid(RecebeCNPJ, 1, 1))
            Numero(2) = CInt(Mid(RecebeCNPJ, 2, 1))
            Numero(3) = CInt(Mid(RecebeCNPJ, 3, 1))
            Numero(4) = CInt(Mid(RecebeCNPJ, 4, 1))
            Numero(5) = CInt(Mid(RecebeCNPJ, 5, 1))
            Numero(6) = CInt(Mid(RecebeCNPJ, 6, 1))
            Numero(7) = CInt(Mid(RecebeCNPJ, 7, 1))
            Numero(8) = CInt(Mid(RecebeCNPJ, 8, 1))
            Numero(9) = CInt(Mid(RecebeCNPJ, 9, 1))
            Numero(10) = CInt(Mid(RecebeCNPJ, 10, 1))
            Numero(11) = CInt(Mid(RecebeCNPJ, 11, 1))
            Numero(12) = CInt(Mid(RecebeCNPJ, 12, 1))
            Numero(13) = CInt(Mid(RecebeCNPJ, 13, 1))
            Numero(14) = CInt(Mid(RecebeCNPJ, 14, 1))

            Soma = Numero(1) * 5 + Numero(2) * 4 + Numero(3) * 3 + Numero(4) * 2 + Numero(5) * 9 + Numero(6) * 8 + Numero(7) * 7 + Numero(8) * 6 + Numero(9) * 5 + Numero(10) * 4 + Numero(11) * 3 + Numero(12) * 2
            Soma = Soma - (11 * (Int(Soma / 11)))

            If Soma = 0 Or Soma = 1 Then
                Resultado1 = 0
            Else
                Resultado1 = 11 - Soma
            End If

            If Resultado1 = Numero(13) Then
                Soma = Numero(1) * 6 + Numero(2) * 5 + Numero(3) * 4 + Numero(4) * 3 + Numero(5) * 2 + Numero(6) * 9 + Numero(7) * 8 + Numero(8) * 7 + Numero(9) * 6 + Numero(10) * 5 + Numero(11) * 4 + Numero(12) * 3 + Numero(13) * 2
                Soma = Soma - (11 * (Int(Soma / 11)))

                If Soma = 0 Or Soma = 1 Then
                    Resultado2 = 0
                Else
                    Resultado2 = 11 - Soma
                End If

                If Resultado2 = Numero(14) Then
                    Return True
                Else
                    Return False
                End If
            Else
                Return False
            End If
        End If
    End Function
#End Region
End Class
