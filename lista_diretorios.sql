set timing off;
set head off;
set feedback off;
set echo off;
set verify off trimspool on
spool /home/oracle/trilha_devops/diretorios.txt
SELECT DIRECTORY_NAME FROM DBA_DIRECTORIES ORDER BY DIRECTORY_NAME;
spool off;
exit
