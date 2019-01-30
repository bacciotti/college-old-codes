Imports Microsoft.VisualBasic
Imports System.Data
'------------------------------------------------------------------------------------------
'Classe de Regras de Negócios (BLL)
'Faz o intermédio da Classe de Aceso a Dados (DAL) e a de apresentação e modelo.
'-- Trata a manipulação de Pessoas - Doadores, Receptores e Usuarios e suas propriedades.
'------------------------------------------------------------------------------------------

Public Class PessoaBLL

    ' Funções relacionadas à Pessoa Doador
    Public Function InsereAlteraDoador(ByVal pObj_doador As Doador, ByVal pModoInserir As Boolean) As Integer
        'Cria e instancia o objeto do Doador da camada de acesso a dados (DAL)
        Dim obj_doador_DAL As New PessoaDAL

		'------------------------------------------------------------------------------------------
        'Testa se doador já está cadastrado
        'Retornos possíveis de "VerificaCadastro":
        '0 = Erro Cadastro
        '1 = Cadastro Sucesso
        '2 = Doador Já cadastrado
		'------------------------------------------------------------------------------------------

        If pModoInserir Then 'pModoInserir = true: Insert. pModoInserir = false: Update.
            If obj_doador_DAL.VerificaCadastroDoador(pObj_doador) Then
				'------------------------------------------------------------------------------------------
                'Se o doador nao estiver cadastrado, chama o método de inserção (insere)
                'da DAL, que vai dar o INSERT no bd.
				'------------------------------------------------------------------------------------------
                If obj_doador_DAL.InsereAlteraDoador(pObj_doador, True) Then
                    'Se cadastrado com sucesso, retorna 1
                    Return "1"
                Else
                    'Se o cadastro der erro, retorna 0
                    Return "0"
                End If
            Else
				'------------------------------------------------------------------------------------------
                'Se o retorno de "VerificaCadastro" for FALSO, quer dizer que TEM LINHAS no Select, entao
                'o doador já está cadastrado. Sendo assim, retorna para a Model que o doador já está cadastrado.
                '(return 2)
				'------------------------------------------------------------------------------------------
                Return "2"
            End If
        Else
            If obj_doador_DAL.InsereAlteraDoador(pObj_doador, False) Then
                'Se editado com sucesso, retorna 1
                Return "1"
            Else
                'Se edicao der erro, retorna 0
                Return "0"
            End If
        End If
        Return False
    End Function
    Public Function BuscaDadosDoador(ByVal pId As Integer) As Doador
        Dim obj_Pessoa_DAL As New PessoaDAL
        Return obj_Pessoa_DAL.BuscaDadosDoador(pId)
    End Function
    Public Function PodeDoar(ByVal pId As Integer) As Boolean
		'------------------------------------------------------------------------------------------
		'-- Função faz as contas com a data de última doação do doador para ver se ele pode
		'-- efetuar uma nova doação agora ou não.
		'------------------------------------------------------------------------------------------
        Dim obj_configuracao_BLL As New ConfiguracaoBLL
        Dim PeriodoMinimoDoacoes As Integer
		'Busca na tabela de Configurações qual o período mínimo entre doações para fazer o cálculo.
        PeriodoMinimoDoacoes = Trim(obj_configuracao_BLL.BuscaConfiguracao("PeriodoMinimoDoacoes").pValor_conf)
		'------------------------------------------------------------------------------------------
        'chama a DAL, passando o ID do doador
        'recebe de volta a data da última doação
        'faz o teste se tem mais de X dias (depende da configuração, é de 60 a 90 dias.)
        'retorna 0 ou 1 para a model, dependendo do if.
		'------------------------------------------------------------------------------------------
        Dim UltimaDoacao As String
        Dim DataAtual = (DateTime.Now.Date)
        Dim diferenca As TimeSpan
        Dim diferencaDias As Integer
        Dim obj_doador_DAL As New PessoaDAL
        UltimaDoacao = obj_doador_DAL.BuscaUltimaDoacao(pId)
        If UltimaDoacao = "0" Then
            Return True
        Else

            diferenca = DataAtual.Subtract(CDate(UltimaDoacao))
            diferencaDias = diferenca.TotalDays
            If diferencaDias >= PeriodoMinimoDoacoes Then
                Return True
            Else
                Return False
            End If
        End If
    End Function
    Public Function GravaFichaPreDoacao(ByVal pObj_FichaPreDoacao As FichaPreDoacao) As Boolean
        Dim obj_doador_DAL As New PessoaDAL
        If obj_doador_DAL.GravaFichaPreDoacao(pObj_FichaPreDoacao) Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function RetornaIdade(ByVal pId As Integer) As Integer
        Dim obj_Pessoa_DAL As New PessoaDAL
        Dim DataNasc As String
        DataNasc = obj_Pessoa_DAL.RetornaDataNasc(pId)

        If DataNasc = "0" Then
            Return "0"
        Else
            Dim dtDataNasc As DateTime
            dtDataNasc = CDate(DataNasc)
            Dim Idade As Integer = DateTime.Now.Year - dtDataNasc.Year
            If (dtDataNasc > DateTime.Now.AddYears(-Idade)) Then
                Idade = Idade - 1
            End If
            Return Idade
        End If
    End Function
    Public Function GravaCorrespondencia(ByVal pObj_Correspondencia As Corresp) As Boolean
        Dim obj_doador_DAL As New PessoaDAL
        If obj_doador_DAL.GravaCorrespondencia(pObj_Correspondencia) Then
            Return True
        Else
            Return False
        End If
    End Function


    ' Funções relacionadas à Pessoa Receptor
    Public Function InsereAlteraReceptor(ByVal pObj_receptor As Receptor, ByVal pModoInserir As Boolean) As Integer
        'Cria e instancia o objeto do receptor da camada de acesso a dados (DAL)
        Dim obj_doador_DAL As New PessoaDAL
		'------------------------------------------------------------------------------------------
        'Testa se já está cadastrado
        'Retornos possíveis de "VerificaCadastro":
        '0 = Erro Cadastro
        '1 = Cadastro Sucesso
        '2 = Doador Já cadastrado
		'------------------------------------------------------------------------------------------
        If pModoInserir Then 'pModoInserir = true: Insert. pModoInserir = false: Update.
            If obj_doador_DAL.VerificaCadastroReceptor(pObj_receptor) Then
                'Se  nao estiver cadastrado, chama o método de insercao (insere)
                'da DAL, que vai dar o INSERT no bd.
                If obj_doador_DAL.InsereAlteraReceptor(pObj_receptor, True) Then
                    'Se cadastrado com sucesso, retorna 1
                    Return "1"
                Else
                    'Se o cadastro der erro, retorna 0
                    Return "0"
                End If
            Else
				'------------------------------------------------------------------------------------------
                'Se o retorno de "VerificaCadastro" for FALSO, quer dizer que TEM LINHAS no Select, entao
                'o receptor já está cadastrado. Sendo assim, retorna para a Model que o receptor já está cadastrado.
                '(return 2)
				'------------------------------------------------------------------------------------------
                Return "2"
            End If
        Else
            If obj_doador_DAL.InsereAlteraReceptor(pObj_receptor, False) Then
                'Se editado com sucesso, retorna 1
                Return "1"
            Else
                'Se edicao der erro, retorna 0
                Return "0"
            End If
        End If
        Return False
    End Function
    Public Function BuscaDadosReceptor(ByVal pId As Integer) As Receptor
        Dim obj_Pessoa_DAL As New PessoaDAL
        Return obj_Pessoa_DAL.BuscaDadosReceptor(pId)
    End Function

    'Funções relacionadas à Pessoa Usuário
    Public Function InsereAlteraUsuario(ByVal pObj_usuario As Usuario, ByVal pModoInserir As Boolean) As Integer
        'Cria e instancia o objeto do Usuário da camada de acesso a dados (DAL)
        Dim obj_usuario_DAL As New PessoaDAL
		'------------------------------------------------------------------------------------------
        'Testa se usuário já está cadastrado
        'Retornos possíveis de "VerificaCadastro":
        '0 = Erro Cadastro
        '1 = Cadastro Sucesso
        '2 = Usuário Já cadastrado
		'------------------------------------------------------------------------------------------
        If pModoInserir Then 'pModoInserir = true: Insert. pModoInserir = false: Update.
            If obj_usuario_DAL.VerificaCadastroUsuario(pObj_usuario) Then
                'Se o usuario nao estiver cadastrado, chama o método de insercao (insere)
                'da DAL, que vai dar o INSERT no bd.
                If obj_usuario_DAL.InsereAlteraUsuario(pObj_usuario, True) Then
                    'Se cadastrado com sucesso, retorna 1
                    Return "1"
                Else
                    'Se o cadastro der erro, retorna 0
                    Return "0"
                End If
            Else
				'------------------------------------------------------------------------------------------
                'Se o retorno de "VerificaCadastro" for FALSO, quer dizer que TEM LINHAS no Select, entao
                'o usuario já está cadastrado. Sendo assim, retorna para a view que o usuario já está cadastrado.
                '(return 2)
				'------------------------------------------------------------------------------------------
                Return "2"
            End If
        Else
            If obj_usuario_DAL.InsereAlteraUsuario(pObj_usuario, False) Then
                'Se editado com sucesso, retorna 1
                Return "1"
            Else
                'Se edicao der erro, retorna 0
                Return "0"
            End If
        End If
        Return False
    End Function
    Public Function BuscaDadosUsuario(ByVal pId As Integer) As Usuario
        Dim obj_Pessoa_DAL As New PessoaDAL
        Return obj_Pessoa_DAL.BuscaDadosUsuario(pId)
    End Function
    Public Function AlteraSenha(ByVal pObj_usuario As Usuario) As Boolean
        Dim obj_Usuario_DAL As New PessoaDAL
        If obj_Usuario_DAL.AlteraSenha(pObj_usuario) Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function AutenticaUsuario(ByVal pUser As String, ByVal pPass As String) As Integer
        Dim obj_Pessoa_DAL As New PessoaDAL
        Return obj_Pessoa_DAL.AutenticaUsuario(pUser, pPass)
    End Function
    Public Function UsuarioAdmin(ByVal pUserName As String) As Boolean
        Dim obj_Pessoa_DAL As New PessoaDAL
        Return obj_Pessoa_DAL.UsuarioAdmin(pUserName)
    End Function
    'Funções relacionadas ao Sangue
    Public Function RetornaTipoSangue(ByVal pId As Integer) As String
        Dim obj_Pessoa_DAL As New PessoaDAL
        Return obj_Pessoa_DAL.RetornaTipoSangue(pId)
    End Function

    'Outras funções diversas
    Public Function ExcluirPessoa(ByVal pId As Integer) As Boolean
        Dim obj_Pessoa_DAL As New PessoaDAL
        If obj_Pessoa_DAL.ExcluirPessoa(pId) Then
            Return True
        Else
            Return False
        End If
    End Function
    Public Function BuscaPessoa(ByVal pTipoPessoa As Integer, ByVal pParametroBusca As String, ByVal pBuscaPorNome As Boolean) As DataSet1
        'A busca de pessoas
		Dim obj_Pessoa_DAL As New PessoaDAL
        Return obj_Pessoa_DAL.BuscaPessoa(pTipoPessoa, pParametroBusca, pBuscaPorNome)
    End Function
    Public Function BuscaRapida(ByVal pParametroBusca As String) As DataSet1
        'A busca rápida que fica no topo direito da página.
		Dim obj_Pessoa_DAL As New PessoaDAL
        Return obj_Pessoa_DAL.BuscaRapida(pParametroBusca)
    End Function
End Class