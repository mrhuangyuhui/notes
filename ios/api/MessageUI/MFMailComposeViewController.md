<!-- #ios-mail -->
<!-- omit in toc -->
# Class MFMailComposeViewController

- [Overview](#overview)
- [Checking the Availability of the Composition Interface](#checking-the-availability-of-the-composition-interface)
- [Configuring and Displaying the Composition Interface](#configuring-and-displaying-the-composition-interface)

<https://developer.apple.com/documentation/messageui/mfmailcomposeviewcontroller>

A standard view controller, whose interface lets the user manage, edit, and send email messages.

Availability: iOS 3.0+

## Overview

- Use this view controller to display a standard email interface inside your app.
- An alternate way to compose emails is to create and open a URL that uses the mailto scheme. ([Mail Links](https://developer.apple.com/library/archive/featuredarticles/iPhoneURLScheme_Reference/MailLinks/MailLinks.html#//apple_ref/doc/uid/TP40007899-CH4-SW1))

## Checking the Availability of the Composition Interface

- Before presenting the mail compose view controller, always call the the [canSendMail()](https://developer.apple.com/documentation/messageui/mfmailcomposeviewcontroller/1616879-cansendmail) method to see if the current device is configured to send email.

Checking the availability of mail services

```objc
#import <MessageUI/MessageUI.h>

if (![MFMailComposeViewController canSendMail]) {
   NSLog(@"Mail services are not available.");
   return;
}
```

## Configuring and Displaying the Composition Interface

- The mail compose view controller is not dismissed automatically.

Configuring and presenting the composition interface

```objc
#import <MessageUI/MessageUI.h>

MFMailComposeViewController* composeVC = [[MFMailComposeViewController alloc] init];
composeVC.mailComposeDelegate = self;

// Configure the fields of the interface.
[composeVC setToRecipients:@[@"address@example.com"]];
[composeVC setSubject:@"Hello!"];
[composeVC setMessageBody:@"Hello from California!" isHTML:NO];

// Present the view controller modally.
[self presentViewController:composeVC animated:YES completion:nil];
```

Dismissing the mail compose view controller

```objc
#import <MessageUI/MessageUI.h>

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
   // Check the result or perform other tasks.

   // Dismiss the mail compose view controller.
   [self dismissViewControllerAnimated:YES completion:nil];
}
```
