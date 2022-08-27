python ?= python3

venv = venv
python = $(venv)/bin/python3
pip = $(venv)/bin/pip
pre-commit = $(venv)/bin/pre-commit

new-job:
	${python} -m cookiecutter "./templates/$(type)"

setup: deps
	direnv allow .

deps: $(venv)/bin/activate

$(venv)/bin/activate: venv requirements-dev.txt
	$(pip) install -r requirements-dev.txt
	$(pre-commit) install
	touch $(venv)/bin/activate

venv:
	python3 -m venv ${venv}

clean:
	rm -rf __pycache__
	rm -rf $(venv)
