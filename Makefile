ARCH=amd64
OS=linux
SERVER_BINARY_NAME?=http-server
APP_VERSION?=0.0.1

build:
	GOARCH=$(ARCH) GOOS=$(OS) go build -o ${SERVER_BINARY_NAME} cmd/main.go

image:
	docker build --platform linux/$(ARCH) -t ${SERVER_BINARY_NAME}:$(APP_VERSION) -f ./Dockerfile \
    --build-arg "COMMIT=$(COMMIT)" --build-arg "APP_VERSION=$(APP_VERSION)" --build-arg "DATE=$(DATE)" .
clean:
	rm -rf http-server-*