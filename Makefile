.EXPORT_ALL_VARIABLES:
	HAI=HELLO

build:
	go build -o dist/service src/main.go

run:
	dist/service

docker_build:
	docker image build -f Dockerfile -t $$DOCKER_USERNAME/$$GITHUB_WORKFLOW:$$GITHUB_RUN_NUMBER .

docker_login:
	docker login -u $$DOCKER_USERNAME -p $$DOCKER_PASSWORD

#docker_login:
	#docker login -u $$DOCKER_USERNAME -p $$DOCKER_PASSWORD

envtest:
	echo $$HAI