main: compile

env: FRC
	util/mkenv.sh $(TARGET) $(ENVDIR)

deploy: FRC
	util/deploy.sh $(ENVDIR)

build: FRC
	util/build.sh

compile: FRC
	make -f compile.make compile

clean: FRC
	rm -r build env compile.make

FRC:
