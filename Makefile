all:
	cd src && \
	go get -d && \
	go build -o ../switcher/switcher switcher.go
clean:
	rm -rf switcher
	rm -f src/go.sum
	
