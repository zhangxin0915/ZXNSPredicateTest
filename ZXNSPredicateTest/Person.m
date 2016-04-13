//
//  Person.m
//  ZXNSPredicateTest
//
//  Created by macmini on 16/4/13.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "Person.h"

@implementation Person
+ (id)personWithName:(NSString *)theName andAge:(NSInteger)theAge
{
    Person *person = [[Person alloc]init];
    person.name = theName;
    person.age = theAge;
    return person;
}
@end
