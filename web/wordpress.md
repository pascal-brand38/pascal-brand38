# Installation

* Install Apache/PHP/MySQL for windows, to be able to run wordpress without internet, and test locally
  * Download wampserver from https://sourceforge.net/projects/wampserver/files/
    * on c:\wamp
    * php version should be >= 7.4
  * open chrome, and type  localhost  to check what is installed
* Create a database
  * http://localhost/phpmyadmin/  username=root  password=
  * Create a new database called wordpress, with latin1_bin
* Install wordpress from https://fr.wordpress.org/
  * Get wordpress
  * unzip all files in c:\wamp\www\wordpress
* Initialize by connecting to localhost/wordpress


# Create first site

Cf. https://www.youtube.com/watch?v=wCDaxehVwoY

* Connect to localhost/wordpress/wp-admin
* Removes all pages and articles
* Install appearance theme ___Variations___
* [Réglages][Permalien] => ___Titre de la pulication___
* Add pages
* Sort the menu in ___[Appearance][Editeur][Navigation]___
* Define the first page to show in ___[Réglage][Lecture][La page d'accueil affiche une page statique]___
* To generate some content, you may use tyler.com
* Update the images: glisser ou [remplacer][téléverser]


## Menu
Update the header (and menu) and footer in ___[Appearance][Editeur][Modèle][Gérer tous les modèles][Pages]___
  * When updating the logo, do not use 'Utiliser comme icone du site', but go in ___[Réglages][General]___ and modify the icon of the site in your favicon.

## typography
* Installer ___Fonts PLugin__ avec ___[Extensions][Ajouter][Fonts plugin]___
* Then ___[Customize Fonts][Basic]___ and you can use Roboto as the base font family, and Kalam as the heading typography.

## CSS

___[Appearance][Personnaliser][CSS aditionnels]___


# Resources
Images:
* unsplash.com
* pexels.com
* pixabay.com
* logomakr.com

# TODO
* Multi language
* Astra https://www.youtube.com/watch?v=TBZd9oligCw
* Spectra https://www.youtube.com/watch?v=GLNzTxArR6Y
