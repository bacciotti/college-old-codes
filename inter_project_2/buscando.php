<?php
?>
<style type="text/css">
<!--
.style5 {font-size: 14px}
-->
</style>
<title>UNIDOS - Projeto Universit&aacute;rio de Doa&ccedil;&atilde;o de Sangue</title><div align="center">
  <table width="100%" border="0" align="center">
    <tr>
      <td width="38%"><div align="center"><img src="logo.gif" alt="" width="316" height="326" border="0" /></div></td>
      <td width="62%"><table width="44%" border="0" align="center">
        <tr>
          <td><div align="center"><a href="cadastro.php"><img src="b_cadast.gif" width="200" height="60" border="0" /><br />
                      <br />
          </a></div></td>
        </tr>
        <tr>
          <td><div align="right" class="style5">
            <div align="center">
              <p><a href="ultimasdoacoes.php"><img src="b_ultimas.gif" width="200" height="60" border="0" /></a></p>
            </div>
          </div></td>
        </tr>
        <tr>
          <td><div align="center"><strong><a href="quemsomos.htm"></a></strong>
                <form id="form2" name="form1" method="post" action="buscando.php">
                      <label><strong><br />
                        Buscar: </strong>
                      <input name="buscar" type="text" id="buscar" value="" size="50" />
                      <input type="submit" name="button2" id="button2" value="Submeter" />
                      <br />
                      </label>
                    </form>
          </div></td>
        </tr>
        <tr>
          <td><div align="center"><strong>Procurar Doador de Sangue Tipo:</strong></div></td>
        </tr>
        <tr>
          <td><div align="center"><a href="procurarabn.php"><img src="b_abn.gif" width="50" height="50" border="0" /></a> <a href="procurarabp.php"><img src="b_abp.gif" width="50" height="50" border="0" /></a> <a href="procurarbn.php"><img src="b_bn.gif" width="50" height="50" border="0" /></a> <a href="procurarbp.php"><img src="b_bp.gif" width="50" height="50" border="0" /></a> <a href="procurarap.php"><img src="b_ap.gif" width="50" height="50" border="0" /></a> <a href="procuraran.php"><img src="b_an.gif" width="50" height="50" border="0" /></a> <a href="procuraron.php"><img src="b_on.gif" width="50" height="50" border="0" /></a> <a href="procurarop.php"><img src="b_op.gif" width="50" height="50" border="0" /></a> <a href="listar.php"><img src="listar_todos.gif" width="100" height="50" border="0" /></a></div></td>
        </tr>
      </table></td>
    </tr>
  </table>
</div>
<p align="center">_____________________________________________________________________________________<br />
<?php
$conexão = mysql_connect("localhost","root","");    //conecta no bd
$db = mysql_select_db("inter"); //seleciona o bd
$buscar = $_POST["buscar"]; //pega o que esta escrito no campo de busca pelo metodo post
echo "<b><center>RESULTADOS DA BUSCA POR '$buscar'</b></center>";
$query = mysql_query("SELECT * FROM doadores where nome like '%" .$buscar. "%' OR email like '%" .$buscar. "%' OR endereco like '%" .$buscar. "%' 
OR tiposangue like '%" .$buscar. "%' OR idade like '%" .$buscar. "%' OR exames like '%" .$buscar. "%'  OR dataultima like '%" .$buscar. "%' "); //faz a consulta ao bd por SQL
$contagem = mysql_num_rows($query); //identifica o numero de linhas do bd que atende a solicitacao acima
if ($contagem == 0)  //se o numero de linhas for zero nao tem resultados na busca
{
echo "Nao foram encontrados registros com esses parametros";
exit();
}
else{ //senao for 0 ira começar a exibir os resultados pelo FOR
while ($doadores= mysql_fetch_array($query)){ //aqui cria um array de dados para os resultados serem exibidos

$data = $doadores['dataultima']; //armazena na variavel $data o conteudo da variavel $doadores na posicao dataultima do BD
$dat = explode("-",$data); //divide a data no caracter '-' para transforma-la em formato brasileiro
$data2 = $dat[2]."/".$dat[1]."/".$dat[0];  //cria um array para a data e converte para o formato brasileiro
$email = $doadores['email']; //armazena na variavel $email o conteudo da variavel $doadores na posicao email do BD
echo"<br>"; //daqui para baixo começa a exibir os resultados (quantos tanto for o tamanho do array)
echo " <b>Nome:</b> ".$doadores['nome']." <br>"; 
echo " <b>Endereco: </b>".$doadores['endereco']." <br>"; 
echo " <b>Idade: </b>".$doadores['idade']."<br>"; 
echo " <b>Email: </b>".$doadores['email']." <br>"; 
echo " <b>Tipo de Sangue: </b>".$doadores['tiposangue']."<br> "; 
echo " <b>Exames Realizados: </b>".$doadores['exames']."<br> "; 
echo " <b>Data da Ultima Doacao: </b>".$data2."<br> "; 
echo "<a href='email.php?email=$email'>Enviar
email para solicitar nova doação</a><br>";
echo "<a href='excluir.php?email=$email'>Excluir cadastro</a></br>"; 
echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-<br></br>";
			}
	}
?>