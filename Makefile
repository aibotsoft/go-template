.EXPORT_ALL_VARIABLES:
APP_NAME=go-template
DOCKER_USERNAME=aibotsoft
CGO_ENABLED=0

build:
	go build -o dist/service src/main.go

run:
	go run src/main.go

run_build:
	dist/service

docker_build:
	docker image build -f Dockerfile -t $$DOCKER_USERNAME/$$GITHUB_WORKFLOW:$$GITHUB_RUN_NUMBER .

docker_login:
	docker login -u $$DOCKER_USERNAME -p $$DOCKER_PASSWORD

docker_push:
	docker push $$DOCKER_USERNAME/$$GITHUB_WORKFLOW:$$GITHUB_RUN_NUMBER

docker_deploy: docker_build docker_login docker_push

#envtest: hello && hello2