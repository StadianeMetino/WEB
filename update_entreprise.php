<?php
include 'db.php'; 

// Récupérer les données du formulaire
$numSIRET = $_POST['num_siret'];
$nom = $_POST['nom'];
$description = $_POST['description'];
$nbInterne = $_POST['nb_interne'];

echo "NumSIRET: $numSIRET<br>";
echo "Nom: $nom<br>";
echo "Description: $description<br>";
echo "Nombre d'Internes: $nbInterne<br>";

try {
    // Préparer la requête SQL de mise à jour
    $sql = "UPDATE entreprise SET Nom = :nom, Description = :description, NbInterne = :nbInterne WHERE NumSIRET = :numSIRET";
    $stmt = $pdo->prepare($sql);

    // Binder les valeurs
    $stmt->bindParam(':nom', $nom);
    $stmt->bindParam(':description', $description);
    $stmt->bindParam(':nbInterne', $nbInterne);
    $stmt->bindParam(':numSIRET', $numSIRET, PDO::PARAM_INT);

    // Exécuter la requête
    $stmt->execute();

    // Redirection vers la liste des entreprises
    header('Location: liste_entreprises.php');
    exit();
} catch (PDOException $e) {
    die("Erreur lors de la mise à jour de l'entreprise : " . $e->getMessage());
}
?>
