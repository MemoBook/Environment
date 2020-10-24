//
//  ViewController.m
//  Environment
//
//  Created by HuangZe on 2020/10/21.
//

#import "ViewController.h"
#import <MBProgressHUD.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(100, 100, 100, 50);
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(hud) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)hud {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.label.text = @"加载中...";
    
    [hud hideAnimated:YES afterDelay:4.0];
    
    NSLog(@"1====服务器地址：%d", [Environment.shareIntance.TEST_URL isEqual:@""]); //这是用于测试plist文件中没有该字段，但是在头文件申请后能否访问
    NSLog(@"2====服务器地址：%@", Environment.shareIntance.APP_SERVER_URL);
    NSLog(@"3====服务器地址：%@", Environment.shareIntance.APPID_HW);

}
@end
