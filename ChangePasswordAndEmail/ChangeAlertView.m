//
//  ChangeAlertView.m
//  wuBoOwner
//
//  Created by anyifei’s Mac on 2016/12/15.
//  Copyright © 2016年 MS. All rights reserved.
//
#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#import "ChangeAlertView.h"
@interface ChangeAlertView()<UITextFieldDelegate>
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic,strong) UIView *BGView;
@property (nonatomic,assign) CGFloat bgViewHeight;
@property (nonatomic,strong) UITextField *oldPasswordTF;
@property (nonatomic,strong) UITextField *newsPasswordTF;
@property (nonatomic,strong) UITextField *repeatPasswordTF;
@property (nonatomic,strong) UITextField *newsEmailTF;
@property (nonatomic,assign) NSInteger index;
@property (nonatomic,copy) UILabel *tipLabel;
@end
@implementation ChangeAlertView


- (instancetype)initWithFrame:(CGRect)frame  withChangeIndex:(NSInteger)index  withDelegate:(id<ChangeAlertViewDelegate>)del{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
        self.delegate = del;
        
        self.index = index;
        if (self.index == 1) {
            _bgViewHeight = 180;
        }else {
            
            _bgViewHeight = 280;
        }
        
        [self addSubview:self.BGView];
        
        
    }
    return self;
}
- (UIView *)BGView{
    if (!_BGView) {
        _BGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-80, _bgViewHeight)];
        _BGView.backgroundColor = [UIColor whiteColor];
        _BGView.userInteractionEnabled = YES;
        _BGView.layer.cornerRadius = 8.0;
        _BGView.layer.masksToBounds = YES;
        
        _BGView.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2-50);
        if (self.index == 1) {
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetMaxX(_BGView.frame), 20)];
            titleLabel.center = CGPointMake(_BGView.frame.size.width/2, 25);
            titleLabel.text = @"修改邮箱";
            titleLabel.textColor = [UIColor colorWithRed:42/255.0 green:134/255.0 blue:136/255.0 alpha:1];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.font = [UIFont systemFontOfSize:18];
            [_BGView addSubview:titleLabel];
            
            UILabel *oldPasswordTitle = [[UILabel alloc]initWithFrame:CGRectMake(17, 40, _BGView.frame.size.width-34, 20)];
            oldPasswordTitle.text = @"请输入您的新邮箱：";
            oldPasswordTitle.font = [UIFont systemFontOfSize:12];
            [_BGView addSubview:oldPasswordTitle];
            
            _newsEmailTF = [[UITextField alloc]initWithFrame:CGRectMake(17, 60, _BGView.frame.size.width-34, 30)];
            _newsEmailTF.placeholder = @"请输入您的新邮箱";
            _newsEmailTF.delegate = self;
            _newsEmailTF.font  = [UIFont systemFontOfSize:15];
//            _newsEmailTF.backgroundColor = [UIColor cyanColor];
            _newsEmailTF.clearButtonMode = UITextFieldViewModeWhileEditing;
            _newsEmailTF.borderStyle = UITextBorderStyleBezel;
            [_BGView addSubview:_newsEmailTF];
            
        }else {
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetMaxX(_BGView.frame), 20)];
            titleLabel.center = CGPointMake(_BGView.frame.size.width/2, 25);
            titleLabel.text = @"修改密码";
            titleLabel.textColor = [UIColor colorWithRed:42/255.0 green:134/255.0 blue:136/255.0 alpha:1];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.font = [UIFont systemFontOfSize:18];
            [_BGView addSubview:titleLabel];
            
            UILabel *oldPasswordTitle = [[UILabel alloc]initWithFrame:CGRectMake(17, 40, _BGView.frame.size.width-34, 20)];
            oldPasswordTitle.text = @"请输入您的旧密码：";
            oldPasswordTitle.font = [UIFont systemFontOfSize:12];
            [_BGView addSubview:oldPasswordTitle];
            
            _oldPasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(17, 60, _BGView.frame.size.width-34, 30)];
            _oldPasswordTF.placeholder = @"请输入您的旧密码";
            _oldPasswordTF.secureTextEntry = YES;
            _oldPasswordTF.delegate = self;
            _oldPasswordTF.font  = [UIFont systemFontOfSize:15];
//            _oldPasswordTF.backgroundColor = [UIColor cyanColor];
            _oldPasswordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
            _oldPasswordTF.borderStyle = UITextBorderStyleBezel;
            [_BGView addSubview:_oldPasswordTF];
            
            
            UILabel *newPasswordTitle = [[UILabel alloc]initWithFrame:CGRectMake(17, 90, _BGView.frame.size.width-34, 20)];
            newPasswordTitle.text = @"请输入您的新密码：";
            newPasswordTitle.font = [UIFont systemFontOfSize:12];
            [_BGView addSubview:newPasswordTitle];
            
            
            _newsPasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(17, 110, _BGView.frame.size.width-34, 30)];
            _newsPasswordTF.placeholder = @"请输入您的新密码";
            _newsPasswordTF.secureTextEntry = YES;
            _newsPasswordTF.font  = [UIFont systemFontOfSize:15];
            _newsPasswordTF.delegate = self;
//            _newsPasswordTF.backgroundColor = [UIColor cyanColor];
            _newsPasswordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
            _newsPasswordTF.borderStyle = UITextBorderStyleBezel;
            [_BGView addSubview:_newsPasswordTF];
            
            
            UILabel *repeatPasswordTitle = [[UILabel alloc]initWithFrame:CGRectMake(17, 140, _BGView.frame.size.width-34, 20)];
            repeatPasswordTitle.text = @"请再次输入您的新密码：";
            repeatPasswordTitle.font = [UIFont systemFontOfSize:12];
            [_BGView addSubview:repeatPasswordTitle];
            
            
            _repeatPasswordTF = [[UITextField alloc]initWithFrame:CGRectMake(17, 160, _BGView.frame.size.width-34, 30)];
            _repeatPasswordTF.placeholder = @"请再次输入您的新密码";
            _repeatPasswordTF.secureTextEntry = YES;
            _repeatPasswordTF.delegate =self;
            _repeatPasswordTF.font  = [UIFont systemFontOfSize:15];
//            _repeatPasswordTF.backgroundColor = [UIColor cyanColor];
            _repeatPasswordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
            _repeatPasswordTF.borderStyle = UITextBorderStyleBezel;
            [_BGView addSubview:_repeatPasswordTF];
            
            
        }
        
        _tipLabel = [[UILabel alloc]init];
        _tipLabel.textColor = [UIColor redColor];
        _tipLabel.font = [UIFont systemFontOfSize:13];
        [_BGView addSubview:_tipLabel];
        
        
        ///再想想
        UIButton *cancleBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        cancleBtn.layer.cornerRadius = 3;
        cancleBtn.layer.borderColor = [UIColor colorWithRed:42/255.0 green:134/255.0 blue:136/255.0 alpha:1].CGColor;
        cancleBtn.layer.borderWidth = 1;
        cancleBtn.backgroundColor = [UIColor whiteColor];
        [cancleBtn setTitleColor:[UIColor colorWithRed:42/255.0 green:134/255.0 blue:136/255.0 alpha:1] forState:UIControlStateNormal];
        [cancleBtn addTarget:self action:@selector(sss) forControlEvents:UIControlEventTouchUpInside];
        [_BGView addSubview:cancleBtn];
        
        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        sureBtn.layer.cornerRadius = 3;
        [sureBtn addTarget:self action:@selector(enterOffer) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        sureBtn.backgroundColor = [UIColor colorWithRed:42/255.0 green:134/255.0 blue:136/255.0 alpha:1];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_BGView addSubview:sureBtn];
        
        if (self.index == 2) {
            _tipLabel.frame = CGRectMake(17, 195, _BGView.frame.size.width-34, 25);
            cancleBtn.frame = CGRectMake(17, 223, (CGRectGetWidth(_BGView.frame)-34-15)/2, 35);
            sureBtn.frame = CGRectMake(17+(CGRectGetWidth(_BGView.frame)-34-15)/2+15, 223, (CGRectGetWidth(_BGView.frame)-34-15)/2, 35);
        }else {
            _tipLabel.frame = CGRectMake(17, 95, _BGView.frame.size.width-34, 25);
            cancleBtn.frame = CGRectMake(17, 123, (CGRectGetWidth(_BGView.frame)-34-15)/2, 35);
            sureBtn.frame = CGRectMake(17+(CGRectGetWidth(_BGView.frame)-34-15)/2+15, 123, (CGRectGetWidth(_BGView.frame)-34-15)/2, 35);
        }
        
    }
    return _BGView;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {

    if ((textField = _newsEmailTF)) {
        _tipLabel.text = @"";
    }
    if ((textField = _oldPasswordTF)) {
        _tipLabel.text = @"";
    }
    if ((textField = _newsPasswordTF)) {
        _tipLabel.text = @"";
    }

    if ((textField = _repeatPasswordTF)) {
        _tipLabel.text = @"";
    }

    
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ((textField = _oldPasswordTF)) {
        if (textField.text.length >15 && ![string isEqualToString:@""]){
            
            if (range.location > 0 && range.length == 1 && string.length == 0)
            {
                textField.text = [textField.text substringToIndex:textField.text.length - 1];
                return NO;
            }
            return NO;
        }

    }
    if ((textField = _newsPasswordTF)) {
        if (textField.text.length >15 && ![string isEqualToString:@""]){
            
            if (range.location > 0 && range.length == 1 && string.length == 0)
            {
                textField.text = [textField.text substringToIndex:textField.text.length - 1];
                return NO;
            }
            return NO;
        }
        
    }

    if ((textField = _repeatPasswordTF)) {
        if (textField.text.length >15 && ![string isEqualToString:@""]){
            
            if (range.location > 0 && range.length == 1 && string.length == 0)
            {
                textField.text = [textField.text substringToIndex:textField.text.length - 1];
                return NO;
            }
            return NO;
        }
        
    }

    
    return YES;
}
#pragma mark - textFieldDelegate -
//确认
- (void)enterOffer{
    
    if (self.index == 1) {//更改邮箱
        NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        if ([self.newsEmailTF.text isEqualToString:@""]) {
            [self shakeAnimationMethod];
            _tipLabel.text = @"* 邮箱地址不能为空!";
        }else if (![emailTest evaluateWithObject:self.newsEmailTF.text]) {
            
            [self shakeAnimationMethod];
            _tipLabel.text = @"* 邮箱格式错误!";
        }else {
            //在这里加入请求的逻辑  邮箱是否修改成功  
                        if ([self.delegate respondsToSelector:@selector(enterQtyWithPassword)]) {
                            [self.delegate enterQtyWithPassword];
                        }
                        [self removeFromSuperview];
                        [self.mainView removeFromSuperview];
            
        }
        
    }else {
        if ([self.oldPasswordTF.text isEqualToString:@""] && [self.newsPasswordTF.text isEqualToString:@""] && [self.repeatPasswordTF.text isEqualToString:@""]) {
            [self shakeAnimationMethod];
            _tipLabel.text = @"* 密码信息不完整!";
        }else if (([self.repeatPasswordTF.text isEqualToString:@""] || [self.newsPasswordTF.text isEqualToString:@""])&& ![self.oldPasswordTF.text isEqualToString:@""]) {
            
            [self shakeAnimationMethod];
            _tipLabel.text = @"* 密码信息不完整!";
        }else if ((![self.repeatPasswordTF.text isEqualToString:@""] || ![self.newsPasswordTF.text isEqualToString:@""])&& [self.oldPasswordTF.text isEqualToString:@""]) {
            
            [self shakeAnimationMethod];
            _tipLabel.text = @"* 旧密码不能为空!";
        }else if ((self.newsPasswordTF.text.length>16 || self.newsPasswordTF.text.length<6) || (self.repeatPasswordTF.text.length>16 || self.repeatPasswordTF.text.length<6)) {
            
            [self shakeAnimationMethod];
            _tipLabel.text = @"* 密码位数为6~16位!";
        } else if (![self.newsPasswordTF.text isEqualToString:self.repeatPasswordTF.text] ) {
            
            [self shakeAnimationMethod];
            _tipLabel.text = @"* 两次新密码输入不一致!";
        }else {
            //在这里加入请求的逻辑  判断旧密码是否正确   正确之后返回
            if ([self.delegate respondsToSelector:@selector(enterQtyWithPassword)]) {
                [self.delegate enterQtyWithPassword];
            }
            [self removeFromSuperview];
            [self.mainView removeFromSuperview];
           
                    }
    }
    
    //       [self removeFromSuperview];
    //    [self shakeAnimationMethod];
}
/**
 抖动动画
 */
- (void)shakeAnimationMethod
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    CGFloat positionX = self.layer.position.x;
    animation.values = @[@(positionX-10),@(positionX),@(positionX+10)];
    animation.repeatCount = 3;
    animation.duration = 0.07;
    animation.autoreverses = YES;
    [self.BGView.layer addAnimation:animation forKey:nil];
}
//再想想
- (void)sss{
    
    [self removeFromSuperview];
    [self.mainView removeFromSuperview];
}

- (void)show
{
    if (self.mainView) return;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.mainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    
    
    self.mainView.userInteractionEnabled = YES;
    self.mainView.backgroundColor = [UIColor blackColor];
    self.mainView.alpha = 0.2;
    [window addSubview:self.mainView];
    [window addSubview:self];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_newsEmailTF resignFirstResponder];
    [_oldPasswordTF resignFirstResponder];
    [_repeatPasswordTF resignFirstResponder];
    [_newsPasswordTF resignFirstResponder];
    
}
- (void)dealloc {
    
   
}


@end
