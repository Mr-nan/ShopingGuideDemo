//
//  GoodsInfoViewCell.m
//  ShopingGuide
//
//  Created by 郑南 on 16/6/13.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "GoodsInfoViewCell.h"

@interface GoodsInfoViewCell()

@property (nonatomic,strong) UIImageView    *imageView;
@property (nonatomic,strong) UIView         *contentBaseView;
@property (nonatomic,strong) UILabel        *titleLabel;
@property (nonatomic,strong) UILabel        *priceLabel;

@end

@implementation GoodsInfoViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self createUI];
    }
    return self;

}


- (void)createUI
{
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 40)];
    self.imageView.backgroundColor = [UIColor redColor];
    [self addSubview:self.imageView];
    
    self.contentBaseView = [[UIView alloc]initWithFrame:CGRectMake(0, self.imageView.bottom, self.width, 40)];
    self.contentBaseView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentBaseView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, self.contentBaseView.width - 10, 20)];
    self.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.contentBaseView addSubview:self.titleLabel];
    
    self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, self.titleLabel.bottom, self.contentBaseView.width - 10, 20)];
    self.priceLabel.font = [UIFont systemFontOfSize:12];
    self.priceLabel.textColor = [ThemeElement MainColor];
    [self.contentBaseView addSubview:self.priceLabel];
}

- (void)setGoodsItem:(GoodsModelItem *)goodsItem
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:goodsItem.pic]];
    self.titleLabel.text = goodsItem.title;
    self.priceLabel.text = [NSString stringWithFormat:@"价格:%@元",goodsItem.price];

}

@end
