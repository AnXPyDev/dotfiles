main: compile

fast: build compile deploy

env: FRC
	util/mkenv.sh $(TARGET) $(ENVDIR)

deploy: FRC
	util/deploy.sh $(ENVDIR)

build: FRC
	util/build.sh

compile: FRC
	make -f compile.make compile

clean: FRC
	rm -rf build compile.make

cleanenv: FRC
	rm -rf env

FRC:
