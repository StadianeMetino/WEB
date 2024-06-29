<?php
session_start(); //demare une nouvelle session
session_unset(); // Libère les variables de session
session_destroy(); //detruit la session actu
header("Location: login.html");
exit();
?>
