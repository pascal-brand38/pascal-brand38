____________________________
# Visual Studio Code

## Settings
Open menu File → Preferences → Settings → User Settings tab, and check the following
* files: trim trailing whitespace
* files: trim final newlines

Command Palette (CTL-SHIFT-P), and then:
* Python: Select Interpreter ==> C:\msys64\mingw64\bin\python.exe
  (see answer of https://stackoverflow.com/questions/70795319/no-module-named-pil-visual-studio-code-error/77189429)

## Extension

* Live Server
* Even Better TOML
* Github Actions
* Pylance
* webhint



____________________________
# Libreoffice

## Forms
* Open Libreoffice writter
* Choose `ott` format. When reopening, using `Open`, and not the default `New`
* `[Affichage][Barre d'outils][Contrôle de formulaire]`
* `[Mode conception]`
* Export to pdf


Unfortunately, the pdf has some errors, that can be highlighted
with Acrobat Acrobat

<table>
<tbody>
<tr>
<td>
<ul>
<li> Use tool `Prepress` (`Preflight in english`) </li>
<li> Click on `Controle en Amont` </li>
<li> Select `Rapport sur les problèmes de syntaxe PDF` </li>
<li> Click on `Analyse` </li>
<li> Here are typical errors: </li>
</td>

<td>
<img src="https://raw.githubusercontent.com/pascal-brand38/docs/main/windows/pdf-errors.png"/>
</td>
</tr>
</tbody>
</table>


To correct errors using Acrobat Reader, save it as `PDF/A 1a`, as in the following:
![](https://raw.githubusercontent.com/pascal-brand38/docs/main/windows/pdf-save-pdfA-1a.png)

With prepress, this is now possible to check there are no PDF synatx errors

![](https://raw.githubusercontent.com/pascal-brand38/docs/main/windows/pdf-correct.png)

The resulting pdf could then being optimized and reduced using Orpalis Pdf Reducer 3.

There are 2 other ways to check the pdf is not that bad:
* https://www.pdf-online.com/osa/validate.aspx
* Run `/c/Program\ Files/gs/gs10.00.0/bin/gswin64.exe -r36x36 file.pdf`
  and look at the gostscript console the Helevetica font is not
  loaded several times,...

Note that the following npm package are way too simple
(look for count page,...):
* https://www.npmjs.com/package/is-pdf-valid
* https://www.npmjs.com/package/@ninja-labs/verify-pdf
* https://www.npmjs.com/package/ghostscript-node

## Edit macros in Visual Studio Code
From https://www.youtube.com/watch?v=xoO-Fx0fTpM&ab_channel=xlwings

MUST BE INSTALLED ON WINDOWS or MACOS. No MINGW32.

https://docs.xlwings.org/en/stable/installation.html

From WinPython, portable version of python

Run WinPython Command Prompt.exe - Raccourci
pip install --upgrade xlwings
pip install watchgod
xlwings vba edit


```
python -m pip install xlwings
xlwings
```



<br>

____________________________
# Acrobat Reader

## Forms

Open the pdf, then more tools to choose Prepare the form.
And you now have access to all the fields

<br>

____________________________
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

* Signature --:
  Parameters > General > Editeur de configuration > mail.identity.default.suppress_signature_separator = true

<br>

____________________________
# Gmail

* Find all emails that have no labels at all: </br>
  **has:nouserlabels**

* Find huge emails: </br>
  **larger:5M**

* Find without attachments: </br>
  **!has:attachment**

* Find by dates: <br>
  **before:2020-01-01**

<br>


# Github

Search for the PR I sibmitted, but not in my own repo:
* is:pr author:pascal-brand38 -user:pascal-brand38

____________________________
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

<br>

____________________________
# Browser

## [IE11 on Windows-11](https://www.tomsguide.fr/windows-11-internet-explorer-respire-encore-voici-comment-louvrir/)

* Tapez Options Internet dans la barre de recherche du menu Démarrer.
* Ouvrez l’applet du Panneau de configuration qui apparaît dans les résultats.
* Trouvez l’onglet Programmes puis cliquez sur Gérer les modules complémentaires.
* Cliquez enfin sur En savoir plus sur les barres d’outils et les extensions dans le coin inférieur gauche de la fenêtre.
* Pour une raison étrange, cela lancera Internet Explorer en contournant les commandes qui vous dirigent de force sur Edge.

## Older version of chrome
* NO: https://vikyd.github.io/download-chromium-history-version/#/


____________________________
# Misc.

## Misc. actions

* svg to png: using Photoshop, open the svg, and set resolution to
  1200dpi or higher on initial pixellisation step

## Misc. app
* [MusicBrainz Picard](https://picard.musicbrainz.org/)
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
