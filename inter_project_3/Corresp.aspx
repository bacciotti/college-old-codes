<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Corresp.aspx.vb" Inherits="Corresp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: small;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        ------------------------------------------------------------------------------------------------------------------<br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
            Text="DESTINATÁRIO"></asp:Label>
        <br />
        <asp:Label ID="lblNome" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
        <br />
        <asp:Label ID="lblEndereco" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
        <br />
        <asp:Label ID="lblCidade" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
&nbsp;-
        <asp:Label ID="lblEstado" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
        &nbsp;-
        <asp:Label ID="lblCEP" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
        <br />
        ------------------------------------------------------------------------------------------------------------------</p>
    <div>
    
        <asp:Image ID="Image1" runat="server" Height="39px" 
            ImageUrl="~/img/Inter_cabe.jpg" Width="374px" />
        <br />
        Olá
        <asp:Label ID="lblNomeCorresp" runat="server" Font-Bold="True" 
            Font-Size="Large"></asp:Label>
        , tudo&nbsp; bem?<br />
        Esperamos que sim.<br />
        Estamos entrando em contato com você para fazer um convite muito 
        especial!<br />
        Milhares de pessoas estão precisando de você nesse exato momento, e achamos que 
        a hora é agora para você vir nos fazer uma visita.<br />
        Venha fazer uma doação de sangue junto ao nosso Banco de Sangue. Chame sua 
        família e amigos para vir também.<br />
        A doação de sangue é um gesto de solidariedade, um ato voluntário e altruísta. 
        Com a sua doação você está ajudando a salvar vidas de várias pessoas.É muito 
        segura, higiênica e indolor. <br />
        <br />
        Algumas dúvidas que podem surgir enquanto você lê essa correspondência:<br />
        <br />
        <strong><span class="style1">- Doar sangue engrossa ou afina o sangue?</span></strong><br 
            class="style1" />
        <span class="style1">&nbsp;Não engrossa nem afina o sangue, é apenas um mito.
        </span>
        <br class="style1" />
        <strong><span class="style1">- É preciso algum documento de identidade? </span> </strong>
        <br class="style1" />
        <span class="style1">Sim. O candidato deve apresentar documento original com foto, expedido pelo 
        órgão oficial. </span><br class="style1" />
        <strong><span class="style1">&nbsp;- A mulher pode doar sangue durante o período menstrual? 
        </span> </strong>
        <br class="style1" />
        <span class="style1">Sim. 
        </span> 
        <br class="style1" />
        <strong><span class="style1">- O uso de medicamento pode impedir alguém de doar? 
        </span> </strong>
        <br class="style1" />
        <span class="style1">O uso de medicamento deve ser analisado caso a caso. Portanto, antes de doar 
        consulte o Serviço de Hemoterapia.
        </span>
        <br class="style1" />
        <strong><span class="style1">- Quanto tempo leva para o organismo repor o sangue doador? 
        </span> </strong>
        <br class="style1" />
        <span class="style1">O organismo repõe o volume de sangue doado nas primeiras 24 horas após a doação.
        </span>
        <br class="style1" />
        <strong><span class="style1">&nbsp;- Grávidas podem doar sangue? </span> </strong>
        <br class="style1" />
        <span class="style1">Não. Mas se o parto for normal, a mulher pode doar depois de três meses. Em caso 
        de cesariana, após seis meses. Se estiver amamentando, aguardar 12 meses após o 
        parto. 
        </span> 
        <br class="style1" />
        <strong><span class="style1">&nbsp;- Quem está gripado pode doar sangue?</span></strong><br 
            class="style1" />
        <span class="style1">&nbsp;Recomenda-se aguardar sete dias após a cura para poder doar.
        </span>
        <br class="style1" />
        <strong><span class="style1">- Quem tem diabete pode doar sangue? </span> </strong>
        <br class="style1" />
        <span class="style1">Se a pessoa que tenha diabetes estiver controlando apenas 
        com alimentação ou hipoglicemiantes orais e não apresente alterações vasculares, 
        poderá doar. Caso ela tenha utilizado insulina uma única vez, não poderá doar.</span><br />
        <br />
        Nosso banco de sangue se encontra no endereço abaixo:<br />
        <asp:Label ID="lblNomeEst" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <asp:Label ID="lblEndEst" runat="server" Font-Bold="True"></asp:Label>
        &nbsp;-
        <asp:Label ID="lblCidEst" runat="server" Font-Bold="True"></asp:Label>
&nbsp;-
        <asp:Label ID="lblUFEst" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <asp:Label ID="lblCEPEst" runat="server" Font-Bold="True"></asp:Label>
        <br />
        <br />
        Doar sangue pode parecer algo comum, mas não é. No Brasil, menos de 2% da 
        população doa sangue anualmente. Este número é inferior à recomendação da 
        Organização Mundial da Saúde, segundo a qual as doações devem ser feitas por 
        pelo menos 5% da população do país. Em apenas uma doação, você pode salvar até 
        quatro vidas. Doar sangue é um ato seguro, não vicia, não engorda, nem emagrece. 
        Quem doa uma vez não é obrigado a doar sempre.<br />
        <br />
        Muitas vidas estão correndo nas suas veias.
        Venha!<br />
        <asp:Image ID="Image2" runat="server" Height="25px" 
            ImageUrl="~/img/Inter_roda.jpg" Width="567px" />
    </div>
    </form>
</body>
</html>
