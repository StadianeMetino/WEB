<?php
include 'db.php';

// Vérifie si la méthode est 'GET'
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    
    $numSIRET = $_GET['NumSIRET'];

    // Prépare une requête SQL pour supprimer l'entreprise correspondant au 'NumSIRET'
    $stmt = $pdo->prepare('DELETE FROM entreprise WHERE NumSIRET = ?');
    $stmt->execute([$numSIRET]);

    header('Location: liste_entreprises.php');
    exit;
} 
?>

