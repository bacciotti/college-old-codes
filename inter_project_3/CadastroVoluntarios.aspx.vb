Imports System.Data.OleDb

Partial Class CadastroPaciente
    Inherits System.Web.UI.Page
    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        'Criando e instanciando um novo objeto do tipo Funcionario 
        'para iniciar o processo de gravacao no BD
        Dim Vol As Voluntario
        Vol = New Voluntario

        'Definindo os atributos com os valores dos textbox
        'OBS.: Em alguns atributos nota-se uma concatenacao de um caracter em branco
        'Motivo: estava dando um erro de campo NULO na hora de gravar no banco quando
        'deixava alguns campos sem preencher.
        'A concatenacao vai evitar que va campos NULOS. Pode ir EM BRANCO, mas NULOS nao.

        Vol.NomeCompleto = txtNomeCompleto.Text
        Vol.DataNasc = txtDataNasc.Text
        Vol.CPF = txtCPF.Text & " "
        Vol.RG = txtRG.Text & " "
        Vol.Endereco = txtEndereco.Text & " "
        Vol.Cidade = txtCidade.Text & " "
        Vol.Estado = txtEstado.Text & " "
        Vol.Email = txtEmail.Text & " "
        Vol.Celular = txtCelular.Text & " "
        Vol.telefone = txtTelefone.Text & " "
        Vol.TipoSangue = ddTipoSangue.SelectedItem.Text
        Vol.Patologias = txtPatologias.Text & " "
        Vol.CEP = txtCEP.Text & " "
        Vol.Obs = txtObs.Text & " "
        Vol.Exames = txtExames.Text & " "
        'Chama o metodo que grava no banco de dados
        Vol.GravarDados()
        'Redireciona para a pagina "Cadastro Realizado com Sucesso!"
        Response.Redirect("~/CadastroSucesso.aspx")
        'Chama o metodo que limpa os textbox
        LimparCampos()
    End Sub
    Private Sub LimparCampos()
        txtNomeCompleto.Text = ""
        txtDataNasc.Text = ""
        txtCPF.Text = ""
        txtRG.Text = ""
        txtEndereco.Text = ""
        txtCidade.Text = ""
        txtEstado.Text = ""
        txtCEP.Text = ""
        txtEmail.Text = ""
        txtCelular.Text = ""
        txtTelefone.Text = ""
        txtPatologias.Text = ""
        txtObs.Text = ""
        txtExames.Text = ""
    End Sub
    Protected Sub btnLimpar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLimpar.Click
        LimparCampos()
    End Sub

End Class
