#####################################
###        minbackuper            ###
###      for details goto         ###
### github.com/bockro/minbackuper ###
#####################################
###     bockra         2013       ###
#####################################
###				  ###
###   backuper as it is		  ###
###				  ###
#####################################


#file that consists of dirs and files you want to backup
list_dir="/etc/minbackuper/"
arch_list=$list_dir"archive.list"

#folder for archives
dir="/tmp/arch/"

#name of archive ex. 'minbck-31-12-2013.tar.gz'
archive="minbck-`date +%d-%m-%y`.tar.gz"

#checking archive dir
if [ ! -d $dir ]; then
	echo "Backup dir does not exists, creating one"
	mkdir -p $dir
fi
#checking default config dir
if [ ! -d $list_dir ]; then
        echo "config dir does not exists, creating one"
        mkdir -p $list_dir
fi
#checking default list file
if [ ! -f $arch_list -o ! -s $arch_list ]; then
	touch $arch_list
	echo "add some files and dirs to the list $arch_list"
	exit 0
fi
#
#example of an archive.list:
#/home/user/
#/var/www/access.log
#/tmp/hidden/pron
#


#you can specify a list of files and folders to archive. Use list full path as an argument
if [ $# -ne 0 ] &&  [ -e $1 ]; then 
	echo "creating archive $dir$archive from $1 list"
	tar -pzcvf $dir$archive -T $1

else
#adding list to list o_O
	echo "$arch_list" >> $arch_list
	echo "creating archive $dir$archive from default $arch_list list"
	tar -pzcvf $dir$archive -T $arch_list
fi
