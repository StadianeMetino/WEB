<?php
require_once 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['Email'];
    
    try {
        $stmt = $pdo->prepare("SELECT * FROM utilisateurs WHERE Email = ?");
        $stmt->execute([$email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($user) {
            // Générer un nouveau mot de passe ou envoyer un lien de réinitialisation par email
            echo "Un email de réinitialisation de mot de passe a été envoyé.";
            header("Location: acceuil.html");
        } else {
            echo "Aucun utilisateur trouvé avec cet email.";
        }
    } catch (PDOException $e) {
        die("Erreur de connexion : " . $e->getMessage());
    }
}
?>
