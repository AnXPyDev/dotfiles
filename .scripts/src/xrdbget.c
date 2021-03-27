#include <stdio.h>
#include <string.h>
#include <X11/Xlib.h>
#include <X11/Xresource.h>

// Prints value of Xresource

void print_usage() {
	fputs("usage:\n  xrdbget [resource name]\n  xrdbget [display name] [resource name]", stderr);

}


int main(int argc, char **argv) {
	if (argc < 2) {
		fputs("No resource name provided\n", stderr);
		return 1;
	}

	if (strcmp(argv[1], "-h") == 0 || strcmp(argv[1], "--help") == 0) {
		print_usage();
		return 0;
	}

	char *display_name = NULL;
	char *resource_name = argv[1];

	printf("display_name %s\n", display_name);

	if (argc > 2) {
		display_name = argv[1];
		resource_name = argv[2];
	}

	printf("resource_name %s\n", resource_name);

	Display *display = XOpenDisplay(display_name);
	if (display == NULL) {
		fprintf(stderr, "Could not establish connection to X display %s\n", XDisplayName(display_name));
		return 1;
	}
	
	XrmInitialize();
	XrmDatabase db = XrmGetDatabase(display);


	if (db == NULL) {
		fprintf(stderr, "Could not get database from X display %s\n", XDisplayName(display_name));
		return 1;
	}

	return 0;
}
