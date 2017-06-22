# Contao Docker for Debian Development

---
This Project was originally forked from [maxpou/docker-symfony](https://github.com/maxpou/docker-symfony).  
**Thank you Maxence for that great work :-)**    

---

Beinhaltet aktuell Nginx, PHP7, ELK, MySQL, Node/Grunt/Bower

**AKTUELL WIRD UBUNTU ab 16.04 UNTERSTÜTZT**

## Docker einrichten (einmalig)

1. **Installation**  

   Folge der Anleitung auf [https://docs.docker.com/engine/installation/linux/ubuntu/]()

2. **Lokalen User in die Docker Gruppe hinzufügen**  

   Folge der Anleitung auf [https://docs.docker.com/engine/installation/linux/linux-postinstall/]()
   
   oder kurz

   ```bash
   $ sudo usermod -aG docker $USER
   ```
   
   und danach einmal **Neustarten**
   
## Entwicklerumgebung einrichten

1. **Installation**  

    ```bash
    $ ./project install myproject.dev
    ```
    
    hier wird zum schluss noch dein lokales passwort abgefragt, da über sudo die domain in die `/etc/hosts` eingetragen wird.

2. **Contao Install Passwort setzen.**  

    Gebe im Browser nun [https://myproject.dev/contao/install]() ein und setze ein neues Passwort.
    
## Useful commands

1. grunt build

    ```bash
    $ ./project grunt build
    ```

2. SQL Dump erstellen `./shared/latest.sql`

    ```bash
    $ ./project export-sql
    ```

3. SQL Dump einpflegen `./shared/latest.sql`

    ```bash
    $ ./project import-sql
    ```

4. Weiter Befehle

    ```bash
    $ ./project --help
    ```
    
__Viel Spaß :-)__
