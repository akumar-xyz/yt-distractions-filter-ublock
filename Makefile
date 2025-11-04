all: filters.txt

filters.txt: filterList.txt channels.txt make-channel-filters.awk
	cat filterList.txt > filters.txt
	awk -f make-channel-filters.awk channels.txt >> filters.txt
