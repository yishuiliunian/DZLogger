//
//  DZLoggerAdapter.m
//  Pods
//
//  Created by stonedong on 16/6/9.
//
//

#import "DZLoggerAdapter.h"

DDLogLevel ddLogLevel = DDLogLevelError;

static  NSString * const  kDZLogKey = @"log-level";
@interface DZLogLevelLoader : NSObject

@end

@implementation DZLogLevelLoader
+ (void) load
{
    ddLogLevel = (DDLogLevel)[[NSUserDefaults standardUserDefaults] integerForKey:kDZLogKey];
    if (ddLogLevel == DDLogLevelOff) {
        ddLogLevel = DDLogLevelError;
    }
#ifdef DEBUG
    ddLogLevel = DDLogLevelVerbose;
#endif
}
@end

static DDFileLogger*  fileLogger= nil;
DDFileLogger*  __DZGlobalFileLogger() {
    return fileLogger;
}
void DZSetupLogger(){
#ifdef DEBUG
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
#endif
    fileLogger = [DDFileLogger new];
    fileLogger.rollingFrequency = 60* 60* 24 * 7;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger withLevel:DDLogLevelAll];
    DDLogInfo(@"setup looger");
}


void DZChangeLogLevel(DDLogLevel logLevel) {
#ifndef DEBUG
    ddLogLevel = logLevel;
    [[NSUserDefaults standardUserDefaults] setInteger:logLevel forKey:kDZLogKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
#endif
}