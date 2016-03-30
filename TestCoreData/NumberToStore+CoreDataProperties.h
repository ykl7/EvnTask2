//
//  NumberToStore+CoreDataProperties.h
//  TestCoreData
//
//  Created by YASH on 30/03/16.
//  Copyright © 2016 YASH. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "NumberToStore.h"

NS_ASSUME_NONNULL_BEGIN

@interface NumberToStore (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *value;

@end

NS_ASSUME_NONNULL_END
