.PHONY: install test build clean publish lint types token peer

DOCKER_COMPOSE_RUN_OPTIONS=--rm
ifeq (${CI},true)
    DOCKER_COMPOSE_RUN_OPTIONS=--rm --user root -T
endif

PACKAGE_VERSION=$(shell cat package.json | grep -i version | sed -e "s/ //g" | cut -c 12- | sed -e "s/\",//g")

npmjs:
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'echo "//registry.npmjs.org/:_authToken=$$NPMJS_AUTH_TOKEN" >> .npmrc'
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'echo "@benjaminnoufel:registry=https://registry.npmjs.org/" >> .npmrc'


token:
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'echo "//npm.pkg.github.com/:_authToken=$$NPM_AUTH_TOKEN" > .npmrc'
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'echo "@benjaminnoufel:registry=https://npm.pkg.github.com/" >> .npmrc'

install:
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn install

peer:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn add -P @material-ui/core@4 react@16 react-router-dom@5

clean:
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) bash -c 'for file in $(shell cat .gitignore); do if [ "/.env" != "$$file" ]; then rm -rf .$$file; fi; done'

publish:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn publish --access public --registry https://npm.pkg.github.com/ --new-version $(PACKAGE_VERSION) --non-interactive

publish-npmjs:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn publish --access public --registry https://registry.npmjs.org/ --new-version $(PACKAGE_VERSION) --non-interactive

test:
	docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn test

lint:
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn lint

build:
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn build

types:
	@docker-compose run $(DOCKER_COMPOSE_RUN_OPTIONS) yarn types
