//
//  Person.h
//  ZXNSPredicateTest
//
//  Created by macmini on 16/4/13.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger age;

+ (id)personWithName:(NSString *)theName andAge:(NSInteger)theAge;

@end
