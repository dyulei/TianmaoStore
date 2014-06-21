//
//  RootViewController.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-14.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "RootViewController.h"
#import "NSString+SBJSON.h"
#import "UIImageView+WebCache.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "Root_WebViewController.h"

@interface RootViewController ()<ASIHTTPRequestDelegate, UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *top_scroll_view;
@property (weak, nonatomic) IBOutlet UIImageView *top_image_1;
@property (weak, nonatomic) IBOutlet UIImageView *top_image_2;
@property (weak, nonatomic) IBOutlet UIImageView *top_image_3;
@property (weak, nonatomic) IBOutlet UIImageView *top_image_4;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_1_1;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_1_1;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_1_2;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_1_2;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_1_3;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_1_4;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_1_1;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_1_2;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_1_3;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_1_4;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_1_5;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_1_5;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_1_5;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_1_6;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_1_time;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_1_value_new;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_1_value_old;
@property(nonatomic, assign) BOOL automaticallyAdjustsScrollViewInsets;

@property (weak, nonatomic) IBOutlet UILabel *label_title_row_2_1;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_2_1;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_2_2;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_2_3;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_2_4;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_2_5;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_2_6;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_2_2;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_2_3;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_2_4;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_2_1;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_2_2;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_2_3;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_2_4;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_2_5;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_2_6;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_2_font;


@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_1;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_2;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_3;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_4;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_5;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_6;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_7;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_8;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_9;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_10;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_11;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_12;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_13;
@property (weak, nonatomic) IBOutlet UILabel *label_title_row_3_14;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_1;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_2;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_3;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_4;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_5;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_6;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_7;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_8;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_9;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_10;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_11;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_12;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_13;
@property (weak, nonatomic) IBOutlet UILabel *label_futitle_row_3_14;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_1;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_2;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_3;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_4;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_5;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_6;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_7;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_8;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_9;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_10;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_11;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_12;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_13;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_3_14;

@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_4_1;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_4_2;
@property (weak, nonatomic) IBOutlet UIImageView *pic_title_row_4_3;
@property (weak, nonatomic) IBOutlet UILabel *label_row_4_1;
@property (weak, nonatomic) IBOutlet UILabel *label_row_4_2;
@property (weak, nonatomic) IBOutlet UILabel *label_row_4_3;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_1_5;

@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_2_1;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_2_2;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_2_3;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_2_4;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_2_5;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_2_6;

@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_1;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_2;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_3;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_4;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_5;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_6;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_7;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_8;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_9;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_10;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_11;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_12;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_13;
@property (weak, nonatomic) IBOutlet UIImageView *pgr_row_3_14;
@property (weak, nonatomic) IBOutlet UIImageView *gpr_top_1;
@property (weak, nonatomic) IBOutlet UIImageView *gpr_top_2;
@property (weak, nonatomic) IBOutlet UIImageView *gpr_top_3;
@property (weak, nonatomic) IBOutlet UIImageView *gpr_top_4;



@end

@implementation RootViewController{
//    NSMutableData *_recvData;
    NSMutableArray *_dataArr_one;
    NSMutableArray *_datascrollview;
    NSDictionary *dic;
    NSDictionary *dic_t;
    ASINetworkQueue *_queue;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"天猫";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self init_DataArr];
    // Do any additional setup after loading the view from its nib.
}

-(void)init_DataArr{
    _dataArr_one = [NSMutableArray array];
//    _recvData = [NSMutableData data];
    _datascrollview = [NSMutableArray array];
    _queue = [[ASINetworkQueue alloc] init];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL                                              URLWithString:@"http://m.tmall.com/TmallClientHomePage.htm?v=iPhone_4.0.0_640x960_201200"]];
    request.delegate = self;
    request.tag = 100;

    ASIHTTPRequest *request1 = [ASIHTTPRequest requestWithURL:[NSURL                                              URLWithString:@"http://ya.tmall.com/api/rest.do?v=iPhone_4.0.0_640x960_201200&mtopkey=12615387&imei=B4DDD40F-E2AD-4DF8-A9CD-749D7FF1C124&sid=&t=1400295184671&sign=db49299026993d2284a5134a4b0062dd&api=aladdin.guessLike&appKey=1718347254&data=%7B%22userTrack%22%3A%22%22%7D"]];
    request1.delegate = self;
    request1.tag = 101;
    [request startAsynchronous];
    [request1 startAsynchronous];
    /*
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL                                              URLWithString:@"http://m.tmall.com/TmallClientHomePage.htm?v=iPhone_4.0.0_640x960_201200"]];
    [NSURLConnection connectionWithRequest:request delegate:self];
     */
}

-(void)start_top_view{
    for (int i=1; i<=4; ++i) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320*(i-1), 0, 320, 90)];
        [imageView setImageWithURL:[NSURL URLWithString:_datascrollview[i-1]]];
        [_top_scroll_view addSubview:imageView];
    }
    _top_scroll_view.bounces = NO;
    _top_scroll_view.showsHorizontalScrollIndicator = NO;
    _top_scroll_view.pagingEnabled = YES;
}

-(void)load_top_pic_one{
    [_top_image_1 setImageWithURL:[NSURL URLWithString:@"http://gtms01.alicdn.com/tps/i1/T1K_pJFBhdXXaeksnf-38-38.jpg"]];
    [_top_image_2 setImageWithURL:[NSURL URLWithString:@"http://gtms01.alicdn.com/tps/i1/T1CURIFqOaXXaeksnf-38-38.jpg"]];
    [_top_image_3 setImageWithURL:[NSURL URLWithString:@"http://gtms01.alicdn.com/tps/i1/T1CptMFCldXXaeksnf-38-38.jpg"]];
    [_top_image_4 setImageWithURL:[NSURL URLWithString:@"http://gtms01.alicdn.com/tps/i1/T1PmVLFwhXXXaeksnf-38-38.jpg"]];
    [self addGR_row_top];
}

-(void)addGR_row_top{
    UITapGestureRecognizer *pinch_top_1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_top_1:)];
    [self.gpr_top_1 addGestureRecognizer:pinch_top_1];
    self.gpr_top_1.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_top_2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_top_2:)];
    [self.gpr_top_2 addGestureRecognizer:pinch_top_2];
    self.gpr_top_2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_top_3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_top_3:)];
    [self.gpr_top_3 addGestureRecognizer:pinch_top_3];
    self.gpr_top_3.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_top_4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_top_4:)];
    [self.gpr_top_4 addGestureRecognizer:pinch_top_4];
    self.gpr_top_4.userInteractionEnabled = YES;
}

-(void)onPinch_top_1:(UIPinchGestureRecognizer *)pGR{
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = @"http://hf.m.tmall.com/?spm=0.0.0.0&sid=25de07d8074435513872c5e902a82507";
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_top_2:(UIPinchGestureRecognizer *)pGR{
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = @"http://hf.m.tmall.com/?spm=0.0.0.0&sid=25de07d8074435513872c5e902a82507";
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_top_3:(UIPinchGestureRecognizer *)pGR{
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = @"http://chaoshi.m.tmall.com?&disableSearch=1";
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_top_4:(UIPinchGestureRecognizer *)pGR{
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = @"http://caipiao.m.taobao.com/lottery/h5/app.html?mode=hybrid&ttid=42huo001#viewpath=index%2Fa.html";
    [self.navigationController pushViewController:webview animated:YES];
}


-(void)load_row_one{
    _label_title_row_1_1.text = [NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][0][@"name"]];
    _label_title_row_1_2.text = [NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][1][@"name"]];
    _label_futitle_row_1_3.text = [NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][2][@"name"]];
    _label_futitle_row_1_4.text = [NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][3][@"name"]];
    _label_futitle_row_1_1.text = [NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][0][@"desc"]];
    _label_futitle_row_1_2.text = [NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][1][@"desc"]];
    [_pic_title_row_1_1 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][0][@"image"]]]];
    [_pic_title_row_1_2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][1][@"image"]]]];
    [_pic_title_row_1_3 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][2][@"image"]]]];
    [_pic_title_row_1_4 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][3][@"image"]]]];
    
    _label_title_row_1_5.text = [NSString stringWithFormat:@"%@", dic[@"content"][3][@"title"]];
    _label_futitle_row_1_5.text = [NSString stringWithFormat:@"%@", dic[@"content"][3][@"desc"]];
    _label_title_row_1_6.text = [NSString stringWithFormat:@"%@", dic[@"content"][3][@"itemList"][0][@"name"]];
    _label_title_row_1_time.text = [NSString stringWithFormat:@"剩余 %@", dic[@"content"][3][@"itemList"][0][@"endDate"]];
    _label_title_row_1_value_new.text = [NSString stringWithFormat:@"¥ %@", dic[@"content"][3][@"itemList"][0][@"discount"]];
    _label_title_row_1_value_old.text = [NSString stringWithFormat:@"原价:¥%@", dic[@"content"][3][@"itemList"][0][@"price"]];
    
    [_pic_title_row_1_5 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][3][@"itemList"][0][@"image"]]]];
    [self changeTime];
    [self addGR_row_1];
}

-(void)addGR_row_1{
    
    UITapGestureRecognizer *pinch_row_1_1_1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_1_1:)];
    [self.label_title_row_1_1 addGestureRecognizer:pinch_row_1_1_1];
    self.label_title_row_1_1.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_1_1_2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_1_1:)];
    [self.label_futitle_row_1_1 addGestureRecognizer:pinch_row_1_1_2];
    self.label_futitle_row_1_1.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_1_1_3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_1_1:)];
    [self.pic_title_row_1_1 addGestureRecognizer:pinch_row_1_1_3];
    self.pic_title_row_1_1.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_1_2_1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_1_2:)];
    [self.label_title_row_1_2 addGestureRecognizer:pinch_row_1_2_1];
    self.label_title_row_1_2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_1_2_2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_1_2:)];
    [self.label_futitle_row_1_2 addGestureRecognizer:pinch_row_1_2_2];
    self.label_futitle_row_1_2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_1_2_3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_1_2:)];
    [self.pic_title_row_1_2 addGestureRecognizer:pinch_row_1_2_3];
    self.pic_title_row_1_2.userInteractionEnabled = YES;

    
    UITapGestureRecognizer *pinch_row_1_4_1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_1_4:)];
    [self.label_futitle_row_1_4 addGestureRecognizer:pinch_row_1_4_1];
    self.label_futitle_row_1_4.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_1_4_2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_1_4:)];
    [self.pic_title_row_1_4 addGestureRecognizer:pinch_row_1_4_2];
    self.pic_title_row_1_4.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_1_5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_1_5:)];
    [self.pgr_row_1_5 addGestureRecognizer:pinch_row_1_5];
    self.pgr_row_1_5.userInteractionEnabled = YES;
    
}


-(void)onPinch_row_1_1:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][0][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_1_2:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][1][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_1_4:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][2][@"itemList"][3][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_1_5:(UIPinchGestureRecognizer *)pGR{
    NSString *url = [NSString stringWithFormat:@"%@", dic[@"content"][3][@"itemList"][0][@"wapAction"]];
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}



-(void)load_row_two{
    _label_title_row_2_1.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][0][@"name"]];
    _label_title_row_2_2.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][2][@"name"]];
    _label_title_row_2_3.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][3][@"name"]];
    _label_title_row_2_4.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][4][@"name"]];
    _label_title_row_2_5.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][5][@"name"]];
    _label_title_row_2_6.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][6][@"name"]];
    
    _label_futitle_row_2_1.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][0][@"desc"]];
    _label_futitle_row_2_2.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][4][@"desc"]];
    _label_futitle_row_2_3.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][5][@"desc"]];
    _label_futitle_row_2_4.text = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][6][@"desc"]];
    
    [_pic_title_row_2_1 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][0][@"image"]]]];
    [_pic_title_row_2_font setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][1][@"image"]]]];
    [_pic_title_row_2_2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][2][@"image"]]]];
    [_pic_title_row_2_3 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][3][@"image"]]]];
    [_pic_title_row_2_4 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][4][@"image"]]]];
    [_pic_title_row_2_5 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][5][@"image"]]]];
    [_pic_title_row_2_6 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][6][@"image"]]]];
    [self addGR_row_2];
}


-(void)addGR_row_2{
    UITapGestureRecognizer *pinch_row_2_1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_2_1:)];
    [self.pgr_row_2_1 addGestureRecognizer:pinch_row_2_1];
    self.pgr_row_2_1.userInteractionEnabled = YES;
    
    
    UITapGestureRecognizer *pinch_row_2_2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_2_2:)];
    [self.pgr_row_2_2 addGestureRecognizer:pinch_row_2_2];
    self.pgr_row_2_2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_2_3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_2_3:)];
    [self.pgr_row_2_3 addGestureRecognizer:pinch_row_2_3];
    self.pgr_row_2_3.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_2_4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_2_4:)];
    [self.pgr_row_2_4 addGestureRecognizer:pinch_row_2_4];
    self.pgr_row_2_4.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_2_5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_2_5:)];
    [self.pgr_row_2_5 addGestureRecognizer:pinch_row_2_5];
    self.pgr_row_2_5.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_2_6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_2_6:)];
    [self.pgr_row_2_6 addGestureRecognizer:pinch_row_2_6];
    self.pgr_row_2_6.userInteractionEnabled = YES;
     
}


-(void)onPinch_row_2_1:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][0][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}


-(void)onPinch_row_2_2:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][1][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_2_3:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][3][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_2_4:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][0][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_2_5:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][5][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_2_6:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][4][@"itemList"][0][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}


-(void)load_row_three{
    _label_title_row_3_1.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][0][@"name"]];
    _label_title_row_3_2.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][1][@"name"]];
    _label_title_row_3_3.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][2][@"name"]];
    _label_title_row_3_4.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][3][@"name"]];
    _label_title_row_3_5.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][4][@"name"]];
    _label_title_row_3_6.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][5][@"name"]];
    _label_title_row_3_7.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][6][@"name"]];
    _label_title_row_3_8.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][7][@"name"]];
    _label_title_row_3_9.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][8][@"name"]];
    _label_title_row_3_10.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][9][@"name"]];
    _label_title_row_3_11.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][10][@"name"]];
    _label_title_row_3_12.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][11][@"name"]];
    _label_title_row_3_13.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][12][@"name"]];
    _label_title_row_3_14.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][13][@"name"]];
    
    _label_futitle_row_3_1.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][0][@"desc"]];
    _label_futitle_row_3_2.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][1][@"desc"]];
    _label_futitle_row_3_3.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][2][@"desc"]];
    _label_futitle_row_3_4.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][3][@"desc"]];
    _label_futitle_row_3_5.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][4][@"desc"]];
    _label_futitle_row_3_6.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][5][@"desc"]];
    _label_futitle_row_3_7.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][6][@"desc"]];
    _label_futitle_row_3_8.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][7][@"desc"]];
    _label_futitle_row_3_9.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][8][@"desc"]];
    _label_futitle_row_3_10.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][9][@"desc"]];
    _label_futitle_row_3_11.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][10][@"desc"]];
    _label_futitle_row_3_12.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][11][@"desc"]];
    _label_futitle_row_3_13.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][12][@"desc"]];
    _label_futitle_row_3_14.text = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][13][@"desc"]];
    
    [_pic_title_row_3_1 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][0][@"image"]]]];
    [_pic_title_row_3_2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][1][@"image"]]]];
    [_pic_title_row_3_3 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][2][@"image"]]]];
    [_pic_title_row_3_4 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][3][@"image"]]]];
    [_pic_title_row_3_5 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][4][@"image"]]]];
    [_pic_title_row_3_6 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][5][@"image"]]]];
    [_pic_title_row_3_7 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][6][@"image"]]]];
    [_pic_title_row_3_8 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][7][@"image"]]]];
    [_pic_title_row_3_9 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][8][@"image"]]]];
    [_pic_title_row_3_10 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][9][@"image"]]]];
    [_pic_title_row_3_11 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][10][@"image"]]]];
    [_pic_title_row_3_12 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][11][@"image"]]]];
    [_pic_title_row_3_13 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][12][@"image"]]]];
    [_pic_title_row_3_14 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][13][@"image"]]]];
    [self addGR_row_3];
}

-(void)addGR_row_3{
    UITapGestureRecognizer *pinch_row_3_1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_1:)];
    [self.pgr_row_3_1 addGestureRecognizer:pinch_row_3_1];
    self.pgr_row_3_1.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_2:)];
    [self.pgr_row_3_2 addGestureRecognizer:pinch_row_3_2];
    self.pgr_row_3_2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_3:)];
    [self.pgr_row_3_3 addGestureRecognizer:pinch_row_3_3];
    self.pgr_row_3_3.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_4:)];
    [self.pgr_row_3_4 addGestureRecognizer:pinch_row_3_4];
    self.pgr_row_3_4.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_5:)];
    [self.pgr_row_3_5 addGestureRecognizer:pinch_row_3_5];
    self.pgr_row_3_5.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_6 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_6:)];
    [self.pgr_row_3_6 addGestureRecognizer:pinch_row_3_6];
    self.pgr_row_3_6.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_7 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_7:)];
    [self.pgr_row_3_7 addGestureRecognizer:pinch_row_3_7];
    self.pgr_row_3_7.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_8 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_8:)];
    [self.pgr_row_3_8 addGestureRecognizer:pinch_row_3_8];
    self.pgr_row_3_8.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_9 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_9:)];
    [self.pgr_row_3_9 addGestureRecognizer:pinch_row_3_9];
    self.pgr_row_3_9.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_10 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_10:)];
    [self.pgr_row_3_10 addGestureRecognizer:pinch_row_3_10];
    self.pgr_row_3_10.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_11 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_11:)];
    [self.pgr_row_3_11 addGestureRecognizer:pinch_row_3_11];
    self.pgr_row_3_11.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_12 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_12:)];
    [self.pgr_row_3_12 addGestureRecognizer:pinch_row_3_12];
    self.pgr_row_3_12.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_13 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_13:)];
    [self.pgr_row_3_13 addGestureRecognizer:pinch_row_3_13];
    self.pgr_row_3_13.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_3_14 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_3_14:)];
    [self.pgr_row_3_14 addGestureRecognizer:pinch_row_3_14];
    self.pgr_row_3_14.userInteractionEnabled = YES;
}

-(void)onPinch_row_3_1:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][0][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_2:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][1][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_3:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][2][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_4:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][3][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_5:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][4][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_6:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][5][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_7:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][6][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_8:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][7][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_9:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][8][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_10:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][9][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_11:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][10][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_12:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][11][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_13:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][12][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_3_14:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][13][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}


-(void)load_row_four{
    _label_row_4_1.text = [NSString stringWithFormat:@" ¥ %@", dic_t[@"data"][@"list"][0][@"price"]];
    _label_row_4_2.text = [NSString stringWithFormat:@" ¥ %@", dic_t[@"data"][@"list"][1][@"price"]];
    _label_row_4_3.text = [NSString stringWithFormat:@" ¥ %@", dic_t[@"data"][@"list"][2][@"price"]];
    [_pic_title_row_4_1 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic_t[@"data"][@"list"][0][@"img"]]]];
    [_pic_title_row_4_2 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic_t[@"data"][@"list"][1][@"img"]]]];
    [_pic_title_row_4_3 setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic_t[@"data"][@"list"][2][@"img"]]]];
    [self addGR_row_4];
}

-(void)addGR_row_4{
    UITapGestureRecognizer *pinch_row_4_1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_4_1:)];
    [self.pic_title_row_4_1 addGestureRecognizer:pinch_row_4_1];
    self.pic_title_row_4_1.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_4_2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_4_2:)];
    [self.pic_title_row_4_2 addGestureRecognizer:pinch_row_4_2];
    self.pic_title_row_4_2.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *pinch_row_4_3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch_row_4_3:)];
    [self.pic_title_row_4_3 addGestureRecognizer:pinch_row_4_3];
    self.pic_title_row_4_3.userInteractionEnabled = YES;
}

-(void)onPinch_row_4_1:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][11][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_4_2:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][11][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}

-(void)onPinch_row_4_3:(UIPinchGestureRecognizer *)pGR{
    NSString *tmp_url = [NSString stringWithFormat:@"%@", dic[@"content"][5][@"itemList"][11][@"action"]];
    NSRange range = [tmp_url rangeOfString:@"http://"];
    NSString *url = [tmp_url substringFromIndex:range.location];
    
    Root_WebViewController *webview = [[Root_WebViewController alloc] initWithNibName:@"Root_WebViewController" bundle:nil];
    webview.url = url;
    [self.navigationController pushViewController:webview animated:YES];
}



-(void)changeTime{
    NSString *str = dic[@"content"][3][@"itemList"][0][@"endDate"];
    NSLog(@"ddd:%@", str);
    /*
    NSString *dateStr = mydata;
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    dateFormatter2.dateFormat = @"EEE, dd MMM yyyy HH:mm:ss z";
    NSDate *newdate = [dateFormatter2 dateFromString:dateStr];
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    dateFormatter.dateFormat = @"y/MM/dd HH:mm eeee";
    model.data = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:newdate]];
    */
}


/*
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_recvData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _recvData.length = 0;
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSString *str = [[NSString alloc] initWithData:_recvData encoding:NSUTF8StringEncoding];
    dic = [str JSONValue];
    for (NSDictionary *tmpDic in dic[@"content"][0][@"itemList"]) {
        [_datascrollview addObject:tmpDic[@"image"]];
    }
    [self start_top_view];
    [self load_top_pic_one];
    [self load_row_one];
    [self load_row_two];
    [self load_row_three];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
}
 */

-(void)requestFinished:(ASIHTTPRequest *)request{
    if (request.tag == 100) {
        NSString *str = [[NSString alloc] initWithData:[request responseData] encoding:NSUTF8StringEncoding];
        dic = [str JSONValue];
        for (NSDictionary *tmpDic in dic[@"content"][0][@"itemList"]) {
            [_datascrollview addObject:tmpDic[@"image"]];
        }
        [self start_top_view];
        [self load_top_pic_one];
        [self load_row_one];
        [self load_row_two];
        [self load_row_three];
    }

    if(request.tag == 101){
        NSString *str = [[NSString alloc] initWithData:[request responseData] encoding:NSUTF8StringEncoding];
        dic_t = [str JSONValue];
        [self load_row_four];
    }

}

-(void)requestFailed:(ASIHTTPRequest *)request{
    NSLog(@"Failed!!!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
