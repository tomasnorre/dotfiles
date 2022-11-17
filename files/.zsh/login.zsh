os=`lsb_release -d | awk '{printf "%s %s", $2, $3}'`
rootFree=`df -h | grep root | awk '{print $4}' | tr -d '\n'`
memAvailable=`free -m | grep "Mem" | awk '{printf "%.1fG", $7/1024}'`
loadAvg=`cat /proc/loadavg | awk '{printf "%s %s %s", $1, $2, $3}'`
user=`whoami`
host=`hostname`

printf "
████████ ███    ██ ███    ███
   ██    ████   ██ ████  ████
   ██    ██ ██  ██ ██ ████ ██   👤 $user@$host
   ██    ██  ██ ██ ██  ██  ██   🐧 $os
   ██    ██   ████ ██      ██   💾 $rootFree  ⚡ $memAvailable  🚀 $loadAvg

" | lolcat --seed=45 --spread=10