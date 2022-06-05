#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
	if ( argc < 3 ) {
		fprintf(stderr, "At least 2 arguments are needed");
		return 1;
	}
	
	int next = 0;

	for ( int i = 0; i < argc - 2; i++ ) {
		if ( strcmp(argv[i + 2], argv[1]) == 0 ) {
			next = i + 1;
		}
	}

	if ( next > argc - 3 ) {
		next = 0;
	}

	fprintf(stdout, "%s\n", argv[next + 2]);
	return 0;	
}
