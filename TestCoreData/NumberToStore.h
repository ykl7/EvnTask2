//
//  NumberToStore.h
//  TestCoreData
//
//  Created by YASH on 30/03/16.
//  Copyright © 2016 YASH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface NumberToStore : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

+ (NumberToStore *) generateRandomNumberAndStoreInManagedObjectContext : (NSManagedObjectContext *) context;

@end

NS_ASSUME_NONNULL_END

#import "NumberToStore+CoreDataProperties.h"
