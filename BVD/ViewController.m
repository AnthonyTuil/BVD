//
//  ViewController.m
//  BVD
//
//  Created by Anthony Tuil on 25/02/2014.
//  Copyright (c) 2014 Anthony Tuil. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    trackButton = [[UIButton alloc] init];
    trackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [trackButton setTitle:@"Track Beacon" forState:UIControlStateNormal];
    trackButton.frame = CGRectMake(50, 100, 100, 50);
    [trackButton addTarget:self action:@selector(loadTrackView) forControlEvents:UIControlEventTouchUpInside];
    
    emitButton = [[UIButton alloc] init];
    emitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [emitButton setTitle:@"Transmit Beacon" forState:UIControlStateNormal];
    emitButton.frame = CGRectMake(50, 200, 100, 50);
    [emitButton addTarget:self action:@selector(loadTransmitView) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:trackButton];
    [self.view addSubview:emitButton];
    
    


}

-(void)loadTrackView{
    
    trackVC = [[TrackViewController alloc] init];
    trackVC.view.frame = self.view.bounds;

    [self.view addSubview:trackVC.view];
    
    
}

-(void)loadTransmitView{
    configVC = [[ConfigViewController alloc] init];
    configVC.view.frame = self.view.bounds;
    
    [self.view addSubview:configVC.view];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
