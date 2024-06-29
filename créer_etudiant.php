<?php
include 'db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $nom = $_POST['nom'];
    $prenom = $_POST['prenom'];
    $email = $_POST['email'];
    $mot_de_passe = $_POST['mot_de_passe'];  // Récupérer le mot de passe depuis le formulaire
    $mot_de_passe_hash = password_hash($mot_de_passe, PASSWORD_DEFAULT);

    $id_PromoAnnee = $_POST['id_PromoAnnee'];

    // Préparation de la requête SQL pour insérer l'étudiant
    $sql = "INSERT INTO utilisateurs (Nom, Prenom, Status, Email, Mot_de_passe, id_PromoAnnee) VALUES (:nom, :prenom, 'etudiant', :email, :mot_de_passe, :id_PromoAnnee)";
    $stmt = $pdo->prepare($sql);
    $stmt->execute(['nom' => $nom, 'prenom' => $prenom, 'email' => $email, 'mot_de_passe' => $mot_de_passe, 'id_PromoAnnee' => $id_PromoAnnee]);

    // Redirection vers la liste des étudiants après l'ajout
    header('Location: liste_etudiants.php');
    exit;
}
?>
