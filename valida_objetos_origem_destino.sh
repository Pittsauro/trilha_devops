#!/bin/bash

SCHEMA=$1
DB_ORIGEM=$2
DB_DESTINO=$3


export NUM_OBJ_ORIGEM=$(echo "set head off feedback off 
                SELECT COUNT(*) FROM DBA_OBJECTS WHERE OWNER = '${SCHEMA}';
                exit" | $ORACLE_HOME/bin/sqlplus -s jenkins/jenkins@${DB_ORIGEM} )

export NUM_OBJ_DESTINO=$(echo "set head off feedback off 
                SELECT COUNT(*) FROM DBA_OBJECTS WHERE OWNER = '${SCHEMA}';
                exit" | $ORACLE_HOME/bin/sqlplus -s jenkins/jenkins@${DB_DESTINO} )
				
if [ ${NUM_OBJ_ORIGEM} -eq ${NUM_OBJ_DESTINO} ]
then

  echo " "
  echo " "
  echo "######################################################"
  echo "QUANTIDADE OBJETOS ORIGEM:"
  echo ${NUM_OBJ_ORIGEM} 
  echo "QUANTIDADE OBJETOS DESTINO:"
  echo ${NUM_OBJ_DESTINO}
  echo "######################################################"
  echo "IMPORT REALIZADO COM SUCESSO!"
  echo "######################################################"
  echo " "
  echo " "

else

  echo " "
  echo " "
  echo "######################################################"
  echo "QUANTIDADE OBJETOS ORIGEM:"
  echo ${NUM_OBJ_ORIGEM}
  echo "QUANTIDADE OBJETOS DESTINO:"
  echo ${NUM_OBJ_DESTINO}
  echo "######################################################"
  echo "VERIFIQUE O LOG DO IMPORT!"
  echo "######################################################"
  echo " "
  echo " "

fi
