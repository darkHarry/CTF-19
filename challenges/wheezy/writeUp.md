# Wheezy

## About
This is a basic challenge just to test your knowledge of Reconnaissance.

## Description 
You have been given an image. From that image you have to find the flag.

### Step 1
Check the metadata of the image.
```strings osdc.jgp```
You must have found lots of strings that are in the image. Now check for the weirdest string. You must have noticed a long hashed string like this 
```U2FsdGVkX19UbEhmPf1edJd8ay8JWHy2pP61cd39FzcMOkLiD/EVRG0C3pLT8r30```. But as of know we don't know what is this. It can be a encrypted string for it can be the flag also. 
Obviously, this can't be the flag, but you can check though. Now lets move to next step for collecting more information.

### Step 2
Till now we have a string which is long, hashed and weirdest among all the strings we searched in the image. But we don't know what kind of encryption is used for encrypting this string.
Now lets collect more information about the image.
We will ```exiftool``` to check for more metadata of the flag.
Install ```exiftool``` with the following command
``` sudo apt install exiftool```
Now do ```exiftool osdc.jpg```  
Metadata of the image will be displayed.

### Step 3
Analyzise the metadata and trim the information you need.
You must have noticed these lines
```Creator                         : Securing Networks Communications Certificates Enc.```:- signifies that the encryption used in encrypting this string is usually used in encrypting network communcations certificates. Googling it we conclude that the encryption used to encrypt network certificats is OpenSSL.
```Rights                          : @2019 OSDC, all rights reserved for 256 enc```:- signifies that it is a 256 bit encryption.
```Special Instructions            : U2FsdGVkX19UbEhmPf1edJd8ay8JWHy2pP61cd39FzcMOkLiD/EVRG0C3pLT8r30``` :- the encrypted string.
```Copyright Notice                : Crack me with best hacking conference```:- It says you can crack this string with a name of best hacking conference. Googling this you must have noticed that **defcon** is the best hacking conference.

### Step 4
Now lets decrypt this OpenSSL encrypted string
```echo "U2FsdGVkX19UbEhmPf1edJd8ay8JWHy2pP61cd39FzcMOkLiD/EVRG0C3pLT8r30" | openssl enc -a -d -aes-256-cbc```
Then you must have been asked for password which is **defcon**.
Finally the flag is ```OSD_CTF{#KeepItUp#}```
