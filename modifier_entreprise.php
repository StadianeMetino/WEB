<?php
// Vérifiez si le paramètre NumSIRET est défini
if (isset($_GET['NumSIRET'])) {
    $numSIRET = $_GET['NumSIRET'];

    include 'db.php'; 

    // Préparer la requête SQL pour récupérer les détails de l'entreprise
    $sql = "SELECT * FROM entreprise WHERE NumSIRET = :numSIRET";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':numSIRET', $numSIRET, PDO::PARAM_INT);
    $stmt->execute();
    $entreprise = $stmt->fetch(PDO::FETCH_ASSOC);

    
} else {
    die("NumSIRET manquant.");
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifier une Entreprise</title>
    <link rel="stylesheet" href="style_offres_stage.css">
</head>
<body>
    <header>
        <nav>
            <div class="image">
                <a href="#"><img src="./images/logo_Click_and_Stage.png" alt="Logo"></a>
            </div>
            <ul>
                <li><a href="acceuil.html">Accueil</a></li>
                <li><a href="gestion_entreprises.php">Gestion Entreprises</a></li>
                <li><a href="gestion_offres.html">Offres de Stage</a></li>
                <li><a href="gestion_candidatures.html">Candidatures</a></li>
                <li><a href="Logout.php">Deconnexion</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Modifier une Entreprise</h2>
            <div class="feature">
            <form action="update_entreprise.php" method="POST">
                <input type="hidden" name="num_siret" value="<?php echo htmlspecialchars($entreprise['NumSIRET']); ?>">
                <label for="nom">Nom:</label>
                <input type="text" id="nom" name="nom" value="<?php echo htmlspecialchars($entreprise['Nom']); ?>">
                <div>
                <label for="description">Description:</label>
                <textarea id="description" name="description"><?php echo htmlspecialchars($entreprise['Description']); ?></textarea>
                </div>
                <label for="nb_interne">Nombre d'Internes:</label>
                <input type="number" id="nb_interne" name="nb_interne" value="<?php echo htmlspecialchars($entreprise['NbInterne']); ?>">
                <div>
                <button type="submit">Mettre à jour</button>
                </div>
            </form>
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Gestion des Stages. Tous droits réservés.</p>
    </footer>
</body>
</html>
