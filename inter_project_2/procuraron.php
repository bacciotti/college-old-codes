<title>UNIDOS - Projeto Universit&aacute;rio de Doa&ccedil;&atilde;o de Sangue</title><?php
$tiposangue = "o-";//vai buscar todos os registros que tem esse sangue como 'tiposangue'
//fazendo a conexao com o bd
$conexão = mysql_connect("localhost","root","");
$db = mysql_select_db("inter");
//instrucao SQL que vai buscar todos os regitros com o tipo de sangue requerido
$sql = "select * from doadores where tiposangue = '$tiposangue'";
//implementa a instrucao
$res =  mysql_query($sql,$conexão);
//faz o array para exibir os resultados
$y = mysql_fetch_array($res);

//faz o teste para exibir todos se existirem
if ($y["tiposangue"] == $tiposangue)
	{ 
		$endereco = $y["endereco"];
		$nome  = $y["nome"];
		$email = $y["email"];
		$idade  = $y["idade"];
		$dataultima = $y["dataultima"];
		$exames  = $y["exames"];
		include "consulta.php";
	}
		else
	{
		//se nao existir nenhum registro o erro de NADA ENCONTRADO sera retornado
		include "erro2.htm";
	}	
mysql_close($conexão);
?>




