.DEFAULT_GOAL := default

update:
	carthage update --cache-builds --platform "iOS"

bootstrap:
	carthage bootstrap --cache-builds --platform "iOS"

default: bootstrap
	