<!DOCTYPE html>

<head>
    <style>
        .content {
            max-width: 500px;
            margin: auto;
        }
    </style>
</head>

<html>

<body>
    <div class="content">
        <h1>Bibliófilo's</h1>
        <h2>Livros</h2>

        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        $titulo = 'titulo';
        $autor = 'autor';
        $classificacao = 'classificacao';
        $editora = 'editora';
        $ano = 'ano';
        $edicao = 'edicao';

        /*TODO-1: Adicione uma variavel para cada coluna */
 
        $sql = "SELECT $titulo, $autor, $classificacao, $editora, $ano, $edicao FROM Livros";    

        /*TODO-2: Adicione cada variavel a consulta abaixo */
             

        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }

        /* TODO-3: Adicione as variaveis ao cabeçalho da tabela */

        $cabecalho ="
            <table>
                <tr> 
                    <th> $titulo </th>
                    <th> $autor </th>
                    <th> $classificacao </th>
                    <th> $editora </th>
                    <th> $ano </th>
                    <th> $edicao </th>
                </tr>";

        echo $cabecalho;

        /* TODO-4: Adicione a tabela os novos registros. */

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo "
                    <tr>
                    <td> $registro[$titulo] </td>
                    <td> $registro[$autor] </td>
                    <td> $registro[$classificacao]</td>
                    <td> $registro[$editora]</td>
                    <td> $registro[$ano]</td>
                    <td> $registro[$edicao]</td>
                    </tr>";
            }
        } 
        echo '</table>';
        FecharConexao($conexao);
        ?>
    </div>
</body>

</html>