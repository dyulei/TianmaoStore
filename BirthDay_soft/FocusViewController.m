//
//  FocusViewController.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-14.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "FocusViewController.h"

@interface FocusViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation FocusViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"关注";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self load_webview];
    // Do any additional setup after loading the view from its nib.
}

-(void)load_webview{
    _myWebView.delegate = self;
    //[_myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://chaoshi.m.tmall.com?&disableSearch=1"]]];
    [_myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://mei.tmall.com"]]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
