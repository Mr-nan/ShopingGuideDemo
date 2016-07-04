//
//  HttpRequestTools.m
//  icydNew
//
//  Created by 郑南 on 16/2/18.
//  Copyright © 2016年 ZN. All rights reserved.
//

#import "HttpRequestTools.h"
#import "AFNetworking.h"


@interface  HttpRequestTools()
{
    requestFeedback   _feedback;
    NSDictionary      *_params;
    NSString          *_urlStr;
    NSString          *_requestType;
    NSData            *_data;
}

@end

@implementation HttpRequestTools


- (void)getRequestWithURL:(NSString *)url Params:(NSDictionary *)params Feedback:(requestFeedback)feedback
{
    
    _feedback = feedback;
    _urlStr = url;
    _params = params;
    _requestType = @"get";
    AFHTTPSessionManager *manager = [HttpRequestTools httpRequestSessionManager];
    url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,url];
    
    if(params == nil)
    {
        params = [[NSDictionary alloc]init];
    }
    ZNLog(@"get  %@",url);
    
    [manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self requestConnectionResponseObject:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSError *AFerror = [NSError errorWithDomain:@"网络异常" code:KAFErrorCode userInfo:nil];
        feedback(nil,AFerror);
    }];
    
}


- (void)posRequestWithURL:(NSString *)url Params:(NSDictionary *)params Feedback:(requestFeedback)feedback
{
    _feedback = feedback;
    _urlStr = url;
    _params = params;
    _requestType = @"pos";
    AFHTTPSessionManager *manager = [HttpRequestTools httpRequestSessionManager];
    url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,url];
    
    if(params == nil)
    {
        params = [[NSDictionary alloc]init];
    }
    ZNLog(@"post  %@",url);
   

    [manager POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        [self requestConnectionResponseObject:responseObject];
   
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSError *AFerror = [NSError errorWithDomain:@"网络异常" code:KAFErrorCode userInfo:nil];
        feedback(nil,AFerror);
        ZNLog(@"post  %@",error);
    }];
}

-(void)upDataWithURL:(NSString *)url Params:(NSDictionary *)params Data:(NSData *)data Feedback:(requestFeedback)feedback
{

    _feedback = feedback;
    _urlStr = url;
    _params = params;
    _requestType = @"pos";
    AFHTTPSessionManager *sessionManger = [HttpRequestTools httpRequestSessionManager];
    url = [NSString stringWithFormat:@"%@%@",SERVER_HOST,url];
    
    if(params == nil)
    {
        params = [[NSDictionary alloc]init];
    }
//    ZNLog(@"%@",url);
//    ZNLog(@"%@",[params commonParams]);
    
    [sessionManger POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        NSString *fileName =[NSString stringWithFormat:@"%@.png",[formatter stringFromDate:[NSDate date]]];
        [formData appendPartWithFileData:data name:@"imgFileName" fileName:fileName mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self requestConnectionResponseObject:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSError *AFerror = [NSError errorWithDomain:@"网络异常" code:KAFErrorCode userInfo:nil];
        feedback(nil,AFerror);
    }];
    

}

- (void)requestConnectionResponseObject:(id)responseObject
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

    NSDictionary *resonse = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    NSNumber *errCode = [resonse objectForKey:@"errCode"];
    
    ZNLog(@"%@",resonse);
    
    NSError *error = nil;
    switch ([errCode integerValue]) {
            
        case 0:
            _feedback(resonse[@"data"],nil);
            break;
            
        default:
            error = [NSError errorWithDomain:resonse[@"errMsg"] code:[errCode integerValue] userInfo:nil];
            _feedback(resonse[@"data"],error);
            
            break;
    }


}


+(AFHTTPSessionManager *)httpRequestSessionManager
{
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    sessionManager.requestSerializer.timeoutInterval = 15.f;
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    return sessionManager;
}





@end
