#include <stdio.h>
#include <string.h>
#include <X11/Xlib.h>
#include <X11/Xresource.h>

// Prints value of Xresource

void print_usage() {
	fprintf(stderr, "usage:\n  xrdbget [resource name]\n  xrdbget [display name] [resource name]");

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

	if (argc > 2) {
		display_name = argv[1];
		resource_name = argv[2];
	}

	Display *display = XOpenDisplay(display_name);
	if (display == NULL) {
		fprintf(stderr, "Could not establish connection to X display %s\n", XDisplayName(display_name));
		return 1;
	}
	
	XGetDefault(display, "", "");
	char *manager_string = XResourceManagerString(display);

	if (manager_string == NULL) {
		fprintf(stderr, "Manager string is NULL\n");
		return 1;
	}

	XrmDatabase db = XrmGetStringDatabase(manager_string);

	if (db == NULL) {
		fprintf(stderr, "Could not get database");
		return 1;
	}

	XrmValue val;
	
	char *value_type;
	XrmGetResource(db, resource_name, "", &value_type, &val);
	
	if (value_type == NULL) {
		fprintf(stderr, "No value for resource %s found.\n", resource_name);
		return 1;
	}
		
	printf("%s\n", val.addr);

	return 0;
}
