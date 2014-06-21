//
//  Custom_tabbar.h
//  BirthDay_soft
//
//  Created by YuLei on 14-5-14.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Custom_tabbar : UIView
@property (nonatomic, weak)UITabBarController *tabbarController;
-(void)setSelectIndex:(int)index;
@end
