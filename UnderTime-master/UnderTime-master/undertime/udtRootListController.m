#include "udtRootListController.h"
#import <spawn.h>

@implementation udtRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}


-(void) respring {
pid_t pid;
int status;
posix_spawn(&pid, "/usr/bin/uicache", NULL, NULL, NULL, NULL);
const char* args[] = {"killall", "-9", "backboardd", NULL};
posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
waitpid(pid, &status, WEXITED);
}
@end
