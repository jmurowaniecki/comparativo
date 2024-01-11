#
#  🜏 Makefile options:
#
 BOLD  = \033[1m
/BOLD  = \033[0m
STRING = "$(BOLD)%-10s$(/BOLD)%s\n"
HELP   = sed -E 's/(`.*`)/\\e[1m\1\\e[0m/'

DEFAULT: help

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
