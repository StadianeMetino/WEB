<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Entreprises</title>
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
                <li><a href="liste_entreprises.php">Liste Entreprises</a></li>
                <li><a href="gestion_offres.html">Offres de Stage</a></li>
                <li><a href="Logout.php">Deconnexion</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Gestion des Entreprises</h2>
            <div class="feature">
                <h3>Recherche d'Entreprises</h3>
                <form action="recherche_entreprise.php" method="GET">
                <div>
                    <label for="nom">Nom:</label>
                    <input type="text" id="nom" name="nom">
                </div>
                    <label for="numSIRET">Num SIRET:</label>
                    <input type="text" id="numSIRET" name="numSIRET">
                    <div>
                    <button type="submit">Rechercher</button>
                    </div>
                </form>
            </div>
            <div class="feature">
                <h3>Créer une Entreprise</h3>
                <form action="créer_entreprise.php" method="POST">
                    <label for="nom_entreprise">Nom de l'entreprise:</label>
                    <input type="text" id="nom_entreprise" name="nom_entreprise" required>
                    <div>
                    <label for="num_siret">Numéro SIRET:</label>
                    <input type="text" id="num_siret" name="num_siret" required>
                    </div>
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" rows="4" required></textarea>
                    <div>
                    <label for="nb_interne">Nombre d'internes:</label>
                    <input type="number" id="nb_interne" name="nb_interne" required>
                </div>
                    <button type="submit">Créer</button>
                </form>
            </div>
            
            <div class="feature">
                <h3>Évaluer une Entreprise</h3>
                
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Gestion des Stages. Tous droits réservés.</p>
    </footer>
</body>
</html>
