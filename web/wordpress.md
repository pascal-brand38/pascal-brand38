# Installation

* Install Apache/PHP/MySQL for windows, to be able to run wordpress without internet, and test locally
  * Download wampserver from https://sourceforge.net/projects/wampserver/files/
    * on c:\wamp
    * php version should be >= 7.4
  * open chrome, and type  localhost  to check what is installed
* Create a database
  * http://localhost/phpmyadmin/  username=root  password=
  * Create a new database called wordpress
* Install wordpress from https://fr.wordpress.org/
  * Get wordpress
  * unzip all files in c:\wamp\www\wordpress
* Initialize by connecting to localhost/wordpress


# Create first site with [Astra](https://www.youtube.com/watch?v=TBZd9oligCw)

* Connect to localhost/wordpress/wp-admin
* Removes all pages and articles
* Install appearance theme ___Astra___
* [Create child theme](https://wpastra.com/guides-and-tutorials/wordpress-create-child-theme):
  * Install Use plugin ___Child Theme Configurator___
  * Then ___[Tools][Child Theme]___, with _Use the WordPress style queue_
  * Then edit style.css that can be found in ___wp-content/themes/astra-child/style.css___
* Install plugins:
  *  ___[Spectra](https://www.youtube.com/watch?v=GLNzTxArR6Y)___
  *  ___[WPForms](https://youtu.be/o2nE1P74WxQ)___
  * ___WP Mail SMTP___

* [Réglages][Permalien] => ___Titre de la pulication___
* Add pages
* Create the main menu in ___[Appearance][Menus]___
* Define the first page to show in ___[Réglage][Lecture][La page d'accueil affiche une page statique]___

* Personaliser the theme in ___[Appearance][Personaliser]___
  * ___[Identité du site]___: set logo and favicon.
    It is possible to use SVG logo
  * ___[Global]___
    * ___[Typographie]___: You can change the font for all titles and headings.
      Google fonts are possible, such as Kalam
    * ___[Colors]___: titles and headings, background,... HEADER and FOOTER do not have the correct background color


## Colors

Astra has 9 colors in his palette. In the following, we will use:
* color-1: link color
* color-2: hovered link color
* color-3: headings color
* color-4: body text color
* color-5: site background color
* color-6: content background color
* color-7: border color
* color-8 and color-9 are not used directly
  * color-8 is color-7 when hovered

All colors can be used in css using ```var(--ast-global-color-0)``` (starts from 0)




# Testing

* ___lighthouse___ works on localhost
* ___[yellowlabs.tools ](https://yellowlab.tools/)___ does not work on localhost. So you need to
  [install a local server](https://github.com/YellowLabTools/YellowLabTools/wiki/Install-your-private-server)
  locally, for example on msys2 / mingw64:
```bash
mkdir -p ~/dev/3rdparties
cd ~/dev/3rdparties
git clone https://github.com/YellowLabTools/YellowLabTools-server.git
cd YellowLabTools-server
npm install --force
mkdir results tmp
node bin/server.js
```
and you can then access http://localhost:8383/, and run it on url without https http://localhost/wordpress

# Installing on the internet

## https://www.infinityfree.com/

webtools.infinityfreeapp.com
ftp with
* if0_36961486
* generic password without the special char
* hostname for ftp: ftpupload.net

Control panel (to create a database...): https://cpanel.infinityfree.com/panel/indexpl.php?id=cd54fe8ab5ab8175d2df59bd445d4faa2ebc3624

[Upload from wamp to new website:](https://capitainewp.io/formations/developper-theme-wordpress/mise-en-ligne-wordpress/)
* import files using ftp
* export the database using phpadmin locally
* import the database on infinityfree:
  * create a database
  * admin it
  * import the database
* update the url in the database:
  * table wp_options
  * update siteurl and home, that point to localhost, to the new website webtools.infinityfreeapp.com
* update wp-config.php on the server, to reflect the database name, username,...
* switch absolute url from localhost to new website
* construct new permalinks


# Resources
Images:
* unsplash.com
* pexels.com
* pixabay.com
* logomakr.com

# TODO
* Multi language
