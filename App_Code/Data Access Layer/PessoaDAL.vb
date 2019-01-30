Imports Microsoft.VisualBasic
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Data

'------------------------------------------------------------------------------------------
'Classe de Acesso a Dados (DAL)
'Faz a interação direta com o Banco de Dados e retorna informações para a BLL.
'-- Trata a manipulação das Pessoas - Doadores, Receptores e Usuários e suas propriedades.
'------------------------------------------------------------------------------------------

Public Class PessoaDAL

#Region "Atributos"
    Dim obj_Configuracao_BLL As New ConfiguracaoBLL
    Dim StringConexao As String = obj_Configuracao_BLL.RetornaStrConexao
#End Region

#Region "Métodos"
    'Funções relacionadas ao Doador
    Public Function InsereAlteraDoador(ByVal pObj_doador As Doador, ByVal pModoInserir As Boolean) As Boolean
		'------------------------------------------------------------------------------------------
        'tá recebendo como parametro um objeto da classe doador e um boolean que fala se é insercao ou alteracao
		'------------------------------------------------------------------------------------------
		
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        If pModoInserir Then
            sql = "Insert into Pessoas (nome,data_nascimento,cpf,tipo_pessoa_id,telefone1,telefone2,cep,cidade,email,endereco,estado,observacao,sangue_id) values (@Nome,@DataNasc,@Cpf,@Tipo_pessoa_id,@Telefone1,@Telefone2,@Cep,@Cidade,@Email,@Endereco,@Estado,@Observacao,@Sangue_id)"
        Else
            sql = "UPDATE Pessoas set nome=@Nome,data_nascimento=@DataNasc,cpf=@Cpf,telefone1=@Telefone1,telefone2=@Telefone2,cep=@Cep,cidade=@Cidade,email=@Email,endereco=@Endereco,estado=@Estado,observacao=@Observacao,sangue_id=@Sangue_id WHERE id = @Id AND tipo_pessoa_id = '1'"
        End If
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        If pModoInserir Then
            Comando.Parameters.Add(New SqlParameter("@Tipo_pessoa_id", SqlDbType.Int)).Value = pObj_doador.pTipo_pessoa
        Else
            Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pObj_doador.pId
        End If
        Comando.Parameters.Add(New SqlParameter("@Nome", SqlDbType.VarChar)).Value = pObj_doador.pNome
        Comando.Parameters.Add(New SqlParameter("@DataNasc", SqlDbType.DateTime)).Value = pObj_doador.pData_nascimento
        Comando.Parameters.Add(New SqlParameter("@Cpf", SqlDbType.VarChar)).Value = pObj_doador.pCpf
        Comando.Parameters.Add(New SqlParameter("@Telefone1", SqlDbType.VarChar)).Value = pObj_doador.pTelefone1
        Comando.Parameters.Add(New SqlParameter("@Telefone2", SqlDbType.VarChar)).Value = pObj_doador.pTelefone2
        Comando.Parameters.Add(New SqlParameter("@Cep", SqlDbType.VarChar)).Value = pObj_doador.pCep
        Comando.Parameters.Add(New SqlParameter("@Cidade", SqlDbType.VarChar)).Value = pObj_doador.pCidade
        Comando.Parameters.Add(New SqlParameter("@Email", SqlDbType.VarChar)).Value = pObj_doador.pEmail
        Comando.Parameters.Add(New SqlParameter("@Endereco", SqlDbType.VarChar)).Value = pObj_doador.pEndereco
        Comando.Parameters.Add(New SqlParameter("@Estado", SqlDbType.VarChar)).Value = pObj_doador.pEstado
        Comando.Parameters.Add(New SqlParameter("@Observacao", SqlDbType.VarChar)).Value = pObj_doador.pObservacao
        Comando.Parameters.Add(New SqlParameter("@Sangue_id", SqlDbType.Int)).Value = pObj_doador.pSangue_id
        '------------------------------------------------------------------------------------------

        'Abre conexão, executa comando e fecha conexão TRATANDO EXCEÇÃO-----
        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
            Return False
        End Try
        Conexao.Close()
        'Se tudo der certo, retorna TRUE--------
        Return True
        '----------------------------------------

    End Function
    Public Function VerificaCadastroDoador(ByVal pObj_doador As Doador) As Boolean
		'------------------------------------------------------------------------------------------
		'-- Função que verifica se o Doador já está cadastrado no sistema ou não.
		'------------------------------------------------------------------------------------------
        Dim sql As String = "SELECT * FROM Pessoas WHERE cpf = @Cpf AND tipo_pessoa_id='1'"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader

        Comando.Parameters.Add(New SqlParameter("@Cpf", SqlDbType.VarChar)).Value = pObj_doador.pCpf

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            'Se tiver linhas (o doador já estiver cadastrado) retorna FALSE para BLL.
            Return False
        Else
            'Se não tiver linhas (o doador não estiver cadastrado) retorna TRUE para BLL.
            Return True
        End If
        DtReader.Close()
        Conexao.Close()
    End Function
    Public Function BuscaDadosDoador(ByVal pId As Integer) As Doador
		'------------------------------------------------------------------------------------------
		'-- Popula os atributos do objeto e retorna ele.
		'------------------------------------------------------------------------------------------
        Dim sql As String = "SELECT * FROM Pessoas WHERE id = @Id"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pId

        Dim obj_Doador As New Doador

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            obj_Doador.pCep = DtReader.Item("cep")
            obj_Doador.pCidade = DtReader.Item("cidade")
            obj_Doador.pCpf = DtReader.Item("cpf")
            obj_Doador.pData_nascimento = DtReader.Item("data_nascimento")
            obj_Doador.pEmail = DtReader.Item("email")
            obj_Doador.pEndereco = DtReader.Item("endereco")
            obj_Doador.pEstado = DtReader.Item("estado")
            obj_Doador.pObservacao = DtReader.Item("observacao")
            obj_Doador.pTelefone1 = DtReader.Item("telefone1")
            obj_Doador.pTelefone2 = DtReader.Item("telefone2")
            obj_Doador.pNome = DtReader.Item("nome")
            obj_Doador.pSangue_id = DtReader.Item("sangue_id")
        End If
        DtReader.Close()
        Conexao.Close()
        Return obj_Doador

    End Function
    Public Function BuscaUltimaDoacao(ByVal pId As Integer) As String
        Dim sql As String = "SELECT data FROM Movimentacoes WHERE pessoa_id = @Id ORDER BY data DESC"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Dim UltimaDoacao As String
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pId

        Conexao.Open()
        DtReader = Comando.ExecuteReader()

        If DtReader.HasRows Then
            DtReader.Read()
            UltimaDoacao = DtReader.Item("data").ToString 'retorna a data da ultima doacao
            Return UltimaDoacao
        Else
            Return "0" 'Quer dizer que nunca doou
        End If
        DtReader.Close()
        Conexao.Close()
    End Function
    Public Function GravaFichaPreDoacao(ByVal pObj_FichaPreDoacao As FichaPreDoacao) As Boolean
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        sql = "Insert into Fichas_predoacao (aprovada,peso_doador,aborto_parto,gravida,amamentando,tatuagem_piercing_acupuntura,transfusao,bebidas_alcoolicas,usuario_drogas,doencas_infectocontagiosas,gripe_resfriado_diarreia,ferimento) values (@Aprovada,@Peso_doador,@Aborto_parto,@Gravida,@Amamentando,@Tatuagem_piercing_acupuntura,@Transfusao,@Bebidas_alcoolicas,@Usuario_drogas,@Doencas_infectocontagiosas,@Gripe_resfriado_diarreia,@Ferimento)"
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Aprovada", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pAprovada
        Comando.Parameters.Add(New SqlParameter("@Peso_doador", SqlDbType.Real)).Value = pObj_FichaPreDoacao.pPeso_doador
        Comando.Parameters.Add(New SqlParameter("@Aborto_parto", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pAborto_parto
        Comando.Parameters.Add(New SqlParameter("@Gravida", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pGravida
        Comando.Parameters.Add(New SqlParameter("@Amamentando", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pAmamentando
        Comando.Parameters.Add(New SqlParameter("@Tatuagem_piercing_acupuntura", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pTatuagem_piercing_acupuntura
        Comando.Parameters.Add(New SqlParameter("@Transfusao", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pTransfusao
        Comando.Parameters.Add(New SqlParameter("@Bebidas_alcoolicas", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pBebidas_alcoolicas
        Comando.Parameters.Add(New SqlParameter("@Usuario_drogas", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pUsuario_drogas
        Comando.Parameters.Add(New SqlParameter("@Doencas_infectocontagiosas", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pDoencas_infectocontagiosas
        Comando.Parameters.Add(New SqlParameter("@Gripe_resfriado_diarreia", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pGripe_resfriado_diarreia
        Comando.Parameters.Add(New SqlParameter("@Ferimento", SqlDbType.Bit)).Value = pObj_FichaPreDoacao.pFerimento
        '------------------------------------------------------------------------------------------

        'Abre conexão, executa comando e fecha conexão TRATANDO EXCEÇÃO-----
        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
            Return False
        End Try
        Conexao.Close()
        'Se tudo der certo, retorna TRUE--------
        Return True
        '----------------------------------------

    End Function
    Public Function RetornaDataNasc(ByVal pId As Integer) As String
        Dim DataNasc As String
        Dim sql As String = "SELECT data_nascimento FROM Pessoas WHERE id = @Id"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pId

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            DataNasc = DtReader.Item("data_nascimento")
        Else
            DataNasc = "0" 'Não foi encontrado nada nessa consulta. / Nao tem linhas.
        End If
        DtReader.Close()
        Conexao.Close()

        Return DataNasc
    End Function
    Public Function GravaCorrespondencia(ByVal pObj_Correspondencia As Corresp) As Boolean
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        sql = "Insert into Correspondencias (pessoa_id, data) values (@Pessoa_id, @Data)"
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Pessoa_id", SqlDbType.Int)).Value = pObj_Correspondencia.pPessoa_id
        Comando.Parameters.Add(New SqlParameter("@Data", SqlDbType.Date)).Value = pObj_Correspondencia.pData
        '------------------------------------------------------------------------------------------

        'Abre conexão, executa comando e fecha conexão TRATANDO EXCEÇÃO-----
        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
            Return False
        End Try
        Conexao.Close()
        'Se tudo der certo, retorna TRUE--------
        Return True
        '----------------------------------------
    End Function

    'Funções relacionadas ao Receptor
    Public Function InsereAlteraReceptor(ByVal pObj_receptor As Receptor, ByVal pModoInserir As Boolean) As Boolean
        'doador = 1, receptor = 2, usuario = 3
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        If pModoInserir Then
            sql = "Insert into Pessoas (nome,cnpj,tipo_pessoa_id,telefone1,telefone2,cep,cidade,email,endereco,estado,observacao) values (@Nome,@Cnpj,@Tipo_pessoa_id,@Telefone1,@Telefone2,@Cep,@Cidade,@Email,@Endereco,@Estado,@Observacao)"
        Else
            sql = "UPDATE Pessoas set nome=@Nome,cnpj=@Cnpj,telefone1=@Telefone1,telefone2=@Telefone2,cep=@Cep,cidade=@Cidade,email=@Email,endereco=@Endereco,estado=@Estado,observacao=@Observacao WHERE id = @Id AND tipo_pessoa_id = '2'"
        End If
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        If pModoInserir Then
            Comando.Parameters.Add(New SqlParameter("@Tipo_pessoa_id", SqlDbType.Int)).Value = pObj_receptor.pTipo_pessoa
        Else
            Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pObj_receptor.pId
        End If
        Comando.Parameters.Add(New SqlParameter("@Nome", SqlDbType.VarChar)).Value = pObj_receptor.pNome
        Comando.Parameters.Add(New SqlParameter("@Cnpj", SqlDbType.VarChar)).Value = pObj_receptor.pCnpj
        Comando.Parameters.Add(New SqlParameter("@Telefone1", SqlDbType.VarChar)).Value = pObj_receptor.pTelefone1
        Comando.Parameters.Add(New SqlParameter("@Telefone2", SqlDbType.VarChar)).Value = pObj_receptor.pTelefone2
        Comando.Parameters.Add(New SqlParameter("@Cep", SqlDbType.VarChar)).Value = pObj_receptor.pCep
        Comando.Parameters.Add(New SqlParameter("@Cidade", SqlDbType.VarChar)).Value = pObj_receptor.pCidade
        Comando.Parameters.Add(New SqlParameter("@Email", SqlDbType.VarChar)).Value = pObj_receptor.pEmail
        Comando.Parameters.Add(New SqlParameter("@Endereco", SqlDbType.VarChar)).Value = pObj_receptor.pEndereco
        Comando.Parameters.Add(New SqlParameter("@Estado", SqlDbType.VarChar)).Value = pObj_receptor.pEstado
        Comando.Parameters.Add(New SqlParameter("@Observacao", SqlDbType.VarChar)).Value = pObj_receptor.pObservacao
        '------------------------------------------------------------------------------------------

        'Abre conexão, executa comando e fecha conexão TRATANDO EXCEÇÃO-----
        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
            Return False
        End Try
        Conexao.Close()
        'Se tudo der certo, retorna TRUE--------
        Return True
        '----------------------------------------
    End Function
    Public Function VerificaCadastroReceptor(ByVal pObj_receptor As Receptor) As Boolean
		'------------------------------------------------------------------------------------------
		'-- Função que verifica se o Receptor já está cadastrado no sistema ou não.
		'------------------------------------------------------------------------------------------
        Dim sql As String = "SELECT * FROM Pessoas WHERE cnpj = @Cnpj AND tipo_pessoa_id='2'"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader

        Comando.Parameters.Add(New SqlParameter("@Cnpj", SqlDbType.VarChar)).Value = pObj_receptor.pCnpj
        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            'Se tiver linhas (o receptor já estiver cadastrado) retorna FALSE para BLL.
            Return False
        Else
            'Se não tiver linhas (o receptor não estiver cadastrado) retorna TRUE para BLL.
            Return True
        End If
        DtReader.Close()
        Conexao.Close()
    End Function
    Public Function BuscaDadosReceptor(ByVal pId As Integer) As Receptor
		'------------------------------------------------------------------------------------------
		'-- Popula os atributos do objeto e retorna ele.
		'------------------------------------------------------------------------------------------
        Dim sql As String = "SELECT * FROM Pessoas WHERE id = @Id"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pId

        Dim obj_Receptor As New Receptor

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            obj_Receptor.pCep = DtReader.Item("cep")
            obj_Receptor.pCidade = DtReader.Item("cidade")
            obj_Receptor.pCnpj = DtReader.Item("cnpj")
            obj_Receptor.pEmail = DtReader.Item("email")
            obj_Receptor.pEndereco = DtReader.Item("endereco")
            obj_Receptor.pEstado = DtReader.Item("estado")
            obj_Receptor.pObservacao = DtReader.Item("observacao")
            obj_Receptor.pTelefone1 = DtReader.Item("telefone1")
            obj_Receptor.pTelefone2 = DtReader.Item("telefone2")
            obj_Receptor.pNome = DtReader.Item("nome")
        End If
        DtReader.Close()
        Conexao.Close()
        Return obj_Receptor

    End Function

    'Funções relacionadas ao Usuário
    Public Function InsereAlteraUsuario(ByVal pObj_usuario As Usuario, ByVal pModoInserir As Boolean) As Boolean
        'doador = 1, receptor =2, usuario =3
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        If pModoInserir Then
            sql = "Insert into Pessoas (nome,cpf,data_nascimento,tipo_pessoa_id,telefone1,telefone2,cep,cidade,email,endereco,estado,observacao,cargo,nome_usuario,senha,tipo_usuario_id) values (@Nome,@Cpf,@Data_nascimento,@Tipo_pessoa_id,@Telefone1,@Telefone2,@Cep,@Cidade,@Email,@Endereco,@Estado,@Observacao,@Cargo,@nome_usuario,@senha,@Tipo_usuario_id)"
        Else
            sql = "UPDATE Pessoas set nome=@Nome,cpf=@Cpf,data_nascimento=@Data_nascimento,telefone1=@Telefone1,telefone2=@Telefone2,cep=@Cep,cidade=@Cidade,email=@Email,endereco=@Endereco,estado=@Estado,observacao=@Observacao,cargo=@Cargo,nome_usuario=@Nome_usuario,Senha=@Senha,tipo_usuario_id=@Tipo_usuario_id WHERE id = @Id AND tipo_pessoa_id = '3'"
        End If
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        If pModoInserir Then
            Comando.Parameters.Add(New SqlParameter("@Tipo_pessoa_id", SqlDbType.Int)).Value = pObj_usuario.pTipo_pessoa '3
        Else
            Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pObj_usuario.pId
        End If
        Comando.Parameters.Add(New SqlParameter("@Nome", SqlDbType.VarChar)).Value = pObj_usuario.pNome
        Comando.Parameters.Add(New SqlParameter("@Cpf", SqlDbType.VarChar)).Value = pObj_usuario.pCpf
        Comando.Parameters.Add(New SqlParameter("@Data_nascimento", SqlDbType.DateTime)).Value = pObj_usuario.pData_nascimento
        Comando.Parameters.Add(New SqlParameter("@Telefone1", SqlDbType.VarChar)).Value = pObj_usuario.pTelefone1
        Comando.Parameters.Add(New SqlParameter("@Telefone2", SqlDbType.VarChar)).Value = pObj_usuario.pTelefone2
        Comando.Parameters.Add(New SqlParameter("@Cep", SqlDbType.VarChar)).Value = pObj_usuario.pCep
        Comando.Parameters.Add(New SqlParameter("@Cidade", SqlDbType.VarChar)).Value = pObj_usuario.pCidade
        Comando.Parameters.Add(New SqlParameter("@Email", SqlDbType.VarChar)).Value = pObj_usuario.pEmail
        Comando.Parameters.Add(New SqlParameter("@Endereco", SqlDbType.VarChar)).Value = pObj_usuario.pEndereco
        Comando.Parameters.Add(New SqlParameter("@Estado", SqlDbType.VarChar)).Value = pObj_usuario.pEstado
        Comando.Parameters.Add(New SqlParameter("@Observacao", SqlDbType.VarChar)).Value = pObj_usuario.pObservacao
        Comando.Parameters.Add(New SqlParameter("@Nome_usuario", SqlDbType.VarChar)).Value = pObj_usuario.pNome_usuario
        Comando.Parameters.Add(New SqlParameter("@Senha", SqlDbType.VarChar)).Value = pObj_usuario.pSenha
        Comando.Parameters.Add(New SqlParameter("@Cargo", SqlDbType.VarChar)).Value = pObj_usuario.pCargo
        Comando.Parameters.Add(New SqlParameter("@Tipo_usuario_id", SqlDbType.Int)).Value = pObj_usuario.pTipo_usuario_id
        '------------------------------------------------------------------------------------------

        'Abre conexão, executa comando e fecha conexão TRATANDO EXCEÇÃO-----
        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
            Return False
        End Try
        Conexao.Close()
        'Se tudo der certo, retorna TRUE--------
        Return True
        '----------------------------------------
    End Function
    Public Function VerificaCadastroUsuario(ByVal pObj_usuario As Usuario) As Boolean
		'------------------------------------------------------------------------------------------
		'-- Função que verifica se o Usuário já está cadastrado no sistema ou não.
		'------------------------------------------------------------------------------------------
        Dim sql As String = "SELECT * FROM Pessoas WHERE nome_usuario = @Nome_usuario AND tipo_pessoa_id = '3'"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader

        Comando.Parameters.Add(New SqlParameter("@Nome_usuario", SqlDbType.VarChar)).Value = pObj_usuario.pNome_usuario
        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            'Se tiver linhas (o receptor já estiver cadastrado) retorna FALSE para BLL.
            Return False
        Else
            'Se não tiver linhas (o receptor não estiver cadastrado) retorna TRUE para BLL.
            Return True
        End If
        DtReader.Close()
        Conexao.Close()
    End Function
    Public Function BuscaDadosUsuario(ByVal pId As Integer) As Usuario
		'------------------------------------------------------------------------------------------
		'-- Popula os atributos do objeto e retorna ele.
		'------------------------------------------------------------------------------------------
        Dim sql As String = "SELECT * FROM Pessoas WHERE id = @Id"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Dim obj_Usuario As New Usuario
        Dim obj_Crypto As New Crypto
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pId

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            If IsDBNull(DtReader.Item("cep")) Then
                obj_Usuario.pCep = ""
            Else
                obj_Usuario.pCep = DtReader.Item("cep")
            End If
            If IsDBNull(DtReader.Item("cidade")) Then
                obj_Usuario.pCidade = ""
            Else
                obj_Usuario.pCidade = DtReader.Item("cidade")
            End If
            If IsDBNull(DtReader.Item("cpf")) Then
                obj_Usuario.pCpf = ""
            Else
                obj_Usuario.pCpf = DtReader.Item("cpf")
            End If
            If IsDBNull(DtReader.Item("endereco")) Then
                obj_Usuario.pEndereco = ""
            Else
                obj_Usuario.pEndereco = DtReader.Item("endereco")
            End If
            If IsDBNull(DtReader.Item("estado")) Then
                obj_Usuario.pEstado = ""
            Else
                obj_Usuario.pEstado = DtReader.Item("estado")
            End If
            If IsDBNull(DtReader.Item("observacao")) Then
                obj_Usuario.pObservacao = ""
            Else
                obj_Usuario.pObservacao = DtReader.Item("observacao")
            End If
            If IsDBNull(DtReader.Item("telefone1")) Then
                obj_Usuario.pTelefone1 = ""
            Else
                obj_Usuario.pTelefone2 = DtReader.Item("telefone1")
            End If
            If IsDBNull(DtReader.Item("telefone2")) Then
                obj_Usuario.pTelefone2 = ""
            Else
                obj_Usuario.pTelefone2 = DtReader.Item("telefone2")
            End If
            If IsDBNull(DtReader.Item("nome")) Then
                obj_Usuario.pNome = ""
            Else
                obj_Usuario.pNome = DtReader.Item("nome")
            End If
            If IsDBNull(DtReader.Item("nome_usuario")) Then
                obj_Usuario.pNome_usuario = ""
            Else
                obj_Usuario.pNome_usuario = DtReader.Item("nome_usuario")
            End If
            If IsDBNull(DtReader.Item("cargo")) Then
                obj_Usuario.pCargo = ""
            Else
                obj_Usuario.pCargo = DtReader.Item("cargo")
            End If
            If IsDBNull(DtReader.Item("data_nascimento")) Then
                obj_Usuario.pData_nascimento = "01/01/1901" 'Quando a data tiver nula no banco, so vai acontecer com o primeiro usuario, o ADMIN
            Else
                obj_Usuario.pData_nascimento = DtReader.Item("data_nascimento")
            End If
            If IsDBNull(DtReader.Item("tipo_usuario_id")) Then
                obj_Usuario.pTipo_usuario_id = "1"
            Else
                obj_Usuario.pTipo_usuario_id = DtReader.Item("tipo_usuario_id")
            End If
        End If
        DtReader.Close()
        Conexao.Close()
        Return obj_Usuario
    End Function
    Public Function AlteraSenha(ByVal pObj_Usuario As Usuario) As Boolean
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        sql = "UPDATE Pessoas set senha=@Senha WHERE id = @Id AND tipo_pessoa_id = '3'"
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pObj_Usuario.pId
        Comando.Parameters.Add(New SqlParameter("@Senha", SqlDbType.VarChar)).Value = pObj_Usuario.pSenha
        '------------------------------------------------------------------------------------------

        'Abre conexão, executa comando e fecha conexão TRATANDO EXCEÇÃO-----
        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
            Return False
        End Try
        Conexao.Close()
        'Se tudo der certo, retorna TRUE--------
        Return True
        '----------------------------------------
    End Function
    Public Function AutenticaUsuario(ByVal pUser As String, ByVal pPass As String) As Integer
		'------------------------------------------------------------------------------------------
		'-- Verifica se usuario e senha estao corretos
		'-- Passa pela Crypto
		'------------------------------------------------------------------------------------------
        Dim sql As String = "SELECT nome_usuario, senha FROM Pessoas WHERE nome_usuario = @Nome_usuario"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Dim UserName As String
        Dim Pass As String
        Dim obj_Crypto As New Crypto

        Comando.Parameters.Add(New SqlParameter("@Nome_usuario", SqlDbType.VarChar)).Value = pUser
        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            UserName = DtReader.Item("nome_usuario")
            Pass = obj_Crypto.Decrypt(DtReader.Item("senha")) 'Decriptografa
            If pUser = Trim(UserName) And pPass = Pass Then
                Return 1 'Autenticado ok!
            Else
                Return 2 'Usuario ou senha Invalidos!
            End If
        Else
            Return 0 'Nao tem linhas, usuario nao cadastrado!
        End If
        DtReader.Close()
        Conexao.Close()
    End Function
    Public Function UsuarioAdmin(ByVal pUserName As String) As Boolean
        Dim sql As String = "SELECT * FROM Pessoas WHERE nome_usuario = @Nome_usuario"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Dim Tipo_usuario_id As Integer
        Comando.Parameters.Add(New SqlParameter("@Nome_usuario", SqlDbType.VarChar)).Value = pUserName

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            Tipo_usuario_id = DtReader.Item("tipo_usuario_id")
        End If
        DtReader.Close()
        Conexao.Close()

        If Tipo_usuario_id = 2 Then 'Se o Flag for 2, ele é Administrador
            Return True
        Else
            Return False
        End If

    End Function
    'Funções relacionadas ao Sangue
    Public Function RetornaTipoSangue(ByVal pId As Integer) As String
		'------------------------------------------------------------------------------------------
		'-- Retorna o tipo de sangue da pessoa em questão 
		'------------------------------------------------------------------------------------------
        Dim TipoSangue As String
        Dim sql As String = "SELECT tipo FROM Sangues S, Pessoas P WHERE P.id = @Id AND P.sangue_id = S.id"
        Dim Conexao As New SqlConnection(StringConexao)
        Dim Comando As New SqlCommand(sql, Conexao)
        Dim DtReader As SqlDataReader
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pId

        Conexao.Open()
        DtReader = Comando.ExecuteReader()
        If DtReader.HasRows Then
            DtReader.Read()
            TipoSangue = DtReader.Item("tipo")
        Else
            TipoSangue = "NUL" 'Isso só vai acontecer se tiver algo errado no cadastro do doador.
        End If
        DtReader.Close()
        Conexao.Close()

        Return TipoSangue
    End Function

    'Outras funções diversas 
    Public Function ExcluirPessoa(ByRef pId As Integer) As Boolean
		'USO NÃO RECOMENDADO 
		
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------

        'Query SQL---------------------------------------------------
        Dim sql As String
        sql = "Delete FROM Pessoas WHERE id = @Id"
        '------------------------------------------------------------

        'Comando---------------------------------------
        Dim Comando As SqlCommand
        Comando = New SqlCommand(sql, Conexao)
        '----------------------------------------------

        'Parâmetros--------------------------------------------------------------------------------
        Comando.Parameters.Add(New SqlParameter("@Id", SqlDbType.Int)).Value = pId
        '------------------------------------------------------------------------------------------

        'Abre conexão, executa comando e fecha conexão TRATANDO EXCEÇÃO-----
        Try
            Conexao.Open()
            Comando.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
            Return False
        End Try
        Conexao.Close()
        'Se tudo der certo, retorna TRUE--------
        Return True
        '----------------------------------------
    End Function
    Public Function BuscaPessoa(ByVal pTipoPessoa As Integer, ByVal pParametroBusca As String, ByVal pBuscaPorNome As Boolean) As DataSet1
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------
        Dim ds As New DataSet1
        Dim da As SqlDataAdapter = New SqlDataAdapter
        Dim sql As String

        If pBuscaPorNome Then
            Select Case pTipoPessoa
                Case 1
                    sql = "SELECT Pessoas.id as ID,nome as NOME, Sangues.tipo as SANGUE, Pessoas.cpf as CPF, Pessoas.telefone1 as TELEFONE, Pessoas.data_nascimento as NASCIMENTO FROM Pessoas, Sangues WHERE tipo_pessoa_id = 1 AND Sangues.id = Pessoas.sangue_id AND Pessoas.nome LIKE '%' + @ParametroBusca + '%' ORDER BY Pessoas.nome"
                Case 2
                    sql = "SELECT Pessoas.id as ID,nome as NOME, Pessoas.cnpj as CNPJ, Pessoas.telefone1 as TELEFONE FROM Pessoas WHERE tipo_pessoa_id = 2 AND nome LIKE '%' + @ParametroBusca + '%' ORDER BY nome"
                Case Else
                    sql = "SELECT Pessoas.id as ID,nome as NOME, Pessoas.nome_usuario as USUARIO, Pessoas.cargo as CARGO FROM Pessoas WHERE tipo_pessoa_id = 3 AND nome LIKE '%' + @ParametroBusca + '%' ORDER BY nome"
            End Select
        Else
            Select Case pTipoPessoa
                Case 1
                    sql = "SELECT Pessoas.id as ID,nome as NOME, Sangues.tipo as SANGUE, Pessoas.cpf as CPF, Pessoas.telefone1 as TELEFONE, Pessoas.data_nascimento as NASCIMENTO FROM Pessoas, Sangues WHERE tipo_pessoa_id = 1 AND Sangues.id = Pessoas.sangue_id  AND Pessoas.id = @ParametroBusca ORDER BY nome"
                Case 2
                    sql = "SELECT Pessoas.id as ID,nome as NOME, Pessoas.cnpj as CNPJ, Pessoas.telefone1 as TELEFONE FROM Pessoas WHERE tipo_pessoa_id = 2 AND Pessoas.id = @ParametroBusca ORDER BY nome"
                Case Else
                    sql = "SELECT Pessoas.id as ID,nome as NOME, Pessoas.nome_usuario as USUARIO, Pessoas.cargo as CARGO FROM Pessoas WHERE tipo_pessoa_id = 3 AND Pessoas.id = @ParametroBusca ORDER BY nome"
            End Select
        End If

        Dim Cmd As New SqlCommand(sql, Conexao)

        da.SelectCommand = Cmd
        Cmd.Parameters.Add(New SqlParameter("@ParametroBusca", pParametroBusca))
        da.Fill(ds, "Pessoas")


        Try
            Conexao.Open()
            Cmd.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
        End Try
        Return ds
        Conexao.Close()

    End Function
    Public Function BuscaRapida(ByVal pParametroBusca As String) As DataSet1
        'Objeto de Conexão---------------------------
        Dim Conexao As SqlConnection
        Conexao = New SqlConnection(StringConexao)
        '--------------------------------------------
        Dim ds As New DataSet1
        Dim da As SqlDataAdapter = New SqlDataAdapter
        Dim sql As String

        sql = "SELECT P.id as ID,P.nome as NOME,  T.tipo as TIPO FROM Pessoas P, Tipo_pessoas T WHERE P.tipo_pessoa_id = T.id AND P.nome LIKE '%' + @ParametroBusca + '%' ORDER BY P.nome"

        Dim Cmd As New SqlCommand(sql, Conexao)
        da.SelectCommand = Cmd
        Cmd.Parameters.Add(New SqlParameter("@ParametroBusca", pParametroBusca))
        da.Fill(ds, "Pessoas")

        Try
            Conexao.Open()
            Cmd.ExecuteNonQuery()
        Catch ex As Exception
            Conexao.Close()
        End Try
        Return ds
        Conexao.Close()
    End Function
    
#End Region
End Class