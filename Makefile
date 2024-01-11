#
#  🜏 Makefile options:
#
 BOLD  = \033[1m
/BOLD  = \033[0m
STRING = "$(BOLD)%-10s$(/BOLD)%s\n"
HELP   = sed -E 's/(`.*`)/\\e[1m\1\\e[0m/'

SERVICES = \
	python \
	bash

DEFAULT: help

build: $(addprefix build-,$(SERVICES)) # Build all solutions.

build-all: build # Build all solutions.

#
build-%: # Build solution.
	@mkdir -p ./log && \
	TIME="%U;%S;%e" && \
	[ ! -d "stack/$(*)" ] && exit 0; \
	time \
		--append \
		--format "$$TIME" \
		--output=./log/building.$(*) \
			docker build --force-rm \
				-t testing-$(*) \
				-f ./stack/$(*)/Dockerfile \
				"""./stack/$(*)"""

run-%: # Execute solution
	@mkdir -p ./log && \
	TIME="%U;%S;%e" && \
	time \
		--append \
		--format "$$TIME" \
		--output=./log/running.$(*) \
			docker run --rm \
				-v .:/app \
				-it testing-$(*)

clear: # Clear log files.
	@rm -Rf ./log

#
help: # Show this help.
	@(echo """"""""""""""""""" \
	$$(awk 'BEGIN {FS=":.*?#"} \
	/^([A-z0-9.\-_?]+:.*|^)#/{ \
	gsub("(:|^)#( |^|$$)",""); \
	if(substr($$1,1,1) !~ /-/  \
	&& substr($$2,1,1) !~ /-/) \
	printf $(STRING),$$1,$$2}' \
	$(MAKEFILE_LIST)|$(HELP))" \
	||((((((($(MAKE) -s))))))))

#
%:
	@:
