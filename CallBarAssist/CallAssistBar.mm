#line 1 "/Users/xybp888/Desktop/MyTweak/CallAssistBar-master-ios13/CallAssistBar/CallAssistBar.xm"
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
















#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class PHInCallRootViewController; @class SBLockHardwareButtonActions; @class _UIStatusBarForegroundView; @class SpringBoard; @class TUCallCenter; @class PHInCallUIUtilities; @class SBVolumeHardwareButtonActions; @class SBTelephonyManager; 
static void (*_logos_orig$_ungrouped$SBTelephonyManager$callEventHandler$)(_LOGOS_SELF_TYPE_NORMAL SBTelephonyManager* _LOGOS_SELF_CONST, SEL, NSNotification*); static void _logos_method$_ungrouped$SBTelephonyManager$callEventHandler$(_LOGOS_SELF_TYPE_NORMAL SBTelephonyManager* _LOGOS_SELF_CONST, SEL, NSNotification*); static void (*_logos_orig$_ungrouped$PHInCallRootViewController$_loadAudioCallViewController)(_LOGOS_SELF_TYPE_NORMAL PHInCallRootViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$PHInCallRootViewController$_loadAudioCallViewController(_LOGOS_SELF_TYPE_NORMAL PHInCallRootViewController* _LOGOS_SELF_CONST, SEL); static _UIStatusBarForegroundView* (*_logos_orig$_ungrouped$_UIStatusBarForegroundView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT _UIStatusBarForegroundView*, SEL, struct CGRect) _LOGOS_RETURN_RETAINED; static _UIStatusBarForegroundView* _logos_method$_ungrouped$_UIStatusBarForegroundView$initWithFrame$(_LOGOS_SELF_TYPE_INIT _UIStatusBarForegroundView*, SEL, struct CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$_UIStatusBarForegroundView$handleTapGesture$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarForegroundView* _LOGOS_SELF_CONST, SEL, UITapGestureRecognizer *); static void (*_logos_orig$_ungrouped$SBVolumeHardwareButtonActions$volumeDecreasePressDown)(_LOGOS_SELF_TYPE_NORMAL SBVolumeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBVolumeHardwareButtonActions$volumeDecreasePressDown(_LOGOS_SELF_TYPE_NORMAL SBVolumeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBVolumeHardwareButtonActions$volumeIncreasePressDown)(_LOGOS_SELF_TYPE_NORMAL SBVolumeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBVolumeHardwareButtonActions$volumeIncreasePressDown(_LOGOS_SELF_TYPE_NORMAL SBVolumeHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBLockHardwareButtonActions$performDoublePressActions)(_LOGOS_SELF_TYPE_NORMAL SBLockHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBLockHardwareButtonActions$performDoublePressActions(_LOGOS_SELF_TYPE_NORMAL SBLockHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBLockHardwareButtonActions$performSinglePressAction)(_LOGOS_SELF_TYPE_NORMAL SBLockHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBLockHardwareButtonActions$performSinglePressAction(_LOGOS_SELF_TYPE_NORMAL SBLockHardwareButtonActions* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$)(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIApplication *); static void _logos_method$_ungrouped$SpringBoard$move$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL, UIPanGestureRecognizer *); static void _logos_method$_ungrouped$SpringBoard$shouldShowEndCallBanner(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SpringBoard$shouldShowCallBanner(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SpringBoard$shouldHideCallBanner(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SpringBoard$shouldSpeakerCall(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SpringBoard$shouldAnswerCall(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SpringBoard$shouldDisconnectCall(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SpringBoard$orientationChanged(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST, SEL); 
static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$PHInCallUIUtilities(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("PHInCallUIUtilities"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$TUCallCenter(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("TUCallCenter"); } return _klass; }static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SpringBoard(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SpringBoard"); } return _klass; }
#line 56 "/Users/xybp888/Desktop/MyTweak/CallAssistBar-master-ios13/CallAssistBar/CallAssistBar.xm"
static void myshowcallbanner() {
    [[_logos_static_class_lookup$SpringBoard() sharedApplication] shouldShowCallBanner];
}
static void myhiddencallbanner() {
    [[_logos_static_class_lookup$SpringBoard() sharedApplication] shouldHideCallBanner];
}

static void myshowcallenbanner() {
    [[_logos_static_class_lookup$SpringBoard() sharedApplication] shouldShowEndCallBanner];
}



static void _logos_method$_ungrouped$SBTelephonyManager$callEventHandler$(_LOGOS_SELF_TYPE_NORMAL SBTelephonyManager* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification* arg1){
    TUCall *call = arg1.object;
 
    if(call.callStatus == 6){
       CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/hiddencallbanner", nil, nil, true);
    }
    _logos_orig$_ungrouped$SBTelephonyManager$callEventHandler$(self, _cmd, arg1);
}


@interface PHInCallUIUtilities
+ (id)sharedInstance;
+ (_Bool)isSpringBoardPasscodeLocked;
@property(nonatomic, getter=isSpringBoardLocked) _Bool springBoardLocked;
@end


 
static void _logos_method$_ungrouped$PHInCallRootViewController$_loadAudioCallViewController(_LOGOS_SELF_TYPE_NORMAL PHInCallRootViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    id incomingCallState = [[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall];
    BOOL islOcak = [_logos_static_class_lookup$PHInCallUIUtilities() isSpringBoardPasscodeLocked];
   
    if(!islOcak && incomingCallState){
        [self prepareForDismissal];
        [self dismissPhoneRemoteViewController];
        CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/showcallbanner", nil, nil, true);
    }
    
    _logos_orig$_ungrouped$PHInCallRootViewController$_loadAudioCallViewController(self, _cmd);
}



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
    [[_logos_static_class_lookup$SpringBoard() sharedApplication] orientationChanged];
}


static _UIStatusBarForegroundView* _logos_method$_ungrouped$_UIStatusBarForegroundView$initWithFrame$(_LOGOS_SELF_TYPE_INIT _UIStatusBarForegroundView* __unused self, SEL __unused _cmd, struct CGRect arg1) _LOGOS_RETURN_RETAINED{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapGesture];
    [tapGesture release];
    return _logos_orig$_ungrouped$_UIStatusBarForegroundView$initWithFrame$(self, _cmd, arg1);
}

#pragma mark langPress 长按手势事件

static void _logos_method$_ungrouped$_UIStatusBarForegroundView$handleTapGesture$(_LOGOS_SELF_TYPE_NORMAL _UIStatusBarForegroundView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UITapGestureRecognizer * sender){
    
    if (sender.state == UIGestureRecognizerStateRecognized) {
        TUCall *incomingCallInfo = [[_logos_static_class_lookup$TUCallCenter() sharedInstance]incomingCall];
      
      
        if(incomingCallInfo.callStatus != 0){
           CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/showcallbanner", nil, nil, true);
        }
    }
}




static void _logos_method$_ungrouped$SBVolumeHardwareButtonActions$volumeDecreasePressDown(_LOGOS_SELF_TYPE_NORMAL SBVolumeHardwareButtonActions* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    TUCall *incomingCallInfo = [[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall];
    if(incomingCallInfo){
        [incomingCallInfo suppressRingtone];
    }else{
        _logos_orig$_ungrouped$SBVolumeHardwareButtonActions$volumeDecreasePressDown(self, _cmd);
    }
}
static void _logos_method$_ungrouped$SBVolumeHardwareButtonActions$volumeIncreasePressDown(_LOGOS_SELF_TYPE_NORMAL SBVolumeHardwareButtonActions* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    TUCall *incomingCallInfo = [[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall];
    if(incomingCallInfo){
        [incomingCallInfo suppressRingtone];
    }else{
        _logos_orig$_ungrouped$SBVolumeHardwareButtonActions$volumeIncreasePressDown(self, _cmd);
    }
}



static void _logos_method$_ungrouped$SBLockHardwareButtonActions$performDoublePressActions(_LOGOS_SELF_TYPE_NORMAL SBLockHardwareButtonActions* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
   
    TUCall *incomingCallInfo = [[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall];
    if(incomingCallInfo){
       
        [[_logos_static_class_lookup$TUCallCenter() sharedInstance] disconnectCall:[[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall]];
    }
    _logos_orig$_ungrouped$SBLockHardwareButtonActions$performDoublePressActions(self, _cmd);
}
static void _logos_method$_ungrouped$SBLockHardwareButtonActions$performSinglePressAction(_LOGOS_SELF_TYPE_NORMAL SBLockHardwareButtonActions* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
   
    static int i = 0;
    TUCall *incomingCallInfo = [[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall];
    if(incomingCallInfo){
        [incomingCallInfo suppressRingtone];
        i = i + 1;
        if(i == 2){
           [[_logos_static_class_lookup$TUCallCenter() sharedInstance] disconnectCall:[[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall]];
            i = 0;
        }
    }else{
        _logos_orig$_ungrouped$SBLockHardwareButtonActions$performSinglePressAction(self, _cmd);
    }
}




__attribute__((used)) static UIWindow * _logos_method$_ungrouped$SpringBoard$callWindow(SpringBoard * __unused self, SEL __unused _cmd) { return (UIWindow *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$callWindow); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setCallWindow(SpringBoard * __unused self, SEL __unused _cmd, UIWindow * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$callWindow, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIView * _logos_method$_ungrouped$SpringBoard$contactView(SpringBoard * __unused self, SEL __unused _cmd) { return (UIView *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$contactView); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setContactView(SpringBoard * __unused self, SEL __unused _cmd, UIView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$contactView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIWindow * _logos_method$_ungrouped$SpringBoard$callEndWindow(SpringBoard * __unused self, SEL __unused _cmd) { return (UIWindow *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$callEndWindow); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setCallEndWindow(SpringBoard * __unused self, SEL __unused _cmd, UIWindow * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$callEndWindow, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIView * _logos_method$_ungrouped$SpringBoard$contactEndView(SpringBoard * __unused self, SEL __unused _cmd) { return (UIView *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$contactEndView); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setContactEndView(SpringBoard * __unused self, SEL __unused _cmd, UIView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$contactEndView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIButton * _logos_method$_ungrouped$SpringBoard$declineEndButton(SpringBoard * __unused self, SEL __unused _cmd) { return (UIButton *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$declineEndButton); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setDeclineEndButton(SpringBoard * __unused self, SEL __unused _cmd, UIButton * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$declineEndButton, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

__attribute__((used)) static UIButton * _logos_method$_ungrouped$SpringBoard$acceptButton(SpringBoard * __unused self, SEL __unused _cmd) { return (UIButton *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$acceptButton); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setAcceptButton(SpringBoard * __unused self, SEL __unused _cmd, UIButton * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$acceptButton, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIButton * _logos_method$_ungrouped$SpringBoard$declineButton(SpringBoard * __unused self, SEL __unused _cmd) { return (UIButton *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$declineButton); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setDeclineButton(SpringBoard * __unused self, SEL __unused _cmd, UIButton * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$declineButton, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIButton * _logos_method$_ungrouped$SpringBoard$speakerButton(SpringBoard * __unused self, SEL __unused _cmd) { return (UIButton *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$speakerButton); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setSpeakerButton(SpringBoard * __unused self, SEL __unused _cmd, UIButton * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$speakerButton, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UILabel * _logos_method$_ungrouped$SpringBoard$callerLabel(SpringBoard * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$callerLabel); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setCallerLabel(SpringBoard * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$callerLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UILabel * _logos_method$_ungrouped$SpringBoard$numberLabel(SpringBoard * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$numberLabel); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setNumberLabel(SpringBoard * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$numberLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UILabel * _logos_method$_ungrouped$SpringBoard$loactionLabel(SpringBoard * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$loactionLabel); }; __attribute__((used)) static void _logos_method$_ungrouped$SpringBoard$setLoactionLabel(SpringBoard * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SpringBoard$loactionLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIApplication * arg1){
    if(!GetPrefBool(@"kTweakEnabled")) {
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)myshowcallbanner, (CFStringRef)@"com.xybp888.CallAssist/showcallbanner", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)myhiddencallbanner, (CFStringRef)@"com.xybp888.CallAssist/hiddencallbanner", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
        CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)myshowcallenbanner, (CFStringRef)@"com.xybp888.CallAssist/showcallenbanner", NULL, (CFNotificationSuspensionBehavior)kNilOptions);
        
        CGRect screenBounds = [UIScreen mainScreen].bounds;
        
        kScreenW = [[UIScreen mainScreen] bounds].size.width;
        kScreenH = [[UIScreen mainScreen] bounds].size.height;
    
        
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
            declineImageEndView.frame = CGRectMake(50/5,50/5,31,31);
            declineImageEndView.contentMode = UIViewContentModeScaleAspectFit;
            declineImageEndView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            declineImageEndView.clipsToBounds  = YES;
            [self.declineEndButton addSubview:declineImageEndView];

            UITapGestureRecognizer *tapDisconnect = [[UITapGestureRecognizer alloc] initWithTarget:self  action:@selector(shouldDisconnectCall)];
            tapDisconnect.numberOfTapsRequired = 1;
            [self.declineEndButton addGestureRecognizer:tapDisconnect];

            [self.callEndWindow addSubview:self.declineEndButton];

        }
        
        
        
        
    
        












        if(!self.acceptButton){
            self.acceptButton = [[UIButton alloc] initWithFrame:CGRectMake(self.callWindow.frame.size.width - 80, 18, 50, 50)];
            self.acceptButton.alpha = 1;
            self.acceptButton.layer.cornerRadius = 25;
            self.acceptButton.backgroundColor = [UIColor colorWithRed:0.13 green:0.75 blue:0.42 alpha:1.0];

            UIImage *acceptImage = [UIImage imageWithContentsOfFile:@"/Library/CallAssistBar/answer.png"];
            UIImageView *acceptImageView = [[UIImageView alloc] initWithImage:acceptImage];
            acceptImageView.frame = CGRectMake(50/4,50/4,25,25);
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

















        if(!self.declineButton){

            self.declineButton = [[UIButton alloc] initWithFrame:CGRectMake(30, 18, 50, 50)];
            self.declineButton.alpha = 1;
            self.declineButton.layer.cornerRadius = 25;
            self.declineButton.backgroundColor = [UIColor colorWithRed:0.92 green:0.23 blue:0.35 alpha:1.0];

            UIImage *declineImage = [UIImage imageWithContentsOfFile:@"/Library/CallAssistBar/decline.png"];
            UIImageView *declineImageView = [[UIImageView alloc] initWithImage:declineImage];
            declineImageView.frame = CGRectMake(50/5,50/5,31,31);
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
            [self.callerLabel setBackgroundColor:[UIColor clearColor]];
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
    
 
    _logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$(self, _cmd, arg1);
}


static void _logos_method$_ungrouped$SpringBoard$move$(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIPanGestureRecognizer * recognizer) {
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;

    CGPoint translation = [recognizer translationInView:self.callWindow];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                 recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.callWindow];

    if (recognizer.state == UIGestureRecognizerStateEnded) {

        CGPoint velocity = [recognizer velocityInView:self.callWindow];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;

        float slideFactor = 0.1 * slideMult; 
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                 recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), screenBounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), screenBounds.size.height);

        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
         recognizer.view.center = finalPoint;
     } completion:nil];
    }
}


static void _logos_method$_ungrouped$SpringBoard$shouldShowEndCallBanner(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){ 
     self.callWindow.hidden = YES;
    [UIView animateWithDuration:0.3f animations:^{
        self.callEndWindow.hidden = NO;
        if(isheng){
         
           self.callEndWindow.center = CGPointMake(self.callWindow.center.x,+80);
        }else{
            self.callEndWindow.center = CGPointMake(self.callWindow.center.x,+65);
        }
    }
    completion:^(BOOL finished) {
        
    }];
}



static void _logos_method$_ungrouped$SpringBoard$shouldShowCallBanner(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){ 
    if(!self.callEndWindow.hidden){
        return;
    }
    TUCall *incomingCallInfo = [[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall];
    self.callerLabel.text = incomingCallInfo.displayContext.name; 
    self.numberLabel.text = incomingCallInfo.destinationID;
   
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
        
    }];
}

static void _logos_method$_ungrouped$SpringBoard$shouldHideCallBanner(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    [UIView animateWithDuration:0.3f animations:^{
        self.callWindow.hidden = YES;
        self.callWindow.center = CGPointMake(self.callWindow.center.x, self.callWindow.center.y);
        
        self.callEndWindow.hidden = YES;
        self.callEndWindow.center = CGPointMake(self.callWindow.center.x, self.callWindow.center.y);
        
    }
    completion:^(BOOL finished) {
        
    }];
}


static void _logos_method$_ungrouped$SpringBoard$shouldSpeakerCall(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    
   
    [[_logos_static_class_lookup$TUCallCenter() sharedInstance] answerCall:[[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall]];
    TURouteController *speaker = [[_logos_static_class_lookup$TUCallCenter() sharedInstance]routeController];
    [speaker pickRoute:speaker.speakerRoute];
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/showcallenbanner", nil, nil, true);
    
    
    
}


static void _logos_method$_ungrouped$SpringBoard$shouldAnswerCall(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    [[_logos_static_class_lookup$TUCallCenter() sharedInstance] answerCall:[[_logos_static_class_lookup$TUCallCenter() sharedInstance] incomingCall]];
     CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/showcallenbanner", nil, nil, true);
    
    
    
}

static void _logos_method$_ungrouped$SpringBoard$shouldDisconnectCall(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"com.xybp888.CallAssist/hiddencallbanner", nil, nil, true);
    [[_logos_static_class_lookup$TUCallCenter() sharedInstance] disconnectAllCalls];
}



static void _logos_method$_ungrouped$SpringBoard$orientationChanged(_LOGOS_SELF_TYPE_NORMAL SpringBoard* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
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
          
            isLandscape = YES;
            isheng = YES;
            yLoc = kScreenH / 2 - self.callWindow.frame.size.width + 30;
            xLoc = 1.0;
          
            newTransform = CGAffineTransformMakeRotation(-DegreesToRadians(90));
            break;
        }
        case UIDeviceOrientationLandscapeLeft: {
           
            isheng = YES;
            isLandscape = YES;
            yLoc = kScreenH / 2 - self.callWindow.frame.size.width/2;
            xLoc = kScreenW - kHeight - 90.0;
            newTransform = CGAffineTransformMakeRotation(DegreesToRadians(90));
            [self.callWindow setUserInteractionEnabled:YES];
            break;
        }
        case UIDeviceOrientationPortraitUpsideDown: {
          
            isLandscape = NO;
            yLoc = (kScreenH-kHeight-kLocY);
            xLoc = kLocX;
         
            newTransform = CGAffineTransformMakeRotation(DegreesToRadians(180));
            break;
        }
        case UIDeviceOrientationPortrait:
        default: {
           
            isLandscape = NO;
            isheng = NO;
            yLoc = kLocY;
            xLoc = kLocX;
          
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


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBTelephonyManager = objc_getClass("SBTelephonyManager"); MSHookMessageEx(_logos_class$_ungrouped$SBTelephonyManager, @selector(callEventHandler:), (IMP)&_logos_method$_ungrouped$SBTelephonyManager$callEventHandler$, (IMP*)&_logos_orig$_ungrouped$SBTelephonyManager$callEventHandler$);Class _logos_class$_ungrouped$PHInCallRootViewController = objc_getClass("PHInCallRootViewController"); MSHookMessageEx(_logos_class$_ungrouped$PHInCallRootViewController, @selector(_loadAudioCallViewController), (IMP)&_logos_method$_ungrouped$PHInCallRootViewController$_loadAudioCallViewController, (IMP*)&_logos_orig$_ungrouped$PHInCallRootViewController$_loadAudioCallViewController);Class _logos_class$_ungrouped$_UIStatusBarForegroundView = objc_getClass("_UIStatusBarForegroundView"); MSHookMessageEx(_logos_class$_ungrouped$_UIStatusBarForegroundView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$_UIStatusBarForegroundView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$_UIStatusBarForegroundView$initWithFrame$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UITapGestureRecognizer *), strlen(@encode(UITapGestureRecognizer *))); i += strlen(@encode(UITapGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$_UIStatusBarForegroundView, @selector(handleTapGesture:), (IMP)&_logos_method$_ungrouped$_UIStatusBarForegroundView$handleTapGesture$, _typeEncoding); }Class _logos_class$_ungrouped$SBVolumeHardwareButtonActions = objc_getClass("SBVolumeHardwareButtonActions"); MSHookMessageEx(_logos_class$_ungrouped$SBVolumeHardwareButtonActions, @selector(volumeDecreasePressDown), (IMP)&_logos_method$_ungrouped$SBVolumeHardwareButtonActions$volumeDecreasePressDown, (IMP*)&_logos_orig$_ungrouped$SBVolumeHardwareButtonActions$volumeDecreasePressDown);MSHookMessageEx(_logos_class$_ungrouped$SBVolumeHardwareButtonActions, @selector(volumeIncreasePressDown), (IMP)&_logos_method$_ungrouped$SBVolumeHardwareButtonActions$volumeIncreasePressDown, (IMP*)&_logos_orig$_ungrouped$SBVolumeHardwareButtonActions$volumeIncreasePressDown);Class _logos_class$_ungrouped$SBLockHardwareButtonActions = objc_getClass("SBLockHardwareButtonActions"); MSHookMessageEx(_logos_class$_ungrouped$SBLockHardwareButtonActions, @selector(performDoublePressActions), (IMP)&_logos_method$_ungrouped$SBLockHardwareButtonActions$performDoublePressActions, (IMP*)&_logos_orig$_ungrouped$SBLockHardwareButtonActions$performDoublePressActions);MSHookMessageEx(_logos_class$_ungrouped$SBLockHardwareButtonActions, @selector(performSinglePressAction), (IMP)&_logos_method$_ungrouped$SBLockHardwareButtonActions$performSinglePressAction, (IMP*)&_logos_orig$_ungrouped$SBLockHardwareButtonActions$performSinglePressAction);Class _logos_class$_ungrouped$SpringBoard = objc_getClass("SpringBoard"); MSHookMessageEx(_logos_class$_ungrouped$SpringBoard, @selector(applicationDidFinishLaunching:), (IMP)&_logos_method$_ungrouped$SpringBoard$applicationDidFinishLaunching$, (IMP*)&_logos_orig$_ungrouped$SpringBoard$applicationDidFinishLaunching$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIPanGestureRecognizer *), strlen(@encode(UIPanGestureRecognizer *))); i += strlen(@encode(UIPanGestureRecognizer *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(move:), (IMP)&_logos_method$_ungrouped$SpringBoard$move$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(shouldShowEndCallBanner), (IMP)&_logos_method$_ungrouped$SpringBoard$shouldShowEndCallBanner, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(shouldShowCallBanner), (IMP)&_logos_method$_ungrouped$SpringBoard$shouldShowCallBanner, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(shouldHideCallBanner), (IMP)&_logos_method$_ungrouped$SpringBoard$shouldHideCallBanner, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(shouldSpeakerCall), (IMP)&_logos_method$_ungrouped$SpringBoard$shouldSpeakerCall, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(shouldAnswerCall), (IMP)&_logos_method$_ungrouped$SpringBoard$shouldAnswerCall, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(shouldDisconnectCall), (IMP)&_logos_method$_ungrouped$SpringBoard$shouldDisconnectCall, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(orientationChanged), (IMP)&_logos_method$_ungrouped$SpringBoard$orientationChanged, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIWindow *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(callWindow), (IMP)&_logos_method$_ungrouped$SpringBoard$callWindow, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIWindow *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setCallWindow:), (IMP)&_logos_method$_ungrouped$SpringBoard$setCallWindow, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIView *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(contactView), (IMP)&_logos_method$_ungrouped$SpringBoard$contactView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIView *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setContactView:), (IMP)&_logos_method$_ungrouped$SpringBoard$setContactView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIWindow *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(callEndWindow), (IMP)&_logos_method$_ungrouped$SpringBoard$callEndWindow, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIWindow *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setCallEndWindow:), (IMP)&_logos_method$_ungrouped$SpringBoard$setCallEndWindow, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIView *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(contactEndView), (IMP)&_logos_method$_ungrouped$SpringBoard$contactEndView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIView *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setContactEndView:), (IMP)&_logos_method$_ungrouped$SpringBoard$setContactEndView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(declineEndButton), (IMP)&_logos_method$_ungrouped$SpringBoard$declineEndButton, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setDeclineEndButton:), (IMP)&_logos_method$_ungrouped$SpringBoard$setDeclineEndButton, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(acceptButton), (IMP)&_logos_method$_ungrouped$SpringBoard$acceptButton, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setAcceptButton:), (IMP)&_logos_method$_ungrouped$SpringBoard$setAcceptButton, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(declineButton), (IMP)&_logos_method$_ungrouped$SpringBoard$declineButton, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setDeclineButton:), (IMP)&_logos_method$_ungrouped$SpringBoard$setDeclineButton, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIButton *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(speakerButton), (IMP)&_logos_method$_ungrouped$SpringBoard$speakerButton, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIButton *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setSpeakerButton:), (IMP)&_logos_method$_ungrouped$SpringBoard$setSpeakerButton, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(callerLabel), (IMP)&_logos_method$_ungrouped$SpringBoard$callerLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setCallerLabel:), (IMP)&_logos_method$_ungrouped$SpringBoard$setCallerLabel, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(numberLabel), (IMP)&_logos_method$_ungrouped$SpringBoard$numberLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setNumberLabel:), (IMP)&_logos_method$_ungrouped$SpringBoard$setNumberLabel, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(loactionLabel), (IMP)&_logos_method$_ungrouped$SpringBoard$loactionLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SpringBoard, @selector(setLoactionLabel:), (IMP)&_logos_method$_ungrouped$SpringBoard$setLoactionLabel, _typeEncoding); } } }
#line 608 "/Users/xybp888/Desktop/MyTweak/CallAssistBar-master-ios13/CallAssistBar/CallAssistBar.xm"
