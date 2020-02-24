build:
	go build -o dist/service src/main.go

run:
	dist/service

docker_build:
	docker image build -f Dockerfile -t $DOCKER_USERNAME/$GITHUB_WORKFLOW:$GITHUB_RUN_NUMBER .