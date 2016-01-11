//
//  ViewController.m
//  TestSRWebSocket
//
//  Created by apple2 on 16/1/10.
//  Copyright © 2016年 shiyuwudi. All rights reserved.
//

#import "ViewController.h"
#import "SocketRocket/SRWebSocket.h"

@interface ViewController ()<SRWebSocketDelegate>

@end

@implementation ViewController

#pragma mark - 声明周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    [self SRInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 初始化
-(void)SRInit{
    NSString *urlStr = @"ws://101.200.229.251/html/demo.php";
    //http://101.200.229.251/html/demo.php
    NSURL *url = [NSURL URLWithString:urlStr];
    SRWebSocket *webSocket = [[SRWebSocket alloc]initWithURL:url];
    webSocket.delegate = self;
    [webSocket open];
}

#pragma mark - Web Socket代理
//成功开启
-(void)webSocketDidOpen:(SRWebSocket *)webSocket{
    NSLog(@"Web Socket开启成功!");
}
//收到消息
-(void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message{
    NSLog(@"收到消息:%@",message);
}
//出错
-(void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error{
    NSLog(@"出错了!错误信息:%@",[error localizedDescription]);
}
//关闭
-(void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean{
    NSLog(@"Web Socket关闭! code:%lu 原因:%@ 是否完全清理:%@",(long)code, reason,wasClean?@"是":@"否");
}

@end
