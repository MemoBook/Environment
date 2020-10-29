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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
        
        UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, UIScreen.mainScreen.bounds.size.width, 40.0)];
        [self.view addSubview:lab1];
        lab1.text = [@"服务器地址：" stringByAppendingString:Environment.shareIntance.APP_SERVER_URL];
        
        UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, UIScreen.mainScreen.bounds.size.width, 40.0)];
        [self.view addSubview:lab2];
        lab2.text = [@"APPID：" stringByAppendingString:Environment.shareIntance.APPID_HW];
        
        UITextView *lab3 = [[UITextView alloc] initWithFrame:CGRectMake(0, 300, UIScreen.mainScreen.bounds.size.width, 80.0)];
        [self.view addSubview:lab3];
        lab3.text = Environment.shareIntance.toJsonString;
        
        UITextView *lab4 = [[UITextView alloc] initWithFrame:CGRectMake(0, 390, UIScreen.mainScreen.bounds.size.width, 80.0)];
        [self.view addSubview:lab4];
        lab4.text = [NSString stringWithFormat:@"%@",Environment.shareIntance.toDictionary];
    });
    
    NSLog(@"1====服务器地址：%d", [Environment.shareIntance.TEST_URL isEqual:@""]); //这是用于测试plist文件中没有该字段，但是在头文件申请后能否访问
    NSLog(@"2====服务器地址：%@", Environment.shareIntance.APP_SERVER_URL);
    NSLog(@"3====服务器地址：%@", Environment.shareIntance.APPID_HW);
    NSLog(@"4====服务器地址：%@", Environment.shareIntance.toJsonString);
    NSLog(@"5====服务器地址：%@", Environment.shareIntance.toDictionary);
}
@end
