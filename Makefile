run:
	sh run.sh
lint:
	poetry run yamllint roles *.yml
	poetry run ansible-lint --format=pep8 main.yml roles
