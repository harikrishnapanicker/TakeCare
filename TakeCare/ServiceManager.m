//
//  ServiceManager.m
//  M Selfie
//
//  Created by HariKrishna Panicker on 09/11/16.
//  Copyright © 2016 HariKrishna Panicker. All rights reserved.
//

#import "ServiceManager.h"

static NSString *const Url = @"https://developer.manoramaonline.com/";
static NSString *const authValue = @"f8fc8c75-7807-50e3-a615-48b0d00d5a91";

@implementation ServiceManager


-(void) getdata:(NSDictionary *)type {
    
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
    
   
}

+ (NSDictionary *)getLocalDataFromFile:(NSString *)fileName {
     
    NSString *filePath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSError *jsonError;
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:&jsonError];
    return jsonDict;
}

@end
