//
//  QFLC_XieyiVC.m
//  qinqinxindai
//
//  Created by zrmac on 30.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_XieyiVC.h"

#import <WebKit/WebKit.h>
@interface QFLC_XieyiVC ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation QFLC_XieyiVC





- (void)viewDidLoad {
    
    
    [super viewDidLoad];
    
    self.navigationItem.title = _titleStr;
    
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, KSCREEN_WIDTH, KSCREEN_HEIGHT - SafeAreaTopHeight)];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
   
//    [webView loadHTMLString:strHTML baseURL:nil];
    [self.view addSubview:_webView];
}




- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
//    修改字体大小 300%
    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '150%'" completionHandler:nil];
//
//    //修改字体颜色  #9098b8
//    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#0078f0'" completionHandler:nil];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
