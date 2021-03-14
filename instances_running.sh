ps -ef | grep pmon | grep -v grep | grep -v +ASM | awk '{ print $8 }' | cut -d '_' -f3 > /home/oracle/trilha_devops/instances_running.txt
