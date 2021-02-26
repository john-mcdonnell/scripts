cat /etc/redhat-release

echo
echo "*********************************************"
echo

cat /etc/oracle-release

echo
echo "*********************************************"
echo

java -version

echo
echo "*********************************************"

sqlplus -s "sys/oracle@wm6 as sysdba" @version.sql

echo
echo "*********************************************"

java -cp $WL_HOME/server/lib/weblogic.jar weblogic.version