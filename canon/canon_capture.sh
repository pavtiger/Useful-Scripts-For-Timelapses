num=0

rm -rf vault/*

while true
do
	num_zeros=$(printf "%06d" $num)

	# fswebcam --device /dev/video2 --deinterlace --no-shadow --no-banner --resolution 4000x3000 --delay 5 --skip 10 --png 4 vault/img$num_zeros.png -q
	
	gphoto2 --filename /home/pavtiger/devices/canon/vault/img$num_zeros.%C --capture-image-and-download
	cp vault/img$num_zeros.jpg preview.jpg
	sudo mv vault/* /mnt/remote_samba/Everything-Physarum/_auto_/canon/
	num=$((num+1))
	echo $num photos captured
	sleep 60
done
