if [ -r /etc/os-release ]; then
    . /etc/os-release
    os="$PRETTY_NAME"
else
    # Fallback for older systems lacking os-release
    os="$(uname -s) $(uname -r)"
fi
os_type=$(uname -s)

# Username and host
user=$(whoami)
host=$(hostname)

# 1. Root Free Space (df works identically on both)
rootFree=$(df -h / | awk 'NR==2 {print $4}' | tr -d '\n')

if [ "$os_type" = "Linux" ]; then
    # --- LINUX (Debian-based) ---
    memAvailable=$(free -m | awk '/Mem:/ {printf "%.1fG", $7/1024}')
    loadAvg=$(cat /proc/loadavg | awk '{printf "%s %s %s", $1, $2, $3}')

elif [ "$os_type" = "FreeBSD" ]; then
    # --- FREEDBSD ---
    # FreeBSD loadavg via sysctl (strips brackets and commas)
    loadAvg=$(sysctl -n vm.loadavg | tr -d '{}' | awk '{printf "%s %s %s", $1, $2, $3}')

    # FreeBSD available memory (approximating Free + Inactive + Cache pages in GB)
    memAvailable=$(vmstat -s | awk '
        /free pages/    {free=$1}
        /inactive pages/{inact=$1}
        /cache pages/   {cache=$1}
        END {
            # Assuming standard 4KB page size (4096 bytes) converted to GB
            printf "%.1fG", ((free + inact + cache) * 4096) / (1024 * 1024 * 1024)
        }')
fi

printf "
   👤 $user@$host
   🐧 $os
   💾 $rootFree  ⚡ $memAvailable  🚀 $loadAvg
" | lolcat --seed=45 --spread=5
