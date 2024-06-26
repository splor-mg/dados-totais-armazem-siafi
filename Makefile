.PHONY: all extract delete-email validate transform build check publish clean

include config.mk

EXT = csv
RESOURCE_NAMES := $(shell $(PYTHON) main.py resources)
OUTPUT_FILES := $(addsuffix .csv,$(addprefix data/,$(RESOURCE_NAMES)))

all: extract delete-email validate transform build check

extract: 
	$(PYTHON) main.py extract

delete-email:
	Rscript scripts/delete-email.R

validate: 
	frictionless validate datapackage.yaml

transform: $(OUTPUT_FILES)

$(OUTPUT_FILES): data/%.csv: schemas/%.yaml scripts/transform.py datapackage.yaml data-raw/*.csv
	$(PYTHON) main.py transform $*

build: transform datapackage.json

datapackage.json: $(OUTPUT_FILES) scripts/build.py datapackage.yaml
	$(PYTHON) main.py build

check:
	frictionless validate datapackage.json
	Rscript checks/rstats/testthat.R

publish: 
	git add -Af datapackage.json data/*.csv data-raw/*.$(EXT)
	git commit --author="Automated <actions@users.noreply.github.com>" -m "Update data package at: $$(date +%Y-%m-%dT%H:%M:%SZ)" || exit 0
	git push

clean:
	rm -f datapackage.json data/*.csv
