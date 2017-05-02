//
//  ChangeAlertView.h
//  wuBoOwner
//
//  Created by anyifei’s Mac on 2016/12/15.
//  Copyright © 2016年 MS. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ChangeAlertViewDelegate <NSObject>
@required
- (void)enterQtyWithPassword;
- (void)enterQtyWithEmail;
- (void)requestFail;
- (void)requestFailAndLost;
@end

@interface ChangeAlertView : UIView
@property (nonatomic,strong) ChangeAlertView *alerytView;
@property (nonatomic,assign) id<ChangeAlertViewDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame  withChangeIndex:(NSInteger)index  withDelegate:(id<ChangeAlertViewDelegate>)del;

- (void)show;
@end
