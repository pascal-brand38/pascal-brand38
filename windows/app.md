# Thunderbird

* Solve Temps limite de connexion au serveur IMAP.GMAIL.COM dépassé (cf. https://forums.mozfr.org/viewtopic.php?t=150821)
```
Paramètre > Editeur de configuration
Filtre : écrire : timeout
Chercher la ligne : mailnews.tcptimeout
Augmenter sa valeur : mettre 600
Redémarrer TB
```

* Import mbox file: </br>
  Use *ImportExportTools NG* add-in



# Gmail

* Find all emails that have no labels at all: </br>
  **has:nouserlabels**

* Find huge emails: </br>
  **larger:5M**

# DOS / Windows

* Clean empty data of disk c
```
cipher /w:c
```

* Adding right-click command: 
In regedit, add the following (%1 is the file that is right-clicked, %w is its directory)
```
   HKEY_CLASSES_ROOT\*\shell\My New Command\Command
   default is
        C:\msys64\msys2_shell.cmd -mingw64 -c 'python  mybin.py "--file=$0" "--dir=$1"'  "%1" "%w" 
```


# Misc.

## Misc. actions

* svg to png: using Photoshop, open the svg, and set resolution to
  1200dpi or higher on initial pixellisation step

## Misc. app
* MusicBrainz Picard
* CopyTrans Control Center / CopyTrans Manager
* AndreaMosaic
* Faststone Image Viewer
* Filezilla
* CCleaner
* Defraggler
* Recuva
* 7zip
* ImageMagik
* CrystalDiskInfo
* Libreoffice
* MalewareBytes
* PdfXChangeViewer
* Httrack
* FreeFileSync portable
* PdfReducerPro Portable
* OpenShot Video
* notepad++
* Visual Studio Code
* Paint.net
* Media Player Classic Home Cinema
