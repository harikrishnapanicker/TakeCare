//
//  ServiceManager.m
//  M Selfie
//
//  Created by HariKrishna Panicker on 09/11/16.
//  Copyright © 2016 HariKrishna Panicker. All rights reserved.
//

#import "ServiceManager.h"

static NSString *const Url = @"http://hacktho.sysnatura.com/authenticate_api/register/";
static NSString *const authValue = @"f8fc8c75-7807-50e3-a615-48b0d00d5a91";

@implementation ServiceManager


-(void) getdata:(NSDictionary *)mapData {
    
    
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    NSURL *url = [NSURL URLWithString:Url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
 
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error == nil) {
            NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data
                                                                     options:NSJSONReadingMutableContainers
                                                                       error:&error];
            [self. delegate successResponse:response];
        } else {
            [self.delegate failureResponse:error];
        }

    }];
    
    [postDataTask resume];
    
    /*
    
    NSString *link = [NSString stringWithFormat:@"%@%@",Url,type];
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    defaultConfigObject.HTTPAdditionalHeaders = @{@"Authorization": authValue};
    
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: self delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask * dataTask = [defaultSession dataTaskWithURL:[NSURL URLWithString:link]
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if(error == nil) {
                                                            NSString* newStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                            NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                 options:NSJSONReadingMutableContainers
                                                                                                                   error:&error];
                                                            [self. delegate successResponse:response];
                                                        } else {
                                                            [self.delegate failureResponse:error];
                                                        }
                                                        
                                                    }];
    
    [dataTask resume];
    
   */
}

+ (NSDictionary *)getLocalDataFromFile:(NSString *)fileName {
     
    NSString *filePath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSError *jsonError;
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
    return jsonDict;
}

@end
