//
//  FunTableView_1.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-23.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "FunTableView_1.h"
#import "ASIHTTPRequest.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "DataModel_Fun_1.h"
#import "Fun_1_TableViewCell.h"

@interface FunTableView_1 ()<UITableViewDelegate, UITableViewDataSource, ASIHTTPRequestDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation FunTableView_1{
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
    [_myTableView registerNib:[UINib nibWithNibName:@"Fun_1_TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];

    // Do any additional setup after loading the view from its nib.
}

-(void)load_data{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://ya.tmall.com/api/rest.do?v=iPhone_4.0.0_640x960_201200&mtopkey=12615387&imei=B4DDD40F-E2AD-4DF8-A9CD-749D7FF1C124&sid=8f8bb4713df2a2b327bdbe9b77d9f77e&t=1400834088599&sign=33712ec2c9724b4f7ba970dfa7b76815&api=showOffPost.getGenericPosts&appKey=1718347254&data=%7B%22aggreType%22%3A%22recommended%22%2C%22pageParam%22%3A%7B%22firstPage%22%3Atrue%2C%22value%22%3A%221400830336578709%22%2C%22pageSize%22%3A10%2C%22next%22%3Afalse%7D%2C%22queryOptions%22%3A%7B%22filterMode%22%3A%22EXCL%22%7D%7D"]];
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

-(void)reload_data{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:@"http://ya.tmall.com/api/rest.do?v=iPhone_4.0.0_640x960_201200&mtopkey=12615387&imei=B4DDD40F-E2AD-4DF8-A9CD-749D7FF1C124&sid=8f8bb4713df2a2b327bdbe9b77d9f77e&t=1400834088599&sign=33712ec2c9724b4f7ba970dfa7b76815&api=showOffPost.getGenericPosts&appKey=1718347254&data=%7B%22aggreType%22%3A%22recommended%22%2C%22pageParam%22%3A%7B%22firstPage%22%3Atrue%2C%22value%22%3A%221400830336578709%22%2C%22pageSize%22%3A10%2C%22next%22%3Afalse%7D%2C%22queryOptions%22%3A%7B%22filterMode%22%3A%22EXCL%22%7D%7D"]];
    request.delegate = self;
    [request startAsynchronous];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    /*
    NSArray *sectionArray = _dataArr[section];
    return sectionArray.count;
     */
    return 1;
}

-(void)requestFinished:(ASIHTTPRequest *)request{
    NSString *str = [[NSString alloc] initWithData:[request responseData] encoding:NSUTF8StringEncoding];
    dic = [str JSONValue];
    for (NSDictionary *tmpDic in dic[@"data"][@"posts"]) {
        DataModel_Fun_1 *model = [[DataModel_Fun_1 alloc] init];
        model.authorAvatar = tmpDic[@"authorAvatar"];
        model.image = tmpDic[@"image"];
        model.authorDisplayName = tmpDic[@"authorDisplayName"];
        model.gmt = tmpDic[@"gmtCreate"];
        model.heat = tmpDic[@"heat"];
        model.text = tmpDic[@"text"];
        model.labelRelations = tmpDic[@"labelRelations"];
        model.likers = tmpDic[@"likers"];
        [_dataArr addObject:model];
    }
    [_myTableView reloadData];
    /*
     @property (nonatomic, strong)NSString *authorAvatar;
     @property (nonatomic, strong)NSString *image;
     @property (nonatomic, strong)NSString *authorDisplayName;
     @property (nonatomic, strong)NSString *gmt;
     @property (nonatomic, strong)NSString *heat;
     @property (nonatomic, strong)NSString *text;
     @property (nonatomic, strong)NSArray *labelRelations;
     @property (nonatomic, strong)NSArray *likers;
     */
}

-(void)requestFailed:(ASIHTTPRequest *)request{
    [self reload_data];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Fun_1_TableViewCell *cell = [_myTableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.model = _dataArr[indexPath.section];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 465;
}

@end
