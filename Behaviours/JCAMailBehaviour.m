//
//  JCAMailBehaviour.m
//
//  Created by Josip Ćavar on 16/06/14.
//  Copyright (c) 2014 Josip Ćavar. All rights reserved.
//

#import "JCAMailBehaviour.h"
#import "objc/runtime.h"

@import MessageUI;

@interface JCAMailBehaviour () <MFMailComposeViewControllerDelegate>

@end

@implementation JCAMailBehaviour

- (IBAction)buttonMailTouchUpInside:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
        mailComposeViewController.mailComposeDelegate = self;
        mailComposeViewController.toRecipients = @[[self.owner valueForKeyPath:self.modelKeyPath]];
        [self.owner presentViewController:mailComposeViewController animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Mail not available" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
    }
    
}

#pragma mark - MFMailComposeViewControllerDelegate methods

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    
    if (result == MFMailComposeResultFailed) {
        [[[UIAlertView alloc] initWithTitle:@"Mail error" message:@"An error occured and your mail was not sent." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
    [self.owner dismissViewControllerAnimated:YES completion:nil];
}

@end
