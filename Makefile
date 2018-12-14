all: lint test

lint:
	@python setup.py lint

build:
	@rm -rf build dist
	@python setup.py sdist bdist_wheel

publish:
	@twine upload dist/*

test:
	@python setup.py test

.PHONY: build docs test
