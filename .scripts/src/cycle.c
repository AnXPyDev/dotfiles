#include <stdio.h>
#include <string.h>

int main(int argc, char **argv) {
	if (argc < 2) {
		return 1;
	} else if (argc == 2) {
		puts(argv[1]);
		return 0;
	}

	for (unsigned int i = 2; i < argc; i++) {
		if (strcmp(argv[1], argv[i]) == 0) {
			if (i + 1 >= argc) {
				puts(argv[2]);
			} else {
				puts(argv[i + 1]);
			}

			return 0;
		}
	}

	puts(argv[2]);

	return 0;
}
