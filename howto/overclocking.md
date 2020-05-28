# GPU
echo 5 > /sys/class/mpgpu/cur_freq;
# I get 666(400) MHz on S905


# CPU
echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor;
echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor;
echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor;
# “performance” means that they always run at the top CPU speed possible.

echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
echo 1000000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
echo 1000000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
echo 1000000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq


# RAM
