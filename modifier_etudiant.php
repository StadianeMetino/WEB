<?php
include 'db.php';

$id = $_GET['id'];
$sql = "SELECT * FROM utilisateurs WHERE id_etudiant = :id";
$stmt = $pdo->prepare($sql);
$stmt->execute(['id' => $id]);
$etudiant = $stmt->fetch(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nom = $_POST['nom'];
    $prenom = $_POST['prenom'];
    $email = $_POST['email'];
    $id_PromoAnnee = $_POST['id_PromoAnnee'];

    $sql = "UPDATE utilisateurs SET Nom = :nom, Prenom = :prenom, Email = :email, id_PromoAnnee = :id_PromoAnnee WHERE id_etudiant = :id";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['nom' => $nom, 'prenom' => $prenom, 'email' => $email, 'id_PromoAnnee' => $id_PromoAnnee, 'id' => $id]);

    header('Location: liste_etudiants.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier Étudiant</title>
    <link rel="stylesheet" href="style_offres_stage.css">
</head>
<body>
    <header>
        <nav>
            <div class="image">
                <a href="#"><img src="./images/logo_Click_and_Stage.png"></a>
            </div>
            <ul>
                <li><a href="acceuil.html">Accueil</a></li>
                <li><a href="gestion_etudiants.html">Gestion Étudiants</a></li>
                <li><a href="Logout.php">Deconnexion</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Modifier Étudiant</h2>
            <form action="modifier_etudiant.php?id=<?php echo $id; ?>" method="POST">
                <label for="nom">Nom:</label>
                <input type="text" id="nom" name="nom" value="<?php echo htmlspecialchars($etudiant['Nom']); ?>">
                <label for="prenom">Prénom:</label>
                <input type="text" id="prenom" name="prenom" value="<?php echo htmlspecialchars($etudiant['Prenom']); ?>">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($etudiant['Email']); ?>">
                <label for="id_PromoAnnee">Promotion:</label>
                <input type="number" id="id_PromoAnnee" name="id_PromoAnnee" value="<?php echo htmlspecialchars($etudiant['id_PromoAnnee']); ?>">
                <button type="submit">Mettre à jour</button>
            </form>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Gestion des Stages. Tous droits réservés.</p>
    </footer>
</body>
</html>
