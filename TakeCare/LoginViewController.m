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

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *gender;

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
        [self registerMe:_nameTextField.text phone:_phoneTextField.text type:_type gender:_gender];
    }
}

- (void)registerMe:(NSString *)name
             phone:(NSString *)phone
              type:(NSString *)type
            gender:(NSString *)gender {
    NSDictionary *dict = [[NSDictionary alloc]initWithObjectsAndKeys:name,@"name",
                          phone,@"number",
                          type,@"type",
                          gender,@"gender",nil];
    
    [self fetchDataFromServer:dict];
}

- (void)moveToHome {
    
    HomeViewController *homeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    [self.navigationController pushViewController:homeVC animated:YES];
}

- (IBAction)copSegment:(UISegmentedControl *)sender {
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
      self.type = @"Cop";
    }
    else{
        self.type = @"citizen";
    }
}

- (IBAction)sexSegment:(UISegmentedControl *)sender {
    NSInteger selectedSegment = sender.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        self.gender = @"male";
    }
    else{
        self.gender = @"female";
    }
}

@end
