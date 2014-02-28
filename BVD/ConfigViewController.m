//
//  ConfigViewController.m
//  BVD
//
//  Created by Anthony Tuil on 26/02/2014.
//  Copyright (c) 2014 Anthony Tuil. All rights reserved.
//

#import "ConfigViewController.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

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
	self.view.backgroundColor = [UIColor whiteColor];
    transmit = [[UIButton alloc] init];
    transmit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [transmit setTitle:@"Track Beacon" forState:UIControlStateNormal];
    transmit.frame = CGRectMake(50, 350, 100, 50);
    [transmit addTarget:self action:@selector(transmitBeacon:) forControlEvents:UIControlEventTouchUpInside];
    
    uuidLabel = [[UILabel alloc] init];
    uuidLabel.frame = CGRectMake(10, 0, 50, 200);

    majorLabel = [[UILabel alloc] init];
    majorLabel.frame = CGRectMake(10, 50, 50, 200);
    
    minorLabel = [[UILabel alloc] init];
    minorLabel.frame = CGRectMake(10, 100, 50, 200);
    
    identityLabel = [[UILabel alloc] init];
    identityLabel.frame = CGRectMake(10, 150, 50, 200);
    
    
    [self.view addSubview:uuidLabel];
    [self.view addSubview:majorLabel];
    [self.view addSubview:minorLabel];
    [self.view addSubview:identityLabel];
    [self.view addSubview:transmit];
    
}

- (void)initBeacon {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B0B2A75E-A6CE-4E51-AE5B-C497C3C15FB4"];
    beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                                major:1
                                                                minor:1
                                                           identifier:@"com.devfright.myRegion"];
}

- (void)transmitBeacon:(UIButton *)sender {
    beaconPeripheralData = [beaconRegion peripheralDataWithMeasuredPower:nil];
    peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                                     queue:nil
                                                                   options:nil];
}

- (void)setLabels {
    uuidLabel.text = beaconRegion.proximityUUID.UUIDString;
    majorLabel.text = [NSString stringWithFormat:@"%@", beaconRegion.major];
    minorLabel.text = [NSString stringWithFormat:@"%@", beaconRegion.minor];
    identityLabel.text = beaconRegion.identifier;
}


-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"Powered On");
        [peripheralManager startAdvertising:beaconPeripheralData];
    } else if (peripheral.state == CBPeripheralManagerStatePoweredOff) {
        NSLog(@"Powered Off");
        [peripheralManager stopAdvertising];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
