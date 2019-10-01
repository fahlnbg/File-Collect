//Respring function, needed to perform a proper respring.
@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)exitAndRelaunch:(bool)arg1;
@end

static void RespringDevice() {
    [[%c(FBSystemService) sharedInstance] exitAndRelaunch:YES];
}
//End respring
//Start Prefs
@interface NSUserDefaults (SamplePrefs)
-(id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
-(void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

static NSString *nsDomainString = @"com.idevicehacked.samplepref";
static NSString *nsNotificationString = @"com.idevicehacked.samplepref/preferences.changed";

static BOOL showAlert;

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
  
    NSNumber *eShowAlert = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"showAlert" inDomain:nsDomainString];

    showAlert = (eShowAlert)? [eShowAlert boolValue]:NO;

}
//End Prefs


%hook SBHomeScreenViewController

- (void)viewWillLayoutSubviews {
    if (showAlert) {
    %orig;
    UIAlertController *alert =   [UIAlertController
                alertControllerWithTitle:@"Alert"
                message:@"Uninstall this package now :)"
                preferredStyle:UIAlertControllerStyleAlert];


    UIAlertAction *okAction = [UIAlertAction
                actionWithTitle:@"Ok"
                style:UIAlertActionStyleCancel
                handler:^(UIAlertAction *action) {
                  
                }];

    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
  }
}

%end



%ctor {
//Start Prefs
  notificationCallback(NULL, NULL, NULL, NULL, NULL);
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
    NULL,
    notificationCallback,
    (CFStringRef)nsNotificationString,
    NULL,
    CFNotificationSuspensionBehaviorCoalesce);
//End Prefs
//Respring
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)RespringDevice, CFSTR("com.idevicehacked.samplepref/respring"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
