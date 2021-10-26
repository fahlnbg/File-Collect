//
//  getLocation.m
//  CallAssist
//
//  Created by 王平 on 2018/10/7.
//

#import "getLocation.h"
#import "area.h"

@implementation ZSLocation
+ (NSString *)getLocation:(NSString *)mPhoneNumber{
    NSString *str = mPhoneNumber;
    str = [mPhoneNumber stringByReplacingOccurrencesOfString:@" " withString:@""];//传入电话号码
    str = [str stringByReplacingOccurrencesOfString:@"-" withString:@""];//传入电话号码
    str = [str stringByReplacingOccurrencesOfString:@"(" withString:@""];//传入电话号码
    str = [str stringByReplacingOccurrencesOfString:@")" withString:@""];//传入电话号码
    str = [str stringByReplacingOccurrencesOfString:@"\\p{Cf}" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, str.length)];
    Area *area = Area_load("/Library/iPhoneNumberData/phonedata", 1024);
    if(area == nil){
        return @"数据库加载失败";
    }else {
        char *area_str = NULL;
        NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.xybp888.CallAssistSetting.plist"];
        if ([[prefs objectForKey:@"isShowLocationType"] boolValue]){
            area_str = Area_get(area, [str UTF8String], AREA_WITH_NAME | AREA_WITH_TYPE);
        }else{
            area_str = Area_get(area, [str UTF8String], AREA_WITH_NAME);
        }
        
        if(area_str == NULL){
            Area_unload(area);
            return @"未知";
        }else{
            NSString *zlocation = [NSString stringWithCString:area_str encoding:NSUTF8StringEncoding];
            Area_unload(area);
            return zlocation;
        }
    }
}
@end
