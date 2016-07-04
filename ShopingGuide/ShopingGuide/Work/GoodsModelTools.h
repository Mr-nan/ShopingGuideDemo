//
//  GoodsModelTools.h
//  ShopingGuide
//
//  Created by 郑南 on 16/6/13.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GoodsModelItem : NSObject

@property (nonatomic,copy)NSString *ID;
@property (nonatomic,copy)NSString *pic;            //  图片地址
@property (nonatomic,copy)NSString *price;          //  价格
@property (nonatomic,copy)NSString *title;          //  标题
@property (nonatomic,copy)NSString *sellernick;     //  商店
@property (nonatomic,copy)NSString *url;            //  详细地址

@end

@interface GoodsModel : NSObject

@property (nonatomic,strong) NSMutableArray *goodsList;

@end

typedef void(^GoodsModelToolsFeedbackBlock)(GoodsModel *goodsModel,NSError *error);

@interface GoodsModelTools : NSObject

+(void)goodsType:(NSString *)type GoodsModelFeedback:(GoodsModelToolsFeedbackBlock)goodsModelFeedabck;

@end
