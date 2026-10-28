if [ -r /etc/os-release ]; then
    . /etc/os-release
    os="$PRETTY_NAME"
else
    # Fallback for older systems lacking os-release
    os="$(uname -s) $(uname -r)"
fi
rootFree=`df -h / | tail -n 1 | awk '{print $4}' | tr -d '\n'`
memAvailable=`free -m | grep "Mem" | awk '{printf "%.1fG", $7/1024}'`
loadAvg=`cat /proc/loadavg | awk '{printf "%s %s %s", $1, $2, $3}'`
user=`whoami`
host=`hostname`

printf "
   👤 $user@$host
   🐧 $os
   💾 $rootFree  ⚡ $memAvailable  🚀 $loadAvg
" | lolcat --seed=45 --spread=5
