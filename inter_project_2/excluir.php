<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>UNIDOS - Projeto Universitário de Doação de Sangue</title>
<style type="text/css">
<!--
.style5 {font-size: 14px}
-->
</style>
</head>

<body>
<div align="center">
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
<p align="center">_____________________________________________________________________________________</p>
<p align="center"><strong>CADASTRO EXCLUÍDO COM SUCESSO!</strong>
  <?php
$email = $_GET["email"]; //pega o email pelo metodo get
$conexao = mysql_connect("localhost","root",""); //conecta ao banco
$db = mysql_select_db("inter"); //seleciona o bd
$sql = "delete from doadores where email= '$email'"; //deleta os registros que estiverem no campo email o email pego pelo metodo GET (vai ser so um pois no cadastro evitou a duplicidade de emails)
$x = mysql_query($sql, $conexao);
mysql_close($conexao);
?>
</p>
</body>

</html>

