#import <UIKit/UIKit.h>
#import "TUCall.h"
#import <AddressBook/AddressBook.h>
#import "getLocation.h"

#define PLIST_PATH @"/var/mobile/Library/Preferences/com.xybp888.test.plist"   
 
inline bool GetPrefBool(NSString *key){
  return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

@interface PHInCallRootViewController:UIViewController
@property (retain, nonatomic) UIViewController* CallViewController;
@property (assign) BOOL dismissalWasDemandedBeforeRemoteViewControllerWasAvailable;
@property(retain, nonatomic) TUCall *alertActivationCall;
+(id)sharedInstance;
+(void)setShouldForceDismiss;
-(void)prepareForDismissal;
-(void)dismissPhoneRemoteViewController;
-(void)presentPhoneRemoteViewControllerForView:(id)arg1;
@end

@interface SpringBoard <UIGestureRecognizerDelegate>
@property (retain, nonatomic) UIWindow *callWindow;
@property (retain, nonatomic) UIButton *contactView;
@property (retain, nonatomic) UIButton *acceptButton;
@property (retain, nonatomic) UIButton *declineButton;
@property (retain, nonatomic) UIButton *speakerButton;
@property (retain, nonatomic) UILabel *callerLabel;
@property (retain, nonatomic) UILabel *numberLabel;
@property (retain, nonatomic) UILabel *loactionLabel;

@property (retain, nonatomic) UIWindow *callEndWindow;
@property (retain, nonatomic) UIView *contactEndView;
@property (retain, nonatomic) UIButton *declineEndButton;

+(id)sharedApplication;
-(void)shouldShowCallBanner;
-(void)shouldHideCallBanner;
@end


/*
%hook TUCall
-(void)_handleStatusChange {
    %orig;
    id incomingCallState = [[%c(TUCallCenter) sharedInstance] incomingCall];
    if(incomingCallState){
        [[%c(SpringBoard) sharedApplication] shouldShowCallBanner];
    }else{
        [[%c(SpringBoard) sharedApplication] shouldHideCallBanner];
    }
}
%end
*/
static void myshowcallbanner() {
    [[%c(SpringBoard) sharedApplication] shouldShowCallBanner];
}
static void myhiddencallbanner() {
    [[%c(SpringBoard) sharedApplication] shouldHideCallBanner];
}

static void myshowcallenbanner() {
    [[%c(SpringBoard) sharedApplication] shouldShowEndCallBanner];
}


%hook SBTelephonyManager
- (void)callEventHandler:(NSNotification*)arg1{
    TUCall *call = arg1.object;
 //   NSLog(@"测试=%@",call);
    if(call.callStatus == 6){
       CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/hiddencallbanner", nil, nil, true);
    }
    %orig;
}
%end

@interface PHInCallUIUtilities
+ (id)sharedInstance;
+ (_Bool)isSpringBoardPasscodeLocked;
@property(nonatomic, getter=isSpringBoardLocked) _Bool springBoardLocked;
@end


%hook PHInCallRootViewController //锁定显示正常界面
- (void)_loadAudioCallViewController{
    id incomingCallState = [[%c(TUCallCenter) sharedInstance] incomingCall];
    BOOL islOcak = [%c(PHInCallUIUtilities) isSpringBoardPasscodeLocked];
   // NSLog(@"测试=%d",islOcak);
    if(!islOcak && incomingCallState){
        [self prepareForDismissal];
        [self dismissPhoneRemoteViewController];
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/showcallbanner", nil, nil, true);
    }
    
    %orig;
}
%end


@interface UIWindow ()
- (void)_setSecure:(BOOL)arg1;
@end
@interface UIApplication ()
- (UIDeviceOrientation)_frontMostAppOrientation;
@end

static float kScreenW;
static float kScreenH;
static UIDeviceOrientation orientationOld;
static BOOL forceNewLocation;
static float kWidth = 63.0;
static float kHeight = 13.0;
static int kLocX;
static int kLocY;
static BOOL isheng;

static void orientationChanged()
{
    [[%c(SpringBoard) sharedApplication] orientationChanged];
}

%hook _UIStatusBarForegroundView
- (id)initWithFrame:(struct CGRect)arg1{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapGesture];
    [tapGesture release];
    return %orig;
}

#pragma mark langPress 长按手势事件
%new
-(void)handleTapGesture:(UITapGestureRecognizer *)sender{
    //进行判断,在什么时候触发事件
    if (sender.state == UIGestureRecognizerStateRecognized) {
        TUCall *incomingCallInfo = [[%c(TUCallCenter) sharedInstance]incomingCall];
      //  NSLog(@"双击测试=%d",incomingCallInfo.callStatus);
      //  [[%c(SpringBoard) sharedApplication] shouldShowCallBanner];
        if(incomingCallInfo.callStatus != 0){
           CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/showcallbanner", nil, nil, true);
        }
    }
}
%end


%hook SBVolumeHardwareButtonActions
- (void)volumeDecreasePressDown{
    TUCall *incomingCallInfo = [[%c(TUCallCenter) sharedInstance] incomingCall];
    if(incomingCallInfo){
        [incomingCallInfo suppressRingtone];
    }else{
        %orig;
    }
}
- (void)volumeIncreasePressDown{
    TUCall *incomingCallInfo = [[%c(TUCallCenter) sharedInstance] incomingCall];
    if(incomingCallInfo){
        [incomingCallInfo suppressRingtone];
    }else{
        %orig;
    }
}
%end

%hook SBLockHardwareButtonActions
- (void)performDoublePressActions{
   // NSLog(@"测试=双击");
    TUCall *incomingCallInfo = [[%c(TUCallCenter) sharedInstance] incomingCall];
    if(incomingCallInfo){
       // [incomingCallInfo setActive:YES];
        [[%c(TUCallCenter) sharedInstance] disconnectCall:[[%c(TUCallCenter) sharedInstance] incomingCall]];
    }
    %orig;
}
- (void)performSinglePressAction{
   // NSLog(@"测试=单击");
    static int i = 0;
    TUCall *incomingCallInfo = [[%c(TUCallCenter) sharedInstance] incomingCall];
    if(incomingCallInfo){
        [incomingCallInfo suppressRingtone];
        i = i + 1;
        if(i == 2){
           [[%c(TUCallCenter) sharedInstance] disconnectCall:[[%c(TUCallCenter) sharedInstance] incomingCall]];
            i = 0;
        }
    }else{
        %orig;
    }
}
%end


%hook SpringBoard
%property (retain, nonatomic) UIWindow *callWindow;
%property (retain, nonatomic) UIView *contactView;
%property (retain, nonatomic) UIWindow *callEndWindow;
%property (retain, nonatomic) UIView *contactEndView;
%property (retain, nonatomic) UIButton *declineEndButton;

%property (retain, nonatomic) UIButton *acceptButton;
%property (retain, nonatomic) UIButton *declineButton;
%property (retain, nonatomic) UIButton *speakerButton;
%property (retain, nonatomic) UILabel *callerLabel;
%property (retain, nonatomic) UILabel *numberLabel;
%property (retain, nonatomic) UILabel *loactionLabel;

- (void)applicationDidFinishLaunching:(UIApplication *)arg1{
    if(!GetPrefBool(@"kTweakEnabled")) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)myshowcallbanner, (CFStringRef)@"com.xybp888.CallAssist/showcallbanner", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)myhiddencallbanner, (CFStringRef)@"com.xybp888.CallAssist/hiddencallbanner", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)myshowcallenbanner, (CFStringRef)@"com.xybp888.CallAssist/showcallenbanner", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
        
        CGRect screenBounds = [UIScreen mainScreen].bounds;
        
        kScreenW = [[UIScreen mainScreen] bounds].size.width;
        kScreenH = [[UIScreen mainScreen] bounds].size.height;
    //    NSLog(@"测试Call");
        // Call Banner
        self.callWindow = [[UIWindow alloc] initWithFrame:CGRectMake(10, 35, screenBounds.size.width - 20, 85)];
        self.callWindow.backgroundColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:0.0];
        kLocX = self.callWindow.frame.origin.x;
        kLocY = self.callWindow.frame.origin.y;
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = self.callWindow.bounds;
        blurEffectView.layer.cornerRadius = 20;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [blurEffectView.layer setMasksToBounds:YES];
        [self.callWindow addSubview:blurEffectView];

        self.callWindow.windowLevel = UIWindowLevelAlert-10;
        self.callWindow.layer.cornerRadius = 20;
        self.callWindow.userInteractionEnabled = YES;
        [self.callWindow setHidden:NO];
        [self.callWindow.layer setMasksToBounds:YES];
      
        static UISwipeGestureRecognizer* swipeUpGesture;
        swipeUpGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(shouldHideCallBanner)];
        swipeUpGesture.direction = UISwipeGestureRecognizerDirectionUp;
        [self.callWindow addGestureRecognizer:swipeUpGesture];
        
        
        //挂断窗口
        self.callEndWindow = [[UIWindow alloc] initWithFrame:CGRectMake(10, 35, 60, 60)];
        [blurEffectView.layer setMasksToBounds:YES];
        [self.callWindow addSubview:blurEffectView];
        self.callEndWindow.windowLevel = UIWindowLevelAlert-10;
        self.callEndWindow.layer.cornerRadius = 20;
        self.callEndWindow.userInteractionEnabled = YES;
        self.callEndWindow.backgroundColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:0.0];
        [self.callEndWindow setHidden:NO];
        [self.callEndWindow.layer setMasksToBounds:YES];
        
        if(!self.declineEndButton){
            self.declineEndButton = [[UIButton alloc] initWithFrame:CGRectMake(3, 3, 50, 50)];
            self.declineEndButton.alpha = 1;
            self.declineEndButton.layer.cornerRadius = 25;
            self.declineEndButton.backgroundColor = [UIColor colorWithRed:0.92 green:0.23 blue:0.35 alpha:1.0];

            UIImage *declineImageEnd = [UIImage imageWithContentsOfFile:@"/Library/CallAssistBar/decline.png"];
            UIImageView *declineImageEndView = [[UIImageView alloc] initWithImage:declineImageEnd];
            declineImageEndView.frame = CGRectMake(50/5,50/5,31,31);//self.declineButton.bounds ;
            declineImageEndView.contentMode = UIViewContentModeScaleAspectFit;
            declineImageEndView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            declineImageEndView.clipsToBounds  = YES;
            [self.declineEndButton addSubview:declineImageEndView];

            UITapGestureRecognizer *tapDisconnect = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(shouldDisconnectCall)];
            tapDisconnect.numberOfTapsRequired = 1;
            [self.declineEndButton addGestureRecognizer:tapDisconnect];

            [self.callEndWindow addSubview:self.declineEndButton];

        }
        
        
        
        
    
        //Banner Elements
/*
        if(!self.contactView){ // 联系人头像

            self.contactView = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 70, 70)];
            self.contactView.alpha = 1;
            self.contactView.layer.cornerRadius = 35;
            self.contactView.backgroundColor = [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.7];

            [self.callWindow addSubview:self.contactView];

        }
*/
        if(!self.acceptButton){
            self.acceptButton = [[UIButton alloc] initWithFrame:CGRectMake(self.callWindow.frame.size.width - 80, 18, 50, 50)];
            self.acceptButton.alpha = 1;
            self.acceptButton.layer.cornerRadius = 25;
            self.acceptButton.backgroundColor = [UIColor colorWithRed:0.13 green:0.75 blue:0.42 alpha:1.0];

            UIImage *acceptImage = [UIImage imageWithContentsOfFile:@"/Library/CallAssistBar/answer.png"];
            UIImageView *acceptImageView = [[UIImageView alloc] initWithImage:acceptImage];
            acceptImageView.frame = CGRectMake(50/4,50/4,25,25);//self.acceptButton.bounds;
            acceptImageView.contentMode = UIViewContentModeScaleAspectFit;
            acceptImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            acceptImageView.clipsToBounds  = YES;
            [self.acceptButton addSubview:acceptImageView];

            UITapGestureRecognizer *tapAnswer = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(shouldAnswerCall)];
            tapAnswer.numberOfTapsRequired = 1;
            
            UILongPressGestureRecognizer *tapSpeaker = [[UILongPressGestureRecognizer alloc] initWithTarget:self  action:@selector(shouldSpeakerCall)];
            
            [self.acceptButton addGestureRecognizer:tapAnswer];
            [self.acceptButton addGestureRecognizer:tapSpeaker];

            [self.callWindow addSubview:self.acceptButton];

        }
/*
        if(!self.speakerButton){

            self.speakerButton = [[UIButton alloc] initWithFrame:CGRectMake(self.callWindow.frame.size.width - 138, 18, 50, 50)];
            self.speakerButton.alpha = 1;
            self.speakerButton.hidden = YES;
            self.speakerButton.layer.cornerRadius = 25;
            self.speakerButton.backgroundColor = [UIColor colorWithRed:0.20 green:0.60 blue:0.86 alpha:1.0];

            UITapGestureRecognizer *tapSpeaker = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(shouldAnswerCall)];
            tapSpeaker.numberOfTapsRequired = 1;
            [self.speakerButton addGestureRecognizer:tapSpeaker];

            [self.callWindow addSubview:self.speakerButton];

        }
*/
        if(!self.declineButton){

            self.declineButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 18, 50, 50)];
            self.declineButton.alpha = 1;
            self.declineButton.layer.cornerRadius = 25;
            self.declineButton.backgroundColor = [UIColor colorWithRed:0.92 green:0.23 blue:0.35 alpha:1.0];

            UIImage *declineImage = [UIImage imageWithContentsOfFile:@"/Library/CallAssistBar/decline.png"];
            UIImageView *declineImageView = [[UIImageView alloc] initWithImage:declineImage];
            declineImageView.frame = CGRectMake(50/5,50/5,31,31);//self.declineButton.bounds ;
            declineImageView.contentMode = UIViewContentModeScaleAspectFit;
            declineImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            declineImageView.clipsToBounds  = YES;
            [self.declineButton addSubview:declineImageView];

            UITapGestureRecognizer *tapDisconnect = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(shouldDisconnectCall)];
            tapDisconnect.numberOfTapsRequired = 1;
            [self.declineButton addGestureRecognizer:tapDisconnect];

            [self.callWindow addSubview:self.declineButton];

        }
        
        float xsize = self.declineButton.frame.origin.x + self.declineButton.frame.size.width;
        float ysize = self.acceptButton.frame.origin.x - 80;
        if (!self.callerLabel){
            self.callerLabel = [[UILabel alloc] initWithFrame:CGRectMake(xsize, 0, ysize, 42)];
            [self.callerLabel setTextColor:[UIColor whiteColor]];
            [self.callerLabel setBackgroundColor:[UIColor clearColor]];//clearColor
            [self.callerLabel setFont:[UIFont boldSystemFontOfSize:18]];
            self.callerLabel.textAlignment = NSTextAlignmentCenter;
            self.callerLabel.text = @"简约来电";
            [self.callWindow addSubview:self.callerLabel];
        }

        if (!self.numberLabel){
            self.numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(xsize, 25, ysize, 40)];
            [self.numberLabel setTextColor:[UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.7]];
            [self.numberLabel setBackgroundColor:[UIColor clearColor]];
            [self.numberLabel setFont:[UIFont systemFontOfSize:15]];
            self.numberLabel.textAlignment = NSTextAlignmentCenter;
            self.numberLabel.text = @"188 8888 8888";
            [self.callWindow addSubview:self.numberLabel];
        }
        
        if(!self.loactionLabel){
            self.loactionLabel = [[UILabel alloc] initWithFrame:CGRectMake(xsize, 45, ysize, 45)];
            [self.loactionLabel setTextColor:[UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:0.7]];
            [self.loactionLabel setBackgroundColor:[UIColor clearColor]];
            [self.loactionLabel setFont:[UIFont systemFontOfSize:15]];
            self.loactionLabel.textAlignment = NSTextAlignmentCenter;
            self.loactionLabel.text = @"中国移不动";
            [self.callWindow addSubview:self.loactionLabel];
        }
        
        self.callWindow.hidden = YES;
        self.callEndWindow.hidden = YES;
    }
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)&orientationChanged, CFSTR("com.apple.springboard.screenchanged"), NULL, 0);
    CFNotificationCenterAddObserver(CFNotificationCenterGetLocalCenter(), NULL, (CFNotificationCallback)&orientationChanged, CFSTR("UIWindowDidRotateNotification"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    
 //   [self shouldShowCallBanner]; //调试可以打开
    %orig;
}

%new
- (void)move:(UIPanGestureRecognizer *)recognizer {
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;

    CGPoint translation = [recognizer translationInView:self.callWindow];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                 recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.callWindow];

    if (recognizer.state == UIGestureRecognizerStateEnded) {

        CGPoint velocity = [recognizer velocityInView:self.callWindow];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;

        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                 recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), screenBounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), screenBounds.size.height);

        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
         recognizer.view.center = finalPoint;
     } completion:nil];
    }
}

%new
- (void)shouldShowEndCallBanner{ //显示Bar
     self.callWindow.hidden = YES;
    [UIView animateWithDuration:0.3f animations:^{
        self.callEndWindow.hidden = NO;
        if(isheng){
         //   CGRect screenBounds = [UIScreen mainScreen].bounds;
           self.callEndWindow.center = CGPointMake(self.callWindow.center.x,+80);
        }else{
            self.callEndWindow.center = CGPointMake(self.callWindow.center.x,+65);
        }
    }
    completion:^(BOOL finished) {
        //[self performSelector:@selector(volumeSliderShouldHide) withObject:self afterDelay:3.0 ];
    }];
}


%new
- (void)shouldShowCallBanner{ //显示Bar
    if(!self.callEndWindow.hidden){
        return;
    }
    TUCall *incomingCallInfo = [[%c(TUCallCenter) sharedInstance] incomingCall];
    self.callerLabel.text = incomingCallInfo.displayContext.name; //localizedLabel
    self.numberLabel.text = incomingCallInfo.destinationID;
   // NSLog(@"测试 = %@",[incomingCallInfo provider]);
    if(incomingCallInfo.displayContext.callDirectoryLabel == nil){
        NSString *locationStr = [ZSLocation getLocation:incomingCallInfo.destinationID];
        if([locationStr containsString:@"数据库"]){
            locationStr = @"";
        }
        self.loactionLabel.text = locationStr;
    }else{
        self.loactionLabel.text = incomingCallInfo.displayContext.callDirectoryLabel;
    }
    if([incomingCallInfo.provider.localizedName hasPrefix:@"微信"]){
        self.loactionLabel.text = @"腾讯微信音频";
    }
    if([incomingCallInfo.provider.localizedName hasPrefix:@"QQ"]){
           self.loactionLabel.text = @"腾讯QQ音频";
    }
    if([incomingCallInfo.provider.localizedName hasPrefix:@"无忧"]){
           self.loactionLabel.text = @"无忧行音频";
    }
   
    [UIView animateWithDuration:0.3f animations:^{
        self.callWindow.hidden = NO;
        self.callEndWindow.hidden = YES;
        if(isheng){
         //   CGRect screenBounds = [UIScreen mainScreen].bounds;
           self.callWindow.center = CGPointMake(self.callWindow.center.x,+215);
        }else{
            self.callWindow.center = CGPointMake(self.callWindow.center.x, +85);
        }
        if(incomingCallInfo == nil){
            self.callWindow.hidden = YES;
        }
    }
    completion:^(BOOL finished) {
        if(incomingCallInfo == nil){
            self.callWindow.hidden = YES;
        }
        //[self performSelector:@selector(volumeSliderShouldHide) withObject:self afterDelay:3.0 ];
    }];
}
%new
- (void)shouldHideCallBanner{
    [UIView animateWithDuration:0.3f animations:^{
        self.callWindow.hidden = YES;
        self.callWindow.center = CGPointMake(self.callWindow.center.x, self.callWindow.center.y);
        
        self.callEndWindow.hidden = YES;
        self.callEndWindow.center = CGPointMake(self.callWindow.center.x, self.callWindow.center.y);
        
    }
    completion:^(BOOL finished) {
        //[self performSelector:@selector(volumeSliderShouldHide) withObject:self afterDelay:3.0 ];
    }];
}

%new
-(void)shouldSpeakerCall{
    
   // NSLog(@"测试长按");
    [[%c(TUCallCenter) sharedInstance] answerCall:[[%c(TUCallCenter) sharedInstance] incomingCall]];
    TURouteController *speaker = [[%c(TUCallCenter) sharedInstance]routeController];
    [speaker pickRoute:speaker.speakerRoute];
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/showcallenbanner", nil, nil, true);
    //If we wanna replace the answer button with a speaker button
    //self.acceptButton.hidden = YES;
    //self.speakerButton.hidden = NO;
}

%new
-(void)shouldAnswerCall{
    [[%c(TUCallCenter) sharedInstance] answerCall:[[%c(TUCallCenter) sharedInstance] incomingCall]];
     CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/showcallenbanner", nil, nil, true);
    //If we wanna replace the answer button with a speaker button
    //self.acceptButton.hidden = YES;
    //self.speakerButton.hidden = NO;
}
%new
-(void)shouldDisconnectCall{
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/hiddencallbanner", nil, nil, true);
    [[%c(TUCallCenter) sharedInstance] disconnectAllCalls];
}

%new
- (void)orientationChanged
{
    UIDeviceOrientation orientation = [[UIApplication sharedApplication] _frontMostAppOrientation];
    if(orientation == orientationOld && !forceNewLocation) {
        return;
    }
    forceNewLocation = NO;
    BOOL isLandscape;
    __block CGAffineTransform newTransform;
    __block int xLoc;
    __block int yLoc;
#define DegreesToRadians(degrees) (degrees * M_PI / 180)
    switch (orientation) {
        case UIDeviceOrientationLandscapeRight: {
          //  NSLog(@"测试1"); //横屏隐藏
            isLandscape = YES;
            isheng = YES;
            yLoc = kScreenH / 2 - self.callWindow.frame.size.width + 30;//kLocX;
            xLoc = 1.0;//kLocY;
          //  [self.callWindow setUserInteractionEnabled:NO];
            newTransform = CGAffineTransformMakeRotation(-DegreesToRadians(90));
            break;
        }
        case UIDeviceOrientationLandscapeLeft: {
           // NSLog(@"测试2"); //横屏隐藏
            isheng = YES;
            isLandscape = YES;
            yLoc = kScreenH / 2 - self.callWindow.frame.size.width/2;
            xLoc = kScreenW - kHeight - 90.0;//(kScreenW-kHeight-kLocY);
            newTransform = CGAffineTransformMakeRotation(DegreesToRadians(90));
            [self.callWindow setUserInteractionEnabled:YES];
            break;
        }
        case UIDeviceOrientationPortraitUpsideDown: {
          //  NSLog(@"测试3");
            isLandscape = NO;
            yLoc = (kScreenH-kHeight-kLocY);
            xLoc = kLocX;
         //   [self.callWindow setUserInteractionEnabled:NO];
            newTransform = CGAffineTransformMakeRotation(DegreesToRadians(180));
            break;
        }
        case UIDeviceOrientationPortrait:
        default: {
           // NSLog(@"测试4");
            isLandscape = NO;
            isheng = NO;
            yLoc = kLocY;
            xLoc = kLocX;
          //  [self.callWindow setUserInteractionEnabled:YES];
            newTransform = CGAffineTransformMakeRotation(DegreesToRadians(0));
            break;
        }
    }
    
    [UIView animateWithDuration:0.3f animations:^{
        [self.callWindow setTransform:newTransform];
        CGRect frame = self.callWindow.frame;
        frame.origin.y = yLoc;
        frame.origin.x = xLoc;
        self.callWindow.frame = frame;
        orientationOld = orientation;
    } completion:nil];
}

%end
