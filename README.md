# gconv
## Premessa
gconv (gestione conversioni) è uno script shell scritto in bash che permette la conversione di coordinate passando allo script un file *.csv.
Altri piccoli script permettono la conversione di una singola coordinata.
Le conversioni avvengono per mezzo del potente motore cs2cs (https://proj.org/apps/cs2cs.html).

Di seguito vengono riportati i passaggi per l'installazione delle dipendenze necessarie al corretto funzionamento dello script.

NB: per il sistema operativo Windows 10 è necessario abilitare la bash di Windows, ad esempio (https://www.lffl.org/2016/08/guida-abilitare-la-bash-windows-10.html)

## Installazione per Debian, Ubuntu Linux, Windows 10
```
$ sudo apt-get update && sudo apt-get upgrade
$ sudo apt-get install proj-bin
$ mkdir bin
$ cd $HOME/bin
$ git clone https://github.com/marcuzz0/gconv.git
$ sudo apt-get install l dialog
$ echo "export PATH="$PATH:$HOME/bin/gconv"" >> .bashrc
```

## Installazione per Mac OSX
```
$ brew install proj
$ mkdir bin
$ cd $HOME/bin
$ git clone https://github.com/marcuzz0/gconv.git
$ brew install dialog
$ echo 'export PATH="$PATH:$HOME/bin/gconv"' >> .bashrc
````
