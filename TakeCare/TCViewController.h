//
//  TCViewController.h
//  TakeCare
//
//  Created by HariKrishna Panicker on 11/11/16.
//  Copyright © 2016 HariKrishna Panicker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCViewController : UIViewController

- (void)fetchDataFromServer:(NSString *)requestParameter;

- (void)showActivityIndicator;

- (void)stopActvityIndicator;

- (void)successResponse:(NSDictionary *)response;

- (void)failureResponse:(NSDictionary *)response;

- (NSDictionary *)getMockData:(NSString *)file;

- (void)showAlertMessage:(NSString *)message;

@end
