//
//  ThemeElement.h
//  ShopingGuide
//
//  Created by 郑南 on 16/6/13.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ThemeElement : NSObject

+(UIColor *)ColorRed:(CGFloat)r Green:(CGFloat)g Blue:(CGFloat)b Alpha:(CGFloat)a;



+(UIColor *)MainColor;

+(UIColor *)TitleColor;

+(NSInteger )TitleFontNumber;

@end
