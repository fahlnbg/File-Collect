#include "iDHSamplePrefsRootListController.h"

@implementation iDHSamplePrefsRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)loadView{
    [super loadView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"respring" style:UIBarButtonItemStylePlain target:self action:@selector(saveTapped)]; 
}

-(void)saveTapped {
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.idevicehacked.samplepref/respring"), NULL, NULL, YES);
}



@end
