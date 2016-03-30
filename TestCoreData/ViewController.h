//
//  ViewController.h
//  TestCoreData
//
//  Created by YASH on 30/03/16.
//  Copyright © 2016 YASH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *countLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loader;

@end

