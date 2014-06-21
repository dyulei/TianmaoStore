//
//  Root_WebViewController.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-20.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "Root_WebViewController.h"

@interface Root_WebViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
@end

@implementation Root_WebViewController

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
    [self load_webview];
    // Do any additional setup after loading the view from its nib.
}

-(void)load_webview{
    _myWebView.delegate = self;
    [_myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
