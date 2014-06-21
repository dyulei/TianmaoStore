//
//  MeViewController.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-14.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "MeViewController.h"
#import "MeHeader.h"
#import "LoginViewController.h"

@interface MeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation MeViewController{
    NSMutableArray *_dataArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"我的天猫";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self dataload];
    self.myTableView.tableHeaderView = [[NSBundle mainBundle] loadNibNamed:@"MeHeader" owner:self options:nil][0];
    // Do any additional setup after loading the view from its nib.
}

-(void)dataload{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    _dataArray = [NSMutableArray array];
    for (int i=0; i<4; ++i) {
        if (i == 0) {
            NSMutableArray *groupArray = [NSMutableArray array];
            NSString *str1 = @"全部订单";
            [groupArray addObject:str1];
            [_dataArray addObject:groupArray];
        }
        if (i == 1) {
            NSMutableArray *groupArray = [NSMutableArray array];
            NSString *str1 = @"收藏物品";
            NSString *str2 = @"收藏店铺";
            [groupArray addObject:str1];
            [groupArray addObject:str2];
            [_dataArray addObject:groupArray];
        }
        if (i == 2) {
            NSMutableArray *groupArray = [NSMutableArray array];
            NSString *str1 = @"我的优惠劵";
            NSString *str2 = @"我的会员卡";
            NSString *str3 = @"购物日历";
            [groupArray addObject:str1];
            [groupArray addObject:str2];
            [groupArray addObject:str3];
            [_dataArray addObject:groupArray];
        }
        if (i == 3) {
            NSMutableArray *groupArray = [NSMutableArray array];
            NSString *str1 = @"支付宝";
            [groupArray addObject:str1];
            [_dataArray addObject:groupArray];
        }
     }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *sectionArray = _dataArray[section];
    return sectionArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseID = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NSString *str = _dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = str;
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    LoginViewController *login = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self.navigationController pushViewController:login animated:YES];
}

@end
