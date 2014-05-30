mc536socialNET
==============

INSTRUÇÕES DE USO:

Acessar http://sql2.lab.ic.unicamp.br/~ra103659/mc536/mc536socialNET/view/, teremos duas opções:
* Novo usuário.
	Aqui você adiciona um novo usuário normal

* Listar usuários
	Aqui você pode ver quais os usuários estão cadastrados e seus dados, e também pode editar as informações de qualquer usuário caso deseje.
	Também é possível remover qualquer usuário, bastando clicar na opção "remover" que fica à esquerda da tela.

INSTRUÇÕES PARA INSERIR DADOS PRÉ PROCESSADOS:

Inserir os arquivos .sql localizados na pasta Scripts em seu banco de dados MySQL na seguinte ordem:
- create_table.sql
- insert_persons.sql
- insert_knows.sql
- insert_likes.sql
- updateScrapedData.sql	// Contém as queries para complementar o BD, conseguidos atraves dos scripts
			// loadCitiesAndCountries.py e loadGenre.py
- artistsNoDuplicates.sql // Contém os dados do banco para usar os artistas sem duplicatas
- updateDuplicatedReferences.sql // Atualiza as referências dos artistas que estavam duplicados

INFORMAÇÕES SOBRE OS SCRIPTS DE EXTRAÇÃO DE DADOS:

Os dados dos artistas foram majoritariamente baixados da dbpedia.org utilizando como auxílio a biblioteca RDFlib.
Utilizou-se o endereço da wikipedia para localizar a "resource" de cada artista na DBpedia, extraindo entao todas
as informações possíveis de cada artista.

A estratégia de extração pela DBpedia segue da seguinte forma:
- Da página resource do artista, é possível tirar informações diretas, como nome (foaf:name) e ano de criação.
- Carregar RDFs de outras informações, como cidade natal (dbpedia-owl:hometown), e de lá extrair também o país da cidade
	(caso seja uma cidade).
- Carregar RDFs do gênero musical (dbpedia-owl:genre), pegando as informações e criando as queries.

Vale lembrar que a busca das informações no grafo foi obtida através de queries SPARQL, facilitando a extração.

* loadArtistsGraphFromInsertLikes.py
	Carrega os RDFs de todas as resources da dbpedia que fazem referencia aos Artistas no banco,
	salvando no arquivo artists.txt em formato turtle.

* loadCitiesAndCountries.py
	Carrega o grafo obtido pelo script acima, e faz pesquisas utilizando SPARQL, criando as queries
	para inserir as cidades e países, assim como atualizando os dados dos artistas.

* loadGenre.py
	Carrega o grafo obtido pelo script acima, e faz pesquisas utilizando SPARQL, criando as queries
	para inserir os generos, assim como marcando os generos de cada artista.
