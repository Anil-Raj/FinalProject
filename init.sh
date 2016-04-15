sed -i -e "8itools.staticdir.dir =\""$(pwd)"/static\"" tutorial.conf 
sed -i -e "13itools.staticdir.dir =\""$(pwd)"/js\"" tutorial.conf 
sed -i -e "18itools.staticdir.dir =\""$(pwd)"/\"" tutorial.conf 
