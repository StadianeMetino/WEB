<?php
include 'db.php';

// Requête pour récupérer tous les étudiants de la base de données
$sql = "SELECT * FROM utilisateurs WHERE Status = 'etudiant'";
$stmt = $pdo->prepare($sql);
$stmt->execute();
$etudiants = $stmt->fetchAll(PDO::FETCH_ASSOC); //récupère toutes les lignes
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Étudiants</title>
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
                <li><a href="gestion_offres.html">Offres de Stage</a></li>
                <li><a href="Logout.php">Deconnexion</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Liste des Étudiants</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Email</th>
                        <th>Promotion</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($etudiants as $etudiant): ?>
                        <tr>
                            <td><?php echo htmlspecialchars($etudiant['id_etudiant']); ?></td>
                            <td><?php echo htmlspecialchars($etudiant['Nom']); ?></td>
                            <td><?php echo htmlspecialchars($etudiant['Prenom']); ?></td>
                            <td><?php echo htmlspecialchars($etudiant['Email']); ?></td>
                            <td><?php echo htmlspecialchars($etudiant['id_PromoAnnee']); ?></td>
                            <td>
                                <a href="modifier_etudiant.php?id=<?php echo $etudiant['id_etudiant']; ?>">Modifier</a>
                                <a href="supprimer_etudiant.php?id=<?php echo $etudiant['id_etudiant']; ?>">Supprimer</a>
                            </td>
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
