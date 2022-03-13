<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" href="style2.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@700&display=swap" rel="stylesheet">
        <title>Test OPIXIDO</title>
    </head>

    <body>
            <img src="http://localhost/test/logo3.jpg" class="logo" width ="10%" />
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


// Si tout va bien, on peut continuer

// On récupère tout le contenu de la table lesFilms
$filmsReq = 'SELECT * FROM lesFilms';
$filmsDec = $mysqlClient->prepare($filmsReq);
$filmsDec->execute();
$films = $filmsDec->fetchAll();

?>

<h1>Les films disponibles :</h1>
<ul>

<?php

$personnesReq = 'SELECT nom, prenom, role, personneId FROM `LesFilms` NATURAL JOIN `lespersonnes` NATURAL JOIN `lesroles` WHERE filmId = :filmId ORDER BY role';
$personnesDec = $mysqlClient->prepare($personnesReq);

// On affiche chaque film un par un
foreach ($films as $film) {
       
        $personnesDec->execute(['filmId' => $film['filmId'],]);
        $personnes = $personnesDec->fetchAll();
       
?>
        <li id="<?php echo "film_". $film['filmId']; ?>" >

                <h2><?php echo $film['titre']; ?></h2>
                <h3><?php echo $film['annee']; ?></h3>        

                <table>
                        <tr>
                                <th>nom</th>
                                <th>role</th>
                        </tr>
<?php
                        foreach ($personnes as $personne){
                                $lien="personne.php/?personneId=".$personne['personneId'];
?>

                                <tr>
                                        <td ><a href= "<?php echo $lien; ?> "> <?php echo $personne['nom']. " " . $personne['prenom']; ?> </a> </td>
                                        <td ><?php echo $personne['role']; ?></td>
                                </tr>

<?php
                        }
?>                           
                </table>
                <p><?php echo $film['description']; ?></p>
        </li>
<?php
}
?>
</ul>
</body>
</html>