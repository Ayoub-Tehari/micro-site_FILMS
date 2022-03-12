<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="http://localhost/test/style2.css" />
        <title>Test OPIXIDO</title>
    </head>

    <body>

<?php
try
{
        // On se connecte à MySQL
        $mysqlClient = new PDO('mysql:host=localhost;dbname=test_opixido;charset=utf8', 'root', 'root',[PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);
}
catch(Exception $e)
{
        // En cas d'erreur, on affiche un message et on arrête tout
        die('Erreur : '.$e->getMessage());
}

// On récupère tout le contenu de la jointure entre lesPersonnes et lesRoles plus les films
$filmsReq = 'SELECT nom, prenom, titre, role, filmId FROM `lesPersonnes` natural join `LesRoles` natural join `LesFilms` where personneId=?';
$filmsDec = $mysqlClient->prepare($filmsReq);

$filmsDec->execute([$_GET['personneId']]);
$films = $filmsDec->fetchAll();
$first=1;
foreach ($films as $d){
    if ($first ===1){

    
?>

<h1> <?php echo $d['nom'] . ' ' . $d['prenom']; ?> </h1>
<?php
        $first = 0;
?>

        <table>
        <tr>
                <th>Titre</th>
                <th>role</th>
        </tr>

<?php
    }
?>

<?php
        $lien="http://localhost/test/#film_".$d['filmId'];
    ?>

        <tr>
                <td ><a href= "<?php echo $lien; ?> "> <?php echo $d['titre']; ?> </a> </td>
                <td ><?php echo $d['role']; ?></td>
        </tr>
            

<?php
}
?>
</table>

</body>
</html>
