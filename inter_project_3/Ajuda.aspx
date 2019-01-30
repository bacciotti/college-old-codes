<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Ajuda.aspx.vb" Inherits="Ajuda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Ajuda"></asp:Label>
    <br />
    <br />
    <strong>SOBRE O MENU<br />
    </strong>
    <span class="style6"><strong>Início
    <br />
    </strong>Página inicial do sistema<br />
    <strong>Doações<br />
    </strong>Listagem das últimas doações. Você pode ordenar a tabela clicando no 
    título de cada coluna.<strong><br />
    Voluntários<br />
    </strong>Listagem dos voluntários. Você pode ordenar a tabela clicando no título 
    de cada coluna.<br />
    Se o campo DOADOR estiver marcado indica que o Voluntário já doou alguma vez.<br />
    <strong>-Cadastro de Voluntários<br />
    </strong>Página para cadastrar novos voluntários. Atenção aos campos 
    obrigatórios!<strong><br />
    Funcionários<br />
    </strong>Listagem dos voluntários. Você pode ordenar a tabela clicando no título 
    de cada coluna.<strong><br />
    -Cadastro de Funcionários<br />
    </strong>Página para cadastrar novos funcionários. Atenção na criação do nome de 
    usuário e senha.<strong><br />
    Banco de Sangue<br />
    </strong>Lista os tipos sanguíneos, a quantidade de litros existente no banco e 
    a quantidade de voluntários cadastrados com aquele tipo de sangue.<strong><br />
    - Retiradas<br />
    </strong>No menu retiradsa são feitas as saídas de sangue do banco para 
    Hospitais, Clínicas etc. O sistema vai controlar o banco para não haver 
    quantidade negativa.<strong><br />
    Estabelecimento<br />
    </strong>Página onde se cadastra o local de trabalho e seus dados. É dessa 
    página que saem os dados que aparecem na correspondência.<strong><br />
    <br />
    FAQ<br />
    Não consigo imprimir. O que pode ser?<br />
    R: </strong>Verifique se sua impressora está ligada e corretamente instalada no 
    computador, e também se tem papel. <strong>
    <br />
    <br />
    Quando tento acessar aparece uma mensagem: &quot;Servidor não encontrado&quot; ou &quot;Página 
    não encontrada&quot;. O que fazer?<br />
    R: </strong>Verifique sua conexão com a internet.<strong><br />
    <br />
    Esqueci minha senha. O que fazer?<br />
    R: </strong>Neste caso a única solução é excluir o cadastro do funcionário e 
    cadastrar de novo.<strong><br />
    <br />
    Por que não posso excluir cadastros de voluntários?<br />
    R:</strong> Por que a exclusão do vonluntário pode desencadear falhas nas 
    relações das informações. Existem muitas funções atreladas ao voluntário, como a 
    doação. Se excluído pode deixar espaços &quot;vazios&quot; no programa.<br />
    <br />
    <strong>O que é aquela &quot; caixinha&quot; no campo Doador da listagem de voluntários?<br />
    R:</strong> Aquela caixinha indica se o voluntário já doou alguma vez ou nunca 
    fez doação. Se estiver marcada significa que o voluntário é doador. Senão indica 
    que o voluntário não é doador [ainda].<br />
    </span>
</asp:Content>

