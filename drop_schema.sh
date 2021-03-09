#!/bin/bash

SCHEMA=$1

sqlplus -s / "as sysdba" <<EOF
set serveroutput on
set lines 1000 pages 1000
set feedback off
exec dbms_output.put_line(' ');
exec dbms_output.put_line(' ');
exec dbms_output.put_line('###########################################');
exec dbms_output.put_line('### DROPANDO O SCHEMA ${SCHEMA} ###'); 
exec dbms_output.put_line('###########################################');
exec dbms_output.put_line(' ');
exec dbms_output.put_line(' ');
set feedback on
DROP USER ${SCHEMA} CASCADE;
exit
EOF

echo " "
echo " "
echo "########################################"
echo "### SCHEMA ${SCHEMA} DROPADO! ###"
echo "########################################"
echo " "
echo " "

