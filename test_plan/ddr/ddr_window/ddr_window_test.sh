#!/bin/sh

###############################
echo "ddr window test start..."

###############################
DDR_WINDOW_DIR=/test_plan/ddr/ddr_window

kernel_version=$(uname -a | awk '{print $3}')
ddr_window_path=/lib/modules/${kernel_version}/kernel/drivers/amlogic/ddr_window/ddr_window.ko

echo "kernel: ${kernel_version}"
echo "ddr window path: ${ddr_window_path}"

insmod ${ddr_window_path}
if [ $? -ne 0 ]
then
	echo "insmod ddr_window.ko failure"
	exit 1
fi

${DDR_WINDOW_DIR}/ddr_window -f &
if [ $? -ne 0 ]
then
	echo "FAILURE: ddr window aplication start error."
	exit 1
fi
