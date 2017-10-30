.DEFAULT_GOAL := default

update:
	carthage update --cache-builds

bootstrap:
	carthage bootstrap --cache-builds

default: bootstrap
	