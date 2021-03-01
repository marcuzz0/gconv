# gconv
## Premessa
gconv è uno script shell scritto in bash che permette la conversione di coordinate con vari metodi.
Si può Copiare/Incollare una lista di punti direttamente nel terminale oppure utilizzare un file *.csv.
Inoltre lo script può convertire coordinate geografiche da gradi sessagesimali a gradi sessadecimali.
Le conversioni avvengono per mezzo del potente motore cs2cs (https://proj.org/apps/cs2cs.html).

Di seguito vengono riportati i passaggi per l'installazione delle dipendenze necessarie al corretto funzionamento dello script.

NB: per il sistema operativo Windows 10 è necessario abilitare la bash di Windows, ad esempio (https://www.lffl.org/2016/08/guida-abilitare-la-bash-windows-10.html)

## Installazione per Debian or Ubuntu Linux
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

## Installazione per Windows 10
```
$ sudo apt-get update && sudo apt-get upgrade
$ sudo apt-get install proj-bin
$ mkdir bin
$ cd $HOME/bin
$ git clone https://github.com/marcuzz0/gconv.git
$ sudo apt-get install l dialog
$ echo "export PATH="$PATH:$HOME/bin/gconv"" >> .bashrc
```
