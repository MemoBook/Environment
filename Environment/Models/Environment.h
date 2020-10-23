//
//  Environment.h
//  Environment
//
//  Created by HuangZe on 2020/10/21.
//

#import <Foundation/Foundation.h>
@class Config;

NS_ASSUME_NONNULL_BEGIN

@interface Environment : NSObject

@property (nonatomic, strong)Config *config;

+ (instancetype)shareIntance;

@end

NS_ASSUME_NONNULL_END
