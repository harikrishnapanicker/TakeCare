//
//  ServiceManager.h
//  M Selfie
//
//  Created by HariKrishna Panicker on 09/11/16.
//  Copyright © 2016 HariKrishna Panicker. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServiceDelegate <NSObject>

- (void)successResponse:(NSDictionary *)response;
- (void)failureResponse:(NSError *)error;

@end

@interface ServiceManager : NSObject

@property (nonatomic,strong)id <ServiceDelegate>delegate;

-(void) getdata:(NSString *)type;

+ (NSDictionary *)getLocalDataFromFile:(NSString *)fileName;

@end
