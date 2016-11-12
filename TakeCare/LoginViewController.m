//
//  LoginViewController.m
//  TakeCare
//
//  Created by HariKrishna Panicker on 11/11/16.
//  Copyright © 2016 HariKrishna Panicker. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *phoneTextField;
@property (nonatomic, strong) IBOutlet UISegmentedControl *segmentCop;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark uitextfield delegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}


- (IBAction)Go:(id)sender {
    
    if ([_nameTextField.text isEqualToString:@""]) {
        [self showAlertMessage:@"Invalid Username"];
    } else if ([_phoneTextField.text isEqualToString:@""] || _phoneTextField.text.length != 10) {
        [self showAlertMessage:@"Invalid PhoneNumber"];
    } else {
        [self moveToHome];
    }
}

- (void)moveToHome {
    
    HomeViewController *homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:homeVC animated:YES];
}

- (IBAction)copSegment:(UISegmentedControl *)sender {
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        
    }
    else{
        
    }
}

- (IBAction)sexSegment:(UISegmentedControl *)sender {
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        
    }
    else{
        
    }
}

@end
