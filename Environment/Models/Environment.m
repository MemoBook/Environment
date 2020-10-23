//
//  Environment.m
//  Environment
//
//  Created by HuangZe on 2020/10/21.
//

#import "Environment.h"
 
static NSString * const CONFIG_KEY = @"CONFIG_DICTIONARY";

@implementation Environment

+(instancetype)shareIntance {
    static dispatch_once_t onceToken;
    static Environment *_env = nil;
    
    dispatch_once(&onceToken, ^{
        _env = [[Environment alloc] init];
        
        //读取plist数据
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *path = [bundle pathForResource:@"Info" ofType:@"plist"];
        NSDictionary *config = [NSDictionary dictionaryWithContentsOfFile:path];
        
        if ([config.allKeys containsObject:CONFIG_KEY]) {
            NSDictionary *config_dic = config[CONFIG_KEY];
            _env.config = [Config mj_objectWithKeyValues:config_dic];
        } else {
            NSLog(@"plist文件不包含：（%@）字段",CONFIG_KEY);
        }
        
    });
    
    return _env;
}

@end
