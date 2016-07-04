//
//  HttpRequestTools.h
//  icydNew
//
//  Created by 郑南 on 16/2/18.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^requestFeedback)(id resultData,NSError *error);

@interface HttpRequestTools : NSObject

-(void)getRequestWithURL:(NSString *)url Params:(NSDictionary *)params Feedback:(requestFeedback)feedback;
-(void)posRequestWithURL:(NSString *)url Params:(NSDictionary *)params Feedback:(requestFeedback)feedback;
-(void)upDataWithURL:(NSString *)url     Params:(NSDictionary *)params Data:(NSData *)data Feedback:(requestFeedback)feedback;

@end
