//
//  ViewController.h
//  WebViewApp
//
//  Created by Benjamine Mutebi on 2/26/15.
//  Copyright (c) 2015 Benjamine Mutebi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UITextField * myTextField;
    IBOutlet UIButton * button;
    IBOutlet UIWebView * webPage;
}

-(IBAction)btnPressed;


@end

