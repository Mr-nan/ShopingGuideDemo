//
//  MenuView.m
//  ShopingGuide
//
//  Created by 郑南 on 16/6/13.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "MenuView.h"

@interface MenuView ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSArray        *titleArray;

@end

@implementation MenuView

- (instancetype)init
{
    self = [super init];
    if (self) {
    
        _titleArray = @[@{@"我的收藏":@"userInfo_like_logo"},@{@"我的足迹":@"userInfo_browse_logo"},@{@"关于我们":@"userInfo_about_juanpi_logo"}];
        [self addSubview:self.tableView];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
        

    }
    return self;
}


- (void)menuShow
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIView animateWithDuration:0.25 animations:^{
        
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
    }];
}

- (void)menuHidde
{
    [UIView animateWithDuration:0.25 animations:^{
        
        
        self.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];

    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSDictionary *dict = _titleArray[indexPath.row];
    for (NSString *keyStr in dict.allKeys)
    {
        
        cell.imageView.image= [UIImage imageNamed:dict[keyStr]];
        cell.textLabel.text = keyStr;
        
    }
    return cell;
}

- (UITableView *)tableView
{
    if(_tableView==nil)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.75, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _tableView.width, 250)];
        headView.backgroundColor = [ThemeElement MainColor];
        _tableView.tableHeaderView = headView;
    }
    return _tableView;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self menuHidde];
}

@end
