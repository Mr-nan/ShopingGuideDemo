//
//  GoodsInfoController.m
//  ShopingGuide
//
//  Created by 郑南 on 16/6/14.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "GoodsInfoController.h"

@interface GoodsInfoController ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIWebView *goodsInfoView;

@end

@implementation GoodsInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)setUrlStr:(NSString *)urlStr
{
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:urlStr]];
    [self.goodsInfoView loadRequest:request];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.navigationController.navigationBarHidden = scrollView.contentOffset.y>64? YES:NO;
        
    }];
}

- (UIWebView *)goodsInfoView
{
    if(!_goodsInfoView)
    {
        _goodsInfoView = [[UIWebView alloc]initWithFrame:self.view.bounds];
        _goodsInfoView.scrollView.delegate = self;
        [self.view addSubview:_goodsInfoView];

    }
    return _goodsInfoView;
}


@end
