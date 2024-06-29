<?php
include 'db.php';

$id = $_GET['id']; // Récupère l'ID à partir des paramètres GET de l'URL

$sql = "DELETE FROM utilisateurs WHERE id_etudiant = :id"; // Requête SQL pour supprimer une ligne où l'ID correspond
$stmt = $pdo->prepare($sql); 
$stmt->execute(['id' => $id]);

header('Location: gestion_etudiants.html');
exit;
?>
