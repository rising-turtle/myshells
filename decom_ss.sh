#!/bin/bash 


# He Zhang, May 10, 2019, hzhang8@vcu.edu 
# 
# decompress structure core bag file in a shell 
# 

rot_name="pitch roll yaw"
# rot_name="yaw"
mov_name="x z"
rot_id="0 3 6 9 12 15"
mov_id="00 10 20 30 40 50"

# data dir
data_dir="/home/hzhang8/work/data/gt_table/struct_core"

for rn in $rot_name
do
    for id in $rot_id
    do
	bag_name="${data_dir}/${rn}/${rn}_${id}.bag"
	dst_name="${data_dir}/${rn}/${rn}_${id}"
	echo "./bag_decompress_rgbd_core ${bag_name} ${dst_name}"
	./bag_decompress_rgbd_struct_core ${bag_name} ${dst_name} >/dev/null 2>&1
	
	sleep 1
    done
done


for tn in $mov_name
do
    for id in $mov_id
    do
	bag_name="${data_dir}/${tn}_t/${tn}_${id}.bag"
	dst_name="${data_dir}/${tn}_t/${tn}_${id}"
	echo "./bag_decompress_rgbd_core ${bag_name} ${dst_name}"
	./bag_decompress_rgbd_struct_core ${bag_name} ${dst_name} >/dev/null 2>&1
	
	sleep 1
    done
done
