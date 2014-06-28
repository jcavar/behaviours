//
//  JCACallBehaviour.m
//
//  Created by Josip Ćavar on 27/06/14.
//  Copyright (c) 2014 Josip Ćavar. All rights reserved.
//

#import "JCACallBehaviour.h"

@implementation JCACallBehaviour

- (IBAction)call {
    
    NSURL *phoneUrl = [NSURL URLWithString:[NSString  stringWithFormat:@"telprompt:%@", self.callNumber]];
    if ([[UIApplication sharedApplication] canOpenURL:phoneUrl]) {
        [[UIApplication sharedApplication] openURL:phoneUrl];
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Call is not available!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

@end
