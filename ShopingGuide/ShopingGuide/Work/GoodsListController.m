//
//  GoodsListController.m
//  ShopingGuide
//
//  Created by 郑南 on 16/6/13.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "GoodsListController.h"
#import "GoodsModelTools.h"
#import "GoodsInfoViewCell.h"
#import "GoodsInfoController.h"

@interface GoodsListController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) GoodsModel *goodsModel;
@end

@implementation GoodsListController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self loadData];
    
}


- (void)loadData
{
    [GoodsModelTools goodsType:[@(self.goodsType) stringValue] GoodsModelFeedback:^(GoodsModel *goodsModel, NSError *error) {
        
            if(!error)
            {
                _goodsModel = goodsModel;
                [self.view addSubview:self.goodsListView];
            }
    }];

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _goodsModel.goodsList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsInfoViewCell *cell = [collectionView  dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell sizeToFit];
    cell.goodsItem = (GoodsModelItem *) [self.goodsModel.goodsList objectAtIndex:indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsModelItem *item = [_goodsModel.goodsList objectAtIndex:indexPath.row];
    GoodsInfoController *goodsInfoVC = [[GoodsInfoController alloc]init];
    goodsInfoVC.urlStr = item.url;
    goodsInfoVC.title = item.title;
    [self.navigationController pushViewController:goodsInfoVC animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.isShowNavigationBlock(scrollView.contentOffset.y > 64? YES:NO);
}

- (UICollectionView *)goodsListView
{
    if(!_goodsListView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        
        CGFloat contentWidth  = (self.view.width - 10)/2;
        flowLayout.headerReferenceSize = CGSizeMake(self.view.width, 20);
        flowLayout.itemSize = CGSizeMake(contentWidth, contentWidth*1.2);    //  cell的大小
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 5, 0);
        
        _goodsListView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        [_goodsListView registerClass:[GoodsInfoViewCell class] forCellWithReuseIdentifier:@"cell"];
        _goodsListView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        _goodsListView.backgroundColor = [UIColor colorWithRed:0.93f green:0.94f blue:0.95f alpha:1.00f];
        _goodsListView.dataSource = self;
        _goodsListView.delegate = self;
    }
    return _goodsListView;
}


@end
