//
//  ConfigViewController.h
//  BVD
//
//  Created by Anthony Tuil on 26/02/2014.
//  Copyright (c) 2014 Anthony Tuil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>


@interface ConfigViewController : UIViewController <CBPeripheralManagerDelegate>{
    CLBeaconRegion *beaconRegion;
    NSDictionary *beaconPeripheralData;
    CBPeripheralManager *peripheralManager;
    UIButton *transmit;
    UILabel *majorLabel;
    UILabel *minorLabel;
    UILabel *uuidLabel;
    UILabel *identityLabel;
}

@end
