//
//  ThemeElement.m
//  ShopingGuide
//
//  Created by 郑南 on 16/6/13.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "ThemeElement.h"

@implementation ThemeElement

+(UIColor *)ColorRed:(CGFloat)r Green:(CGFloat)g Blue:(CGFloat)b Alpha:(CGFloat)a
{
    return [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:a];
}


+(UIColor *)MainColor
{
  return [UIColor colorWithRed:1.00f green:0.32f blue:0.32f alpha:1.00f];
}


+(UIColor *)TitleColor
{
    return [ThemeElement ColorRed:34 Green:34 Blue:34 Alpha:1];
}

+(NSInteger )TitleFontNumber
{
    return 16;
}


@end
