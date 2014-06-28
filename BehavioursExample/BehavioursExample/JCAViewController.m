//
//  JCAViewController.m
//  BehavioursExample
//
//  Created by Josip Ćavar on 28/06/14.
//  Copyright (c) 2014 Planet 1107. All rights reserved.
//

#import "JCAViewController.h"

@interface JCAViewController ()

@property (strong, nonatomic) NSString *toRecipient;

@end

@implementation JCAViewController

#pragma mark - Object lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _toRecipient = @"josipcavar04@gmail.com";
    }
    return self;
}


#pragma mark - View lifecycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
