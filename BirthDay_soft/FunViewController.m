//
//  FunViewController.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-14.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "FunViewController.h"
#import "FunControlButton.h"
#import "FunTableView_1.h"
#import "FunTableView_2.h"
#import "FunTableView_3.h"
@interface FunViewController ()

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UIView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *top_btn_1;
@property (weak, nonatomic) IBOutlet UIButton *top_btn_2;
@property (weak, nonatomic) IBOutlet UIButton *top_btn_3;

@end

@implementation FunViewController{
    FunTableView_1 *fun_1;
    FunTableView_2 *fun_2;
    FunTableView_3 *fun_3;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"范儿";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    fun_1 = [[FunTableView_1 alloc] initWithNibName:@"FunTableView_1" bundle:nil];
    fun_2 = [[FunTableView_2 alloc] initWithNibName:@"FunTableView_2" bundle:nil];
    fun_3 = [[FunTableView_3 alloc] initWithNibName:@"FunTableView_3" bundle:nil];

    // Do any additional setup after loading the view from its nib.
}

-(void)initButton{
    _top_btn_1.selected = NO;
    _top_btn_2.selected = NO;
    _top_btn_3.selected = NO;
}

- (IBAction)choose_btn:(id)sender {
    [self initButton];
    UIButton *btn = sender;
    btn.selected = YES;
    switch (btn.tag) {
        case 1:
            [_tableView addSubview:fun_1.view];
            break;
        case 2:
            [_tableView addSubview:fun_2.view];
            break;
        case 3:
            [_tableView addSubview:fun_3.view];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
