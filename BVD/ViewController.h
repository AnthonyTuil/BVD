//
//  ViewController.h
//  BVD
//
//  Created by Anthony Tuil on 25/02/2014.
//  Copyright (c) 2014 Anthony Tuil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigViewController.h"
#import "TrackViewController.h"

@interface ViewController : UIViewController{
    UIButton *trackButton;
    UIButton *emitButton;
    ConfigViewController *configVC;
    TrackViewController *trackVC;
}

@end
