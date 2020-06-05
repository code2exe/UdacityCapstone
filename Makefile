lint:
	# See local hadolint install instructions: https://github.com/hadolint/hadolint
	# This is a linter for Dockerfiles
	hadolint Dockerfile

build:
	sh ./scripts/build_docker.sh	

upload:
	sh ./scripts/upload_docker.sh