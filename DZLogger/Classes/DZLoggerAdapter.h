//
//  DZLoggerAdapter.h
//  Pods
//
//  Created by stonedong on 16/6/9.
//
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>


//#if DEBUG
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;
//#else
//static const DDLogLevel ddLogLevel = DDLogLevelWarning;
//#endif

#define DZGlobalFileLogger  __DZGlobalFileLogger()

FOUNDATION_EXTERN DDFileLogger*  __DZGlobalFileLogger() ;
void DZSetupLogger();