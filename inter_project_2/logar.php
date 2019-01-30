<title>UNIDOS - Projeto Universit&aacute;rio de Doa&ccedil;&atilde;o de Sangue</title>
<?php
//esse codigo e para consultar no bd de ADMINS se o usuario e senha digitados estao cadastrados. Se estiverem o usuario loga no sistema, senao sera exibido uma pagina de erro.

$login = $_POST["login"];
$senha = $_POST["senha"];
$conexao = mysql_connect("localhost","root","");
$db = mysql_select_db("inter");
$sql = "select * from admin where usuario = '$login'";
$res =  mysql_query($sql,$conexao);
$y = mysql_fetch_array($res);
if ($y["senha"] == $senha) //condicao para senha correta/incorreta
	{ 
	include "index2.html";
		}
		else
	{
	
		include "erro.htm";
	}	
	mysql_close($conexao);
?>		


