____________________________
# Libreoffice

## Forms
* Open Libreoffice writter
* Choose `ott` format. When reopening, using `Open`, and not the default `New`
* `[Affichage][Barre d'outils][Contrôle de formulaire]`
* `[Mode conception]`
* Export to pdf


Unfortunately, the pdf has some errors, that can be highlighted
with Acrobat Reader

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



<br>

____________________________
# Gmail

* Find all emails that have no labels at all: </br>
  **has:nouserlabels**

* Find huge emails: </br>
  **larger:5M**

<br>

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
