<?php
require_once 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") { //form soumis
    $email = $_POST['Email'];
    $password = $_POST['Mot_de_passe']; //récuper les valeurs entrée

    echo "$email - $password", "<br>";

    try {
        // Préparer la requête SQL pour sélectionner l'utilisateur avec l'email entré
        $stmt = $pdo->prepare("SELECT * FROM utilisateurs WHERE Email = ? ");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC); //Récupérer le résultat de la requête sous forme de tableau associatif
         
        if ($user) {
            // Récupérer le mot de passe haché depuis la base de données
            $hashed_password = $user['Mot_de_passe'];
             
            echo "Mot de passe haché depuis la BDD : " . $hashed_password . "<br>";

            if ($password === $hashed_password) {//vérification du mdp
                header("Location: Acceuil.html");
                
            } else {
                echo "Mot de passe incorrect " ;
            }
        } else {
            echo "Utilisateur non trouvé avec ce email.";
        }
    } catch (PDOException $e) {
        die("Erreur de connexion : " . $e->getMessage());
    } 
}
?>

    
