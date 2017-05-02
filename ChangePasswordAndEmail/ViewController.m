//
//  ViewController.m
//  ChangePasswordAndEmail
//
//  Created by anyifei’s Mac on 2017/5/2.
//  Copyright © 2017年 esteel. All rights reserved.
//

#import "ViewController.h"
#import "ChangeAlertView.h"
@interface ViewController ()<ChangeAlertViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)changePassword:(id)sender {
    ChangeAlertView *grabASingle = [[ChangeAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds withChangeIndex:2 withDelegate:self];
    [grabASingle show];
}
- (IBAction)changeEmail:(id)sender {
    ChangeAlertView *grabASingle = [[ChangeAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds withChangeIndex:1 withDelegate:self];
    [grabASingle show];
}
//修改邮箱
- (void)enterQtyWithEmail {
    
    NSLog(@"修改了邮箱");

    
}
- (void)enterQtyWithPassword{
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码修改成功" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alertC animated:YES completion:^{
        [self performSelector:@selector(alertDismiss:) withObject:alertC afterDelay:1.0];
    }];
    
    
    
}
- (void)alertDismiss:(UIAlertController *)alert {
    
    [alert dismissViewControllerAnimated:YES completion:^{
        NSLog(@"修改了密码");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
