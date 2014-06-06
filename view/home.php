<div class="row">
	<div class="col-md-8 text-center">
	<div style="padding:0 10%">
	<h1 class="cover-heading">Bem vindo!</h1>
	<p class="lead">Este projeto foi desenvolvido para a avalia&ccedil;&atilde;o do curso de MC536 do primeiro semestre de 2014</p>
		<p class="lead">
			<a href="?page=person_new">Novo usu&aacute;rio</a>
		</p>
		<p class="lead">
			<a href="?page=person_list">Listar usu&aacute;rios</a>
		</p>
		<p class="lead">
			<a href="?page=artist_list">Listar artistas</a>
		</p>
		<p class="lead">
			<a href="./statistics.php">Estat&iacute;sticas</a>
		</p>
	</p>
	</div>
	</div>
	<div class="col-md-4" style="padding:0 5%">
		<p class="lead">
		<h4>LOGIN</h4>
		</p>
		<p class="lead">
		<form name="login" action="?page=login" method="post" role="form">
		  <div class="form-group">
			<input type="login" class="form-control" name="login" placeholder="Login">
		  </div>
		  <div class="form-group">
			<input type="password" class="form-control" name="password" placeholder="Password">
		  </div>
		  <button type="submit" class="btn btn-default">Enter</button>
		</form>
		</p>
		<p class="lead">
		<h4>NEW ACCOUNT</h4>
		</p>
		<p class="lead">
		<form name="person_new" action="?page=user_new" method="post" role="form">
		  <div class="form-group">
			<input type="text" class="form-control" name="login" placeholder="Desired login">
		  </div>
		  <div class="form-group">
			<input type="text" class="form-control" name="name" placeholder="Full Name">
		  </div>
		  <div class="form-group">
			<input type="text" class="form-control" name="hometown" placeholder="Hometown">
		  </div>
		  <div class="form-group">
			<input type="password" class="form-control" name="password" placeholder="Password">
		  </div>
		  <button type="submit" class="btn btn-default">Create</button>
		</form>
		</p>
	</div>
</div>