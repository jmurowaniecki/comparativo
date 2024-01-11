#
#  🜏 Makefile options:
#
 BOLD  = \033[1m
/BOLD  = \033[0m
STRING = "$(BOLD)%-10s$(/BOLD)%s\n"
HELP   = sed -E 's/(`.*`)/\\e[1m\1\\e[0m/'

SERVICES = \
	golang \
	python \
	bash \
	ruby \
	node \
	perl \
	php

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

show-clear:
	@rm -Rf Versions.tmp
	@rm -Rf Sizes.tmp
	@rm -Rf Table.tmp

show-version-%: # Show container versions.
	@(echo -n "$(*) | " && \
	docker run --rm \
		-v .:/app \
		-it testing-$(*) \
		head -n1 /etc/issue | sed -E 's/Welcome to //;s/[\\]//g' \
	)>> Versions.tmp

show-sizes: # Show container/image sizes.
	@(docker image list \
		--format "{{.Repository}} | {{.Tag}} | {{.Size}}" \
	)>> Sizes.tmp

show-build-time-%:
	@rm -Rf Build.$(*).tmp
	@while read -r line; \
	do \
	usr=$$(echo $$line | awk -F';' '{print($$1)}'); \
	sys=$$(echo $$line | awk -F';' '{print($$2)}'); \
	all=$$(echo $$line | awk -F';' '{print($$3)}'); \
	echo "$$usr + $$sys + $$all" | bc >> Build.$(*).tmp; \
	done < log/building.$(*)

show-build-times: $(addprefix show-build-time-,$(SERVICES))

show-all: show-clear show-versions show-sizes

show-table: show-all # Build information table with versions/sizes.
	@while read -r line; \
	do stack=$$(echo $$line | awk '{print($$1)}'); \
	size=$$(grep "$$stack" Sizes.tmp); \
	echo "$$line | $$size" | sed -E 's/\r//' >> Table.tmp; \
	done < Versions.tmp

show-versions: $(addprefix show-version-,$(SERVICES)) # Show all container versions

clear: # Clear log and temporary files.
	@rm -Rf ./log *.tmp

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
