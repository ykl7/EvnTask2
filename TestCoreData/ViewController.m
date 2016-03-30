//
//  ViewController.m
//  TestCoreData
//
//  Created by YASH on 30/03/16.
//  Copyright © 2016 YASH. All rights reserved.
//

#import "ViewController.h"
#import "NumberToStore.h"

@interface ViewController ()
{
    NSFetchRequest *request;
    NSManagedObjectContext *context;
    BOOL isCounting;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.loader.hidden = true;
    
    AppDelegate *apd = [[UIApplication sharedApplication] delegate];
    
    context = apd.managedObjectContext;
    request = [NSFetchRequest fetchRequestWithEntityName:@"NumberToStore"];
    
    [self displayCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)generateAndSave
{
    self.loader.hidden = false;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSPersistentStoreCoordinator *storeCoord = context.persistentStoreCoordinator;
        NSManagedObjectContext *asyncContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        
        asyncContext.persistentStoreCoordinator = storeCoord;
        
        for (int i=0; i<10000; i++)
        {
            [NumberToStore generateRandomNumberAndStoreInManagedObjectContext:asyncContext];
        }
        
        @try {
            NSError *error;
            [asyncContext save:&error];
        }
        @catch (NSException *exception) {
            NSLog(@"Error");
        }
        @finally {
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.loader.hidden = true;
        });
        
    });
}

- (IBAction)displayCount
{
    self.countLabel.text = @"Reloading. Please Wait.";
    if (isCounting)
    {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        isCounting = true;
        
        @try {
            NSError *erro;
            NSArray *array = [context executeFetchRequest:request error:&erro];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.countLabel setText:[NSString stringWithFormat:@"Present Count : %li", (long) array.count]];
            });
            
        }
        @catch (NSException *exception) {
            NSLog(@"Error");
        }
        @finally {
            
        }
        isCounting = false;
    });

}

@end
