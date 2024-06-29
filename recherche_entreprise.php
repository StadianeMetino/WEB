<?php
require_once 'db.php'; 

// Récupérer les valeurs des champs de recherche
$nom = $_GET['nom'] ?? '';
$numSIRET = $_GET['numSIRET'] ?? '';

try {
    // Préparer la requête SQL avec des paramètres
    $sql = "SELECT * FROM entreprise WHERE Nom LIKE :nom AND NumSIRET LIKE :numSIRET";
    $stmt = $pdo->prepare($sql);

    // Lier les paramètres avec des valeurs sécurisées
    $stmt->execute([
        ':nom' => '%' . $nom . '%',
        ':numSIRET' => '%' . $numSIRET . '%'
    ]);

    // Collecter les résultats
    $entreprises = $stmt->fetchAll(PDO::FETCH_ASSOC);

} catch (PDOException $e) {
    die("Erreur de requête : " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Résultats de la Recherche d'Entreprises</title>
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
                <li><a href="gestion_entreprises.php">Gestion des Entreprises</a></li>
                <li><a href="liste_entreprises.php">Liste Entreprises</a></li>
                <li><a href="Logout.php">Deconnexion</a></li>
               
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Résultats de la Recherche d'Entreprises</h2>
            <table>
                <thead>
                    <tr>
                        <th>Num SIRET</th>
                        <th>Nom</th>
                        <th>Description</th>
                        <th>Nombre d'Internes</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($entreprises as $entreprise): //itérer sur chaque élément du tableau $entreprises. ?> 
                        <tr>
                            <td><?php echo htmlspecialchars($entreprise['NumSIRET']); ?></td> 
                            <td><?php echo htmlspecialchars($entreprise['Nom']); ?></td>
                            <td><?php echo htmlspecialchars($entreprise['Description']); ?></td>
                            <td><?php echo htmlspecialchars($entreprise['NbInterne']); ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Gestion des Stages. Tous droits réservés.</p>
    </footer>
</body>
</html>


