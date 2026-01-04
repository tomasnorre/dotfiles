#!/bin/bash
# High-End Build Validation Script for 9950X / X870 / Arc A380
REPORT="hardware_report.txt"
echo "--- NEW BUILD HEALTH REPORT ($(date)) ---" > $REPORT

echo "[1/4] CHECKING CPU: Ryzen 9 9950X" | tee -a $REPORT
# Verify Zen 5 P-State Driver
DRIVER=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver)
echo "Scaling Driver: $DRIVER" >> $REPORT
if [[ "$DRIVER" != "amd-pstate-epp" ]]; then
    echo "WARNING: Not using amd-pstate-epp. Add 'amd_pstate=active' to GRUB." >> $REPORT
fi

# Run Quick 7-Zip Benchmark (Expect ~250k-300k+ MIPS for 16 cores)
echo "Running 7-Zip Benchmark (AVX-512 Stress)..."
7z b | grep -E "Tot:|CPU" >> $REPORT

echo -e "\n[2/4] CHECKING GPU: Intel Arc A380" | tee -a $REPORT
# Verify Xe vs i915
GPU_DRIVER=$(lspci -k | grep -A 3 VGA | grep "kernel driver")
echo "Active Driver: $GPU_DRIVER" >> $REPORT
if [[ "$GPU_DRIVER" == *"i915"* ]]; then
    echo "ACTION: Switch to 'xe' driver for 20-50% compute gains." >> $REPORT
fi
# Check Mesa Version (Expect 25.x+)
glxinfo | grep "OpenGL version" >> $REPORT

echo -e "\n[3/4] CHECKING STORAGE: Crucial T710 (Gen5)" | tee -a $REPORT
# Verify Gen5 Link Speed (Width x4, Speed 32GT/s)
sudo lspci -vv -s $(lspci | grep "Non-Volatile" | cut -d' ' -f1) | grep -E "LnkSta:|Speed" >> $REPORT
# Quick 5GB FIO Stress (Check for throttling)
echo "Running Gen5 IO Test (Expected >10,000MB/s)..."
sudo fio --name=Gen5 --filename=temp.test --size=5G --direct=1 --rw=read --bs=1M --ioengine=libaio --runtime=10 --group_reporting | grep "READ: bw=" >> $REPORT
rm temp.test

echo -e "\n[4/4] THERMALS & SENSORS" | tee -a $REPORT
sensors | grep -E "Package|Composite|fan" >> $REPORT

echo -e "\nREPORT SAVED TO: $REPORT"
