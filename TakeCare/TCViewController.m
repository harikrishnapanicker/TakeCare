//
//  TCViewController.m
//  TakeCare
//
//  Created by HariKrishna Panicker on 11/11/16.
//  Copyright © 2016 HariKrishna Panicker. All rights reserved.
//

#import "TCViewController.h"
#import "ServiceManager.h"

@interface TCViewController () <ServiceDelegate> {
    ServiceManager *manager;
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation TCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)fetchDataFromServer:(NSDictionary *)requestParameter {
    [self showActivityIndicator];
    manager = [[ServiceManager alloc]init];
    manager.delegate = self;
    [manager getdata:requestParameter];
}

-(void)showActivityIndicator {
    
    if (!activityIndicator) {
        activityIndicator = [[UIActivityIndicatorView alloc]init];
        activityIndicator.center = self.view.center;
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [self.view addSubview:activityIndicator];
    }
    [activityIndicator startAnimating];
}

- (void)stopActvityIndicator {
    [activityIndicator stopAnimating];
    [activityIndicator hidesWhenStopped];
}

- (void)successResponse:(NSDictionary *)response {
    [self stopActvityIndicator];
}
- (void)failureResponse:(NSDictionary *)response {
    [self stopActvityIndicator];
}

- (NSDictionary *)getMockData:(NSString *)file {
    return [ServiceManager getLocalDataFromFile:file];
}

- (void)showAlertMessage:(NSString *)message {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"TAKE CARE" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
