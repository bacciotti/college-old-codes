Imports System.Data.OleDb

Partial Class CadastroFuncionario
    Inherits System.Web.UI.Page

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        'Criando e instanciando um novo objeto do tipo Funcionario 
        'para iniciar o processo de gravacao no BD
        Dim Func As Funcionario
        Func = New Funcionario

        'Definindo os atributos com os valores dos textbox
        'OBS.: Em alguns atributos nota-se uma concatenacao de um caracter em branco
        'Motivo: estava dando um erro de campo NULO na hora de gravar no banco quando
        'deixava alguns campos sem preencher.
        'A concatenacao vai evitar que va campos NULOS. Pode ir EM BRANCO, mas NULOS nao.

        Func.Nome = txtNomeCompletoFunc.Text
        Func.NomeUsuario = txtNomeUsuario.Text
        Func.RG = txtRGFunc.Text & " "
        Func.Senha = txtSenha.Text
        Func.telefone = txtTelefoneFunc.Text
        Func.Datanasc = txtDataNascFunc.Text
        Func.cargo = txtCargoFunc.Text & " "
        Func.Celular = txtCelularFunc.Text & " "
        Func.CEP = txtCEPFunc.Text
        Func.CPF = txtCPFFunc.Text
        Func.telefone = txtTelefoneFunc.Text
        Func.Email = txtEmailFunc.Text & " "
        Func.Endereco = txtEnderecoFunc.Text & " "

        'Trata a excecao chama o metodo que grava no banco de dados
        Func.GravarDados()
        'Redireciona para a pagina "Cadastro Realizado com Sucesso!"
        Response.Redirect("~/CadastroSucesso.aspx")
        'Chama o metodo que limpa os textbox
        LimparCampos()

    End Sub
    Private Sub LimparCampos()
        txtNomeCompletoFunc.Text = ""
        txtDataNascFunc.Text = ""
        txtCPFFunc.Text = ""
        txtRGFunc.Text = ""
        txtEnderecoFunc.Text = ""
        txtCEPFunc.Text = ""
        txtEmailFunc.Text = ""
        txtCelularFunc.Text = ""
        txtTelefoneFunc.Text = ""
        txtCargoFunc.Text = ""
        txtNomeUsuario.Text = ""
        txtSenha.Text = ""
    End Sub
    Protected Sub btnLimpar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLimpar.Click
        LimparCampos()
    End Sub
End Class
