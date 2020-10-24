//
//  Environment.m
//  Environment
//
//  Created by HuangZe on 2020/10/21.
//

#import "Environment.h"
 
static NSString * const config_key = @"CONFIG_DICTIONARY";

@implementation Environment

+(instancetype)shareIntance {
    static dispatch_once_t onceToken;
    static Environment *_env = nil;
    
    dispatch_once(&onceToken, ^{
        //读取plist数据
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"Info" ofType:@"plist"];
        NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile:path];
        
        if ([config.allKeys containsObject:config_key]) {
            _env = [Environment mj_objectWithKeyValues:config[config_key]];
        } else {
            NSLog(@"Info.plist file does not contain the（%@）key",config_key);
        }
    });
    return _env;
}
@end
