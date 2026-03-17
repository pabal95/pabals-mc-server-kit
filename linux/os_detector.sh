
#-----------OS DETECTOR------------

source /etc/os-release #sets the source so that we can use the variables in said file

echo $PRETTY_NAME  #return the pretty name

echo $ID #return the single letter name of the OS

# for me to remember
# if [condition (-eq, ne, lt, le, gt, ge (for numbers, actual operators for strings))]; then
#   #code
# elif
#   #more code
# else
#   final code
# fi

if [[ $ID == "arch" || $ID == "manjaro" || $ID == "endeavouros" || $ID == "cachyos" ]]; then
    echo "Arch-based system detected"
elif [[ $ID == "ubuntu" || $ID == "debian" || $ID == "mint" ]]; then
    echo "Ubuntu/Debian based system detected"
else
    echo "I dont know what distro you are using, cannot proceed with Java auto-install"
fi


