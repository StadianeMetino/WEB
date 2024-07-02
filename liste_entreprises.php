<?php
require_once 'db.php'; 

// Requête pour sélectionner toutes les entreprises
$sql = "SELECT * FROM entreprise";
try {
    $stmt = $pdo->query($sql); // Exécute la requête
    $entreprises = $stmt->fetchAll(PDO::FETCH_ASSOC); // Récupère toutes les lignes
} catch (PDOException $e) {
    die("Erreur de requête : " . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Entreprises</title>
    <link rel="stylesheet" href="style_offres_stage.css">
</head>
<body>
    <header>
        <nav>
            <div class="image">
                <a href="#"><img src="./images/logo_Click_and_Stage.png" alt="Logo"></a>
            </div>
            <ul>
                <li><a href="acceuil.html">Acceuil</a></li>
                <li><a href="gestion_entreprises.php">Gestion Entreprises</a></li>
                <li><a href="gestion_offres.html">Offres de Stage</a></li>
                <li><a href="gestion_candidatures.html">Candidatures</a></li>
                <li><a href="Logout.php">Deconnexion</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Liste des Entreprises</h2>
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
                    <?php
                   //si la variable $entreprises contient des données
                    if ($entreprises) {
                        foreach ($entreprises as $entreprise) {
                            echo "<tr>";
                            echo "<td>" . htmlspecialchars($entreprise['NumSIRET']) . "</td>";
                            // htmlspecialchars est utilisé pour éviter les problèmes de sécurité liés aux caractères spéciaux
                            echo "<td>" . htmlspecialchars($entreprise['Nom']) . "</td>";
                            echo "<td>" . htmlspecialchars($entreprise['Description']) . "</td>";
                            echo "<td>" . htmlspecialchars($entreprise['NbInterne']) . "</td>";
                            echo "<td><a href='modifier_entreprise.php?NumSIRET=" . htmlspecialchars($entreprise['NumSIRET']) . "'>Modifier</a></td>";
                            echo "<td><a href='supprimer_entreprise.php?NumSIRET=" . htmlspecialchars($entreprise['NumSIRET']) . "'>Supprimer</a></td>";
                            echo "</tr>";                            
                        }
                    }
                     else {
                       
                        echo "<tr><td colspan='4'>Aucune entreprise trouvée</td></tr>";
                    }

                    ?>
                </tbody>
            </table>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Gestion des Stages. Tous droits réservés.</p>
    </footer>
</body>
</html>
