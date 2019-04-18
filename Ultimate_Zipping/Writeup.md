# Ultimate Zipping

### Name of the challenge

Dig & Conquer

### Flag

Flag for the challenge - `OSD_CTF{@Str355C0mpr355}`

### Hint \$ Description

Keep finding the file type and keep changing it to other file types to finally get a zip. Use a password cracker to find the password of the zip file with the help of dictionary attack.Firstly, the user gets a file with a big file name which appears as a flag but is not.Having known that its not,

1.  Check file type using `file` command.
2.  Unzipping the zip leads to other zips. Thus, we need to write a script to find how many zips are further compressed.
3.  For this, we write -

    ```
    #!/bin/bash
    unzip -o -qq flag.zip

    while [ 1 ];
    do
    ls | grep -v "zip"| grep -v "ape.sh"| while read line;
    do
    mv $line $line.zip
    unzip \$line.zip
    done
    done
    ```

4.  Having done this, we run the script and find that the decompression breaks at a certain point. We note the filename at that point and find its `file` type. To our surprise, its bzip2 compressed file.

5.  Now, when we bunzip2 the bzip2 file, we find that a new file with the same file type gets created. Thus, we write a script again.

    ```
    #!/bin/bash

    while [1];
    do
    mv new new.bz2
    bunzip2 new.bz2
    done
    ```

6.  Now, similarly to make the process give stress and test patience, further we get xz and gzip files. Repeating the same process, we get the final zip that when unzipped asks for password.

7.  To crack the password, we use `fcrackzip` which is a cracking tool made in C. We will crack the password using the rockyou.txt which can be found on machine by `locate rockyou.txt`. On using the command, `fcrackzip -D -u -p rockyou.txt new.zip`, we get the password of the zip file as `hi5rockyou`.

8.  On opening the zip, we find the `flag.txt` and thus the flag.

### File Required

- Wordlist - `rockyou.txt`
