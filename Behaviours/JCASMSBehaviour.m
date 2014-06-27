//
//  JCASMSBehaviour.m
//
//  Created by Josip Ćavar on 27/06/14.
//  Copyright (c) 2014 Josip Ćavar. All rights reserved.
//

#import "JCASMSBehaviour.h"
#import "objc/runtime.h"

@import MessageUI;

@interface JCASMSBehaviour () <MFMessageComposeViewControllerDelegate>

@end

@implementation JCASMSBehaviour

- (IBAction)buttonSMSTouchUpInside:(id)sender {
    
    if ([MFMessageComposeViewController canSendText]) {
        MFMessageComposeViewController *messageComposeViewController = [[MFMessageComposeViewController alloc] init];
        messageComposeViewController.messageComposeDelegate = self;
        messageComposeViewController.recipients = @[[[self.owner valueForKeyPath:self.modelKeyPath] lastObject]];
        [self.owner presentViewController:messageComposeViewController animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"SMS not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
}

#pragma mark - MFMessageComposeViewControllerDelegate methods

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {

    if (result == MFMailComposeResultFailed) {
        [[[UIAlertView alloc] initWithTitle:@"SMS error" message:@"An error occured and your mail was not sent." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    [self.owner dismissViewControllerAnimated:YES completion:nil];
}

@end
