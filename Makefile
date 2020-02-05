rebuild:
	docker-compose rm -f db
	docker-compose build db
	docker-compose up
dev:
	docker-compose up
db:
	docker-compose rm -f db
	docker-compose build db

.PHONY: db
