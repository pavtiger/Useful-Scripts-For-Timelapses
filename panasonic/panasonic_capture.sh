num=0

rm -rf vault/*

while true
do
	num_zeros=$(printf "%06d" $num)

	fswebcam --device /dev/video0 --input "Camera 1" --deinterlace --no-shadow --no-banner --resolution 4000x3000 --delay 5 --skip 10 --png 4 vault/img$num_zeros.png -q
	cp vault/img$num_zeros.png video0.png
	sudo mv vault/* /mnt/remote_samba/Everything-Physarum/_auto_/panasonic/
	num=$((num+1))
	echo $num photos captured
	sleep 60
done
