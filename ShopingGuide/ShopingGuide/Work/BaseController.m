//
//  BaseController.m
//  ShopingGuide
//
//  Created by 郑南 on 16/6/12.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = nil;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"left"] style:UIBarButtonItemStyleDone target:self action:@selector(backBarBtnClick)];
    
}

- (void)backBarBtnClick
{
    [self.navigationController popViewControllerAnimated:YES];
}





@end
