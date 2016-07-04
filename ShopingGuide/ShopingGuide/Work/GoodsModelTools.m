//
//  GoodsModelTools.m
//  ShopingGuide
//
//  Created by 郑南 on 16/6/13.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "GoodsModelTools.h"


@implementation GoodsModelItem

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"ID":@"id"};
}

@end

@implementation GoodsModel


@end

@implementation GoodsModelTools


+(void)goodsType:(NSString *)type GoodsModelFeedback:(GoodsModelToolsFeedbackBlock)goodsModelFeedabck
{
    [[[HttpRequestTools alloc]init] posRequestWithURL:API_COMMODITY_LIST Params:@{@"cid":type} Feedback:^(id resultData, NSError *error) {
        
        
           if(error)
           {
               goodsModelFeedabck(nil,error);
               
           }else
           {
               GoodsModel *goodsModel = [[GoodsModel alloc]init];
               goodsModel.goodsList = [GoodsModelItem mj_objectArrayWithKeyValuesArray:resultData[@"data"]];
               goodsModelFeedabck(goodsModel,nil);
               
           }
        
    }];

}


@end
