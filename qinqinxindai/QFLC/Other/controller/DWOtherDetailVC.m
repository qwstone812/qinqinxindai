//
//  DWOtherDetailVC.m
//  DaiWorld
//
//  Created by Miley on 2021/1/4.
//  Copyright © 2021 Eiu. All rights reserved.
//

#import "DWOtherDetailVC.h"
#import "WYWebProgressLayer.h"
#import <WebKit/WebKit.h>
@interface DWOtherDetailVC ()<WKNavigationDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)WKWebView *webView;
@property (nonatomic,strong)NSString * strWithNetURL;

@end

@implementation DWOtherDetailVC

{
    WYWebProgressLayer *_progressLayer; ///< 网页加载进度条
}
- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
        _webView.backgroundColor=[UIColor whiteColor];
        _webView.navigationDelegate =self;
        [self.view addSubview:_webView];
        
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.top.mas_equalTo(self.view.mas_top).offset(NaviHeight);
        }];
    }
    return _webView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.backHidden = NO;
    self.navigationItem.title = self.titleProductStr;
    self.view.backgroundColor= [UIColor whiteColor];
    [self.view addSubview:self.webView];
    
    _progressLayer = [WYWebProgressLayer new];
    _progressLayer.frame = CGRectMake(0, NaviHeight, KWIDTH, 2);
    
    [self.view.layer addSublayer:_progressLayer];
    
    //设置webview代理,跟踪加载请求,
    self.webView.navigationDelegate = self;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    //网页内容缩小到适应整个设备屏幕
//    self.webView.scalesPageToFit = YES;
    
    //检测网页中的各种特殊的字符串 比如:电话,网址,能自动识别,在用户长按时,从底部弹出菜单操作
//    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;//全部都识别
    NSURL *webURL = [NSURL URLWithString:self.url];
    [self.webView loadRequest:[NSURLRequest requestWithURL:webURL]];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];

}
// 根据监听 实时修改title
- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSString *,id> *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"title"]) {
        if (object == self.webView)
        {
            self.title = self.webView.title;
        }
        else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
        
    }
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}
-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    [_progressLayer startLoad];

}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [_progressLayer finishedLoad];
//    [webView evaluateJavaScript:@"document.title" completionHandler:^(id _Nullable object, NSError * _Nullable error) {
//
//    }];
//    NSString *spanStr = [NSString stringWithFormat:@"var objs = document.querySelectorAll('input[placeholder*=\"手机\"]');\n"
//    "for(var i=0; i<objs.length; i++) {\n"
//    "if(i == 0 )objs[i].value='%@';}",DaichaoPhone];
//    [webView evaluateJavaScript:spanStr completionHandler:^(id _Nullable rest, NSError * _Nullable error) {
//
//          }];

}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"收到响应%@",navigationResponse.response.URL.absoluteString);
    
//    self.strWithNetURL = navigationResponse.response.URL.absoluteString;
    
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
    
}
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    NSLog(@"发送请求-----》%@",navigationAction.request.URL.absoluteString);
    
    NSURL *url = navigationAction.request.URL;
    
    UIApplication *application = [UIApplication sharedApplication];
    
    // 获得协议头(可以自定义协议头，根据协议头判断是否要执行跳转)
//    NSString *scheme = navigationAction.request.URL.scheme;
    
    NSString *string = navigationAction.request.URL.absoluteString;
    
    
    //跳转APPstrong
    if ([string containsString:@"itunes.apple.com"] ||[string containsString:@"apps.apple.com"]) {
        [application openURL:[NSURL URLWithString:string]];
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    //企业包
    else if (url.scheme && ![url.scheme hasPrefix:@"http"]) {
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
     decisionHandler(WKNavigationActionPolicyCancel);
     return;
    }
    
    
    // 调用电话
    if ([url.scheme isEqualToString:@"tel"])
    {
        if ([application canOpenURL:url])
        {
            [application openURL:url];
            decisionHandler(WKNavigationActionPolicyCancel);
            return;
        }
    }
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
}
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
//    NSLog(@"%@",error);
    [_progressLayer finishedLoad];
}


- (void)dealloc {
    [_progressLayer closeTimer];
    [_progressLayer removeFromSuperlayer];
    _progressLayer = nil;
    [self.webView removeObserver:self forKeyPath:@"title" context:nil];

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
