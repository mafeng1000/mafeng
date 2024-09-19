//
//  HTHomeRootViewController.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTHomeRootViewController.h"
#import "THHomeViewController.h"
#import "THHomeVideoViewController.h"
#import "THHomeIPTVViewController.h"
#import "THHomeCartoonViewController.h"


@interface HTHomeRootViewController ()

@end

@implementation HTHomeRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [HTNetworkingTool getWithUrl:@"264" params:@{} success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
//        
//        } failed:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error, id  _Nullable responseObject) {
//                
//        } IsNeedHub:YES];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [HTNetworkingTool postWithUrl:@"264/" params:@{@"id":@"3003138",@"p1":@"3",@"i1":@"0",@"g1":@"3",@"apns_id":@""} success:^(NSURLSessionDataTask * _Nullable task, id  _Nullable responseObject) {
        
    } failed:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error, id  _Nullable responseObject) {
        
    } IsNeedHub:YES];
    
}


@end
