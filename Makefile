REQUIREMENTS := $(CURDIR)/requirements.txt
ENVDIR := $(CURDIR)/.env
DONE := $(ENVDIR)/.done

.PHONY: all env

all: env
env: $(DONE)

$(DONE): $(REQUIREMENTS)
	virtualenv $(ENVDIR) && \
	. $(ENVDIR)/bin/activate && \
	pip install -r $< && \
	touch $@

clean:
	$(RM) -r $(ENVDIR)
