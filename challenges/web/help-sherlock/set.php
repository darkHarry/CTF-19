<?php
$cookie_name = "test";
$cookie_value = "true";
setcookie($cookie_name,$cookie_value, time() + (86400 * 30),"/");

if(isset($_COOKIE[$cookie_name])=="false") {
	echo "You have achieved Cookie-burst";
    echo "Flag is: OSD_CTF{sHerLocKh4sToDiE}";
} else {
 	echo "Hello World!!This is not enough.";  	
}
?>