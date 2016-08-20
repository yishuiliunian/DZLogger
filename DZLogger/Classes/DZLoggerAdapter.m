//
//  DZLoggerAdapter.m
//  Pods
//
//  Created by stonedong on 16/6/9.
//
//

#import "DZLoggerAdapter.h"


static DDFileLogger*  fileLogger= nil;
DDFileLogger*  __DZGlobalFileLogger() {
    return fileLogger;
}
void DZSetupLogger(){
#ifdef DEBUG
    [DDLog addLogger:[DDASLLogger sharedInstance]];
#endif
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    fileLogger = [DDFileLogger new];
    fileLogger.rollingFrequency = 60* 60* 24 * 7;
    fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
    [DDLog addLogger:fileLogger withLevel:DDLogLevelAll];
    DDLogInfo(@"setup looger");
}
