all: create

create:
	docker build -t cticsjeifsc/mediawiki:1.31.8 .
	docker login
	docker push cticsjeifsc/mediawiki:1.31.8