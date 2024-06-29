<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réinitialisation du mot de passe</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #ffff;
            margin: 0;
        }
        .container {
            background-color: #e9e9e9;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            max-width: 100%;
            margin-top: 150px;
            
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #013771;
            color: #e9e9e9;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
    </style>
</head>
<body>
<div class="container">
    <h2>Réinitialisation du mot de passe</h2>
    <form action="forgot_password_process.php" method="post">
        <div class="form-group">
            <label for="Email">Email :</label>
            <input type="email" id="Email" name="Email" required>
        </div>
        <div class="form-group">
            <button type="submit">Envoyer</button>
        </div>
    </form>
</div>
</body>
</html>
