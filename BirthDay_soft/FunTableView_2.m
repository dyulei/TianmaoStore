//
//  FunTableView_2.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-23.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "FunTableView_2.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "DataModel_Fun_2.h"
#import "Fun_2_TableViewCell.h"

@interface FunTableView_2 ()<UITableViewDataSource, UITableViewDelegate, ASIHTTPRequestDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation FunTableView_2{
    NSMutableArray *_dataArr;
    NSDictionary *dic;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self load_data];
//    [_myTableView registerNib:[UINib nibWithNibName:@"Fun_2_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
        [_myTableView registerNib:[UINib nibWithNibName:@"Fun_2_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    // Do any additional setup after loading the view from its nib.
}

-(void)load_data{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://ya.tmall.com/api/rest.do?v=iPhone_4.0.0_640x960_201200&mtopkey=12615387&imei=B4DDD40F-E2AD-4DF8-A9CD-749D7FF1C124&sid=8f8bb4713df2a2b327bdbe9b77d9f77e&t=1401069970021&sign=3895bf590a3eb342ab843cb6dbc95704&api=showOffLabel.fetchGenericLabels&appKey=1718347254&data=%7B%22pageParam%22%3A%7B%22firstPage%22%3Atrue%2C%22value%22%3A%2232692953600000%22%2C%22pageSize%22%3A10%2C%22next%22%3Afalse%7D%2C%22type%22%3A%22activity%22%7D"]];
    request.delegate = self;
    [request startAsynchronous];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    _dataArr = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Fun_2_TableViewCell *cell = [_myTableView dequeueReusableCellWithIdentifier:@"cell"];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.model = _dataArr[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(void)requestFailed:(ASIHTTPRequest *)request{
    NSLog(@"failed!");
    [self load_data];
}

-(void)requestFinished:(ASIHTTPRequest *)request{
    NSString *str = [[NSString alloc] initWithData:[request responseData] encoding:NSUTF8StringEncoding];
    dic = [str JSONValue];
    for (NSDictionary *tmp_dic in dic[@"data"][@"labels"]) {
        DataModel_Fun_2 *model = [[DataModel_Fun_2 alloc] init];
        model.logo = tmp_dic[@"logo"];
        model.name = tmp_dic[@"name"];
        model.desc = tmp_dic[@"description"];
        model.labelId = tmp_dic[@"labelId"];
        model.joiners = tmp_dic[@"joiners"];
        [_dataArr addObject:model];
    }
    [_myTableView reloadData];
    
}

@end
