//
//  JCACameraGalleryBehaviour.m
//
//  Created by Josip Ćavar on 27/06/14.
//  Copyright (c) 2014 Josip Ćavar. All rights reserved.
//

#import "JCACameraGalleryBehaviour.h"

@interface JCACameraGalleryBehaviour () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageViewPickedImage;

@end

@implementation JCACameraGalleryBehaviour

- (IBAction)presentOptions {
    
    UIActionSheet *actionSheetOptions = [[UIActionSheet alloc] initWithTitle:@"Choose source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Gallery", @"Camera", nil];
    [actionSheetOptions showInView:self.owner.view];
}

#pragma mark - UIActionSheetDelegate methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    if (buttonIndex == 0) {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    } else if (buttonIndex == 1) {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    if ([UIImagePickerController isSourceTypeAvailable:imagePickerController.sourceType]) {
        [self.owner presentViewController:imagePickerController animated:YES completion:nil];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Source type not available on this device" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];

    }
}

#pragma mark - UIImagePickerControllerDelegate methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    self.imageViewPickedImage.image = info[UIImagePickerControllerOriginalImage];
    [self.owner dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [self.owner dismissViewControllerAnimated:YES completion:nil];
}


@end
