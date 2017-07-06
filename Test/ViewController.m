//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSObjcDelegate <JSExport>

- (void)callCamera;
- (void)share:(NSString *)shareString;

@end

@interface ViewController () <UIWebViewDelegate, JSObjcDelegate>

@property (nonatomic, strong) JSContext *jsContext;
@property (nonatomic, strong) UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    [self.view addSubview:self.webView];
}

- (IBAction)tapButton:(id)sender
{
    
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    self.jsContext = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    self.jsContext[@"Toyun"] = self;
    self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        
    };
}

#pragma mark - JSObjcDelegate

- (void)callCamera {
    NSLog(@"callCamera");
    // 回调js的方法picCallback
    JSValue *picCallback = self.jsContext[@"picCallback"];
    [picCallback callWithArguments:@[@"pics"]];
}

- (void)share:(NSString *)shareString {
    NSArray *argumentArray = [JSContext currentArguments];
    NSLog(@"share: %@", shareString);
    // 回调js的方法shareCallback
    JSValue *shareCallback = self.jsContext[@"shareCallback"];
    [shareCallback callWithArguments:nil];
}

#pragma mark - Accessors

- (UIWebView *)webView {
    if (!_webView) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height - 64;
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, width, height)];
        _webView.delegate = self;
    }
    return _webView;
}

@end
