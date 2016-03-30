//
//  NumberToStore.m
//  TestCoreData
//
//  Created by YASH on 30/03/16.
//  Copyright © 2016 YASH. All rights reserved.
//

#import "NumberToStore.h"

@implementation NumberToStore

// Insert code here to add functionality to your managed object subclass

+ (NumberToStore *) generateRandomNumberAndStoreInManagedObjectContext : (NSManagedObjectContext *) context
{
    NumberToStore *number = [NSEntityDescription insertNewObjectForEntityForName:@"NumberToStore" inManagedObjectContext:context];
    number.value = [NSNumber numberWithInt:(arc4random_uniform(1000) + 1)];
    return number;
}

@end
