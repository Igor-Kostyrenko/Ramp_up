### Function that creates a directory and move into it with one command

### Use any editor you want to add the mkcd function to the bottom of the bashrc file.

```sh
# edit the bashrc file
vim ~/.bashrc

# add the mkcd function to the bottom of the file
function mkcd {
 if [ ! -n "$1" ]; then
 echo "Enter mkcd followed by a directory name"
 elif [ -d $1 ]; then
 echo "\`$1' already exists"
 else
 mkdir $1 && cd $1
 fi
}

# save the file and exit
```

### Reload the bashrc settings by executing the following command:

```sh

. ~/.bashrc

```

![test](image.png)