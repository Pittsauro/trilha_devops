#!/bin/bash

SCHEMA=$1


export OBJ_INV=$(echo "set head off feedback off pagesize 5000 linesize 30000
                SELECT COUNT(*) FROM DBA_OBJECTS WHERE STATUS = 'INVALID' AND OWNER = '${SCHEMA}';
                exit" | $ORACLE_HOME/bin/sqlplus -s / as sysdba )
        
if [ ${OBJ_INV} -gt 0 ]
then

sqlplus -s / as sysdba <<EOF
set serveroutput on
set lines 1000 pages 1000
set feedback off
exec dbms_output.put_line(' ');
exec dbms_output.put_line('###########################################');
exec dbms_output.put_line('RECOMPILANDO O SCHEMA ${SCHEMA} ');
exec dbms_output.put_line('###########################################');
set feedback on
exec utl_recomp.recomp_serial('${SCHEMA}');
set feedback off
exec dbms_output.put_line(' ');
exec dbms_output.put_line(' ');
exec dbms_output.put_line('###########################################');
exec dbms_output.put_line('SCHEMA ${SCHEMA} RECOMPILADO');
exec dbms_output.put_line('###########################################');
exit
EOF

else
  echo " "
  echo " "
  echo "######################################"
  echo "### NÃO EXISTEM OBJETOS INVALIDOS! ###"
  echo "######################################"
  echo " "
  echo " "
 
fi
