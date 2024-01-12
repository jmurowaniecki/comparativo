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

execute: $(addprefix run-,$(SERVICES)) # Run all solutions.

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
	@\
	(echo -n "$(*) | " && \
	docker run --rm \
		-v .:/app \
		-it testing-$(*) \
		head -n1 /etc/issue | sed -E 's/Welcome to //;s/[\\]//g' \
	)>> Versions.tmp

show-sizes: # Show container/image sizes.
	@\
	(docker image list \
		--format "{{.Repository}} | {{.Tag}} | {{.Size}}" \
	)>> Sizes.tmp

show-build-time-%:
	@rm -Rf Build.$(*).tmp
	@data_read=0;sum=0; \
	while read -r line; \
	do data_read=$$((data_read + 1)); \
	usr=$$(echo $$line | awk -F';' '{print($$1)}'); \
	sys=$$(echo $$line | awk -F';' '{print($$2)}'); \
	all=$$(echo $$line | awk -F';' '{print($$3)}'); \
	cal=$$(echo "$$usr + $$sys + $$all" | bc); \
	sum=$$(echo "$$sum + $$cal" | bc); \
	done < log/building.$(*); \
	echo "scale=3; $$sum / $$data_read" | bc -l >> Build.$(*).tmp

show-build-times: $(addprefix show-build-time-,$(SERVICES))

show-running-time-%:
	@rm -Rf Running.$(*).tmp
	@data_read=0;sum=0; \
	while read -r line; \
	do data_read=$$((data_read + 1)); \
	usr=$$(echo $$line | awk -F';' '{print($$1)}'); \
	sys=$$(echo $$line | awk -F';' '{print($$2)}'); \
	all=$$(echo $$line | awk -F';' '{print($$3)}'); \
	cal=$$(echo "$$usr + $$sys + $$all" | bc); \
	sum=$$(echo "$$sum + $$cal" | bc); \
	done < log/running.$(*); \
	echo "scale=3; $$sum / $$data_read" | bc -l >> Running.$(*).tmp

show-running-times: $(addprefix show-running-time-,$(SERVICES))

show-all: \
	show-clear \
	show-image \
	show-sizes \
	show-build-times \
	show-running-times

show-table: show-all # Build information table with versions/sizes.
	@\
	while read -r line; \
	do \
	stack=$$(echo "$$line" | awk '{print($$1)}'); \
	sizes=$$(grep "$$stack" Sizes.tmp          ); \
	times=$$(wc -l "log/running.$$stack"       ); \
	build=$$(cat """Build"""."""$$stack.tmp"   ); \
	execs=$$(cat """Running"".""$$stack.tmp"   ); \
	first=$$(head  "log/running.$$stack" -n 1  ); \
	times=$$(echo "$$times" | cut -d ' ' -f 1  ); \
	first=$$(echo "$$first" | sed -E 's/\;/+/g'); \
	first=$$(echo "scale=3;  $$first"| bc      ); \
	echo "$$line | $$sizes | $$build | $$first | $$execs | $$times" | sed -E 's/\r//' >> Table.tmp; \
	done < Versions.tmp

show-image: $(addprefix show-version-,$(SERVICES)) # Show all container versions

clear: # Clear log and temporary files.
	@rm -Rf ./log *.tmp

all: \
	clear \
	build-all \
	execute

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
