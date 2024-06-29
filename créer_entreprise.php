<?php
require_once 'db.php'; 

// Récupérer les données du formulaire
$nomEntreprise = $_POST['nom_entreprise'] ?? '';
$numSIRET = $_POST['num_siret'] ?? '';
$description = $_POST['description'] ?? '';
$nbInterne = $_POST['nb_interne'] ?? 0;

try {
    // Préparer la requête SQL d'insertion
    $sql = "INSERT INTO entreprise (NumSIRET, Nom, Description, NbInterne) VALUES (:numSIRET, :nomEntreprise, :description, :nbInterne)";
    $stmt = $pdo->prepare($sql);

    // Binder // lier des valeurs aux paramètres de la requête.
    $stmt->bindParam(':numSIRET', $numSIRET);
    $stmt->bindParam(':nomEntreprise', $nomEntreprise);
    $stmt->bindParam(':description', $description);
    $stmt->bindParam(':nbInterne', $nbInterne);

    // Exécuter la requête
    $stmt->execute();

    // Redirection vers la liste des entreprises
    header('Location: liste_entreprises.php');

   
} catch (PDOException $e) {
    die("Erreur lors de la création de l'entreprise : " . $e->getMessage());
}
?>
