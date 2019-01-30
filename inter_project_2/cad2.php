<title>UNIDOS - Projeto Universit&aacute;rio de Doa&ccedil;&atilde;o de Sangue</title>
<?php //daqui para baixo vai pegar os dados digitados nos campos pelo metodo post e atribuir as respectivas variaveis
$nome = $_POST["nome"];
$endereco = $_POST["endereco"];
$idade = $_POST["idade"];
$exames = $_POST["exames"];
$tiposangue = $_POST["tiposangue"];
$email = $_POST["email"];
$dataultima = $_POST["dataultima"];


$conexão = mysql_connect("localhost","root",""); //conecta ao bd
$sql = "select * from doadores where email = '$email'"; //seleciona no bd todos os registros com o email igual ao digitado (evitar duplicidade)
$db = mysql_select_db("inter"); //seleciona o bd
$res =  mysql_query($sql,$conexão); 
$y = mysql_fetch_array($res); //cria um array com para os resultados, se houverem
if ($y["email"] == $email) //SE o email digitado já existir, o erro de EMAIL JA CADASTRADO sera retornado pela pagina erro3.htm
	{ 
	include "erro3.htm";
	}
		else
	{              //SE o email cadastrado NAO EXISTIR NO BANCO, ele vai fazer um novo teste
	
			if ($tiposangue == "ab-" or $tiposangue =="ab+" or $tiposangue =="a-" or $tiposangue =="a+" or $tiposangue =="b+" or 
			$tiposangue =="b-" or $tiposangue =="o+" or $tiposangue =="o-")	//testa seo tipo sanguineo foi digitado corretamente
					{
							
							include "sucesso.php"; //se o tipo sanguineo foi digitado corretamente, ele faz o cadastro com sucesso
					}
			else
					{
							include "erro4.htm"; //senao ele retorna um novo erro.
					}
	}					
mysql_close($conexão); //encerra a conexao
?>
