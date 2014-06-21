//
//  Custom_tabbar.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-14.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "Custom_tabbar.h"

@implementation Custom_tabbar{
    
    __weak IBOutlet UIButton *Button_1;
    __weak IBOutlet UIButton *Button_2;
    __weak IBOutlet UIButton *Button_3;
    __weak IBOutlet UIButton *Button_4;
    __weak IBOutlet UIButton *Button_5;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setSelectIndex:(int)index{
    switch (index) {
        case 0:
            Button_1.selected = YES;
            break;
        case 1:
            Button_2.selected = YES;
            break;
        case 2:
            Button_3.selected = YES;
            break;
        case 3:
            Button_4.selected = YES;
            break;
        case 4:
            Button_5.selected = YES;
            break;
        default:
            break;
    }
}

- (IBAction)setSelected:(id)sender {
    UIButton *btn = sender;
    self.tabbarController.selectedIndex = btn.tag;
    Button_1.selected = NO;
    Button_2.selected = NO;
    Button_3.selected = NO;
    Button_4.selected = NO;
    Button_5.selected = NO;
    btn.selected = YES;
    [[NSUserDefaults standardUserDefaults] setInteger:btn.tag forKey:@"TabIndex"];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
