//
//  Config.h
//  Environment
//
//  Created by HuangZe on 2020/10/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Config : NSObject

/// 用户服务器地址
@property (nonatomic, copy, readonly) NSString *APP_SERVER_URL;

/// 华为授权登录APPID
@property (nonatomic, copy, readonly) NSString *APPID_HW;

/// ssssssss
@property (nonatomic, copy, readonly) NSString *TEST_URL;

@end

NS_ASSUME_NONNULL_END
