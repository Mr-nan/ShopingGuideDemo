//
//  MainController.m
//  ShopingGuide
//
//  Created by 郑南 on 16/6/12.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "MainController.h"
#import "GoodsListController.h"
#import "MenuView.h"
#import "GoodsInfoController.h"
@interface MainController ()

@property (nonatomic,strong) NSArray    *titleArray;
@property (nonatomic,strong) MenuView   *menuView;

@end

@implementation MainController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setUIElement];
    
}


#pragma mark -设置UI属性

- (void)setUIElement
{
    self.titleArray = [NSArray arrayWithObjects:@"最新推荐",@"衣服",@"包包",@"鞋",@"美妆",@"美食", nil];

    self.adjustStatusBarHeight = YES;
    
    self.cellWidth = 80;
    self.normalTextColor = [ThemeElement TitleColor];
    self.selectedTextColor = [ThemeElement MainColor];
    self.progressColor = [ThemeElement MainColor];
    self.pagerBarColor = [ThemeElement MainColor];
    
    self.normalTextFont = [UIFont systemFontOfSize:15];
    self.selectedTextFont = [UIFont systemFontOfSize:16];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [ThemeElement TitleColor];
    UILabel *navigationTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    navigationTitle.text = @"搜拼";
    navigationTitle.textAlignment = NSTextAlignmentCenter;
    navigationTitle.textColor = [ThemeElement MainColor];
    navigationTitle.font = [UIFont boldSystemFontOfSize:30];
    self.navigationItem.titleView = navigationTitle;
    
    
    UIBarButtonItem *menuBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"zhe_menu"] style:UIBarButtonItemStyleDone target:self action:@selector(menuBtnClick)];
    self.navigationItem.leftBarButtonItem = menuBtn;
    
    UIBarButtonItem *moreBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"nav_search_icon"] style:UIBarButtonItemStyleDone target:self action:nil];
    self.navigationItem.rightBarButtonItem = moreBtn;
    
    
    
}

- (void)menuBtnClick
{
    [self.menuView menuShow];
}


- (NSInteger)numberOfControllersInPagerController
{
    return self.titleArray.count;
}

- (NSString *)pagerController:(TYPagerController *)pagerController titleForIndex:(NSInteger)index
{
    return [self.titleArray objectAtIndex:index];

}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index
{
    GoodsListController *goodsListVC = [[GoodsListController alloc]init];
    goodsListVC.isShowNavigationBlock = ^(BOOL isShow){
    
        [UIView animateWithDuration:0.25 animations:^{
            
            self.navigationController.navigationBarHidden = isShow;

        }];
        
    };
    goodsListVC.goodsType = index +1;
    return goodsListVC;
}

- (MenuView *)menuView
{
   if(_menuView == nil)
   {
       _menuView = [[MenuView alloc]init];
       
   }
    return _menuView;

}

@end
