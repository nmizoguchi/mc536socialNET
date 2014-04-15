<?php
	function httpDelete($id) {
	
		$con = mysql_connect("localhost:3306","mc536user07", "euzaraef") or die(mysql_error());
		$selected = mysql_select_db("mc536db07", $con);
		
		// NOW DELETE CORRECTLY
		$sql = "DELETE from Person where id=".$id;
		$result = mysql_query($sql,$con);
		if($result)
			return true;
		return false;
	}
	if(isset($_GET['id'])) {
		$id = $_GET['id'];
		if(httpDelete($id)) {
			echo "USUARIO REMOVIDO COM SUCESSO!<br><a href='./person_list.php'>Voltar</a>";
			exit();
		} else {
			echo "OCORREU UM ERRO!<br><a href='./person_list.php'>Voltar</a>";
		}
	} else {
		echo "OPERACAO INVALIDA!<br><a href='./person_list.php'>Voltar</a>";
	}
?>
