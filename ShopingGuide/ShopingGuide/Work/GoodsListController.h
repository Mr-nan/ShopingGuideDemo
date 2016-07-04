//
//  GoodsListController.h
//  ShopingGuide
//
//  Created by 郑南 on 16/6/13.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "BaseController.h"

@interface GoodsListController : BaseController

@property (nonatomic,strong) void(^isShowNavigationBlock)(BOOL isShow);
@property (nonatomic,strong) UICollectionView *goodsListView;

@property (nonatomic,assign) NSInteger goodsType;               //  商品类别

@end
