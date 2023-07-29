# Thunderbird

* Solve Temps limite de connexion au serveur IMAP.GMAIL.COM dépassé (cf. https://forums.mozfr.org/viewtopic.php?t=150821)
```
Paramètre > Editeur de configuration
Filtre : écrire : timeout
Chercher la ligne : mailnews.tcptimeout
Augmenter sa valeur : mettre 600
Redémarrer TB
```

* Import mbox file
Use ImportExportTools NG add-in


# Gmail

* Find all emails that have no labels at all:
```
has:nouserlabels 
```

* Find huge emails:
```
larger:5M
```
