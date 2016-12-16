//
//  DZLoggerAdapter.h
//  Pods
//
//  Created by stonedong on 16/6/9.
//
//

#import <Foundation/Foundation.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

FOUNDATION_EXTERN  DDLogLevel  ddLogLevel;

#define DZGlobalFileLogger  __DZGlobalFileLogger()

FOUNDATION_EXTERN DDFileLogger*  __DZGlobalFileLogger() ;
FOUNDATION_EXTERN void DZSetupLogger();
FOUNDATION_EXTERN void DZChangeLogLevel(DDLogLevel logLevel);