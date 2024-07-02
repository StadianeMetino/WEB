<?php
include 'db.php';

$id = $_GET['id']; // Récupère l'ID à partir des paramètres GET de l'URL

// Requête SQL pour supprimer une ligne où l'ID correspond
$sql = "DELETE FROM utilisateurs WHERE id_etudiant = :id"; 
$stmt = $pdo->prepare($sql); 
$stmt->execute(['id' => $id]);

header('Location: liste_etudiants.html');
exit;
?>
