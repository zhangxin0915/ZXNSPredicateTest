//
//  ViewController.m
//  ZXNSPredicateTest
//
//  Created by macmini on 16/4/13.
//  Copyright © 2016年 macmini. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //NSPredicate中主要的几种运算方式
//    1.比较运算符 > 、< 、== 、 >= 、<= 、 !=
//    例：@"number >= 99"
    
//    2.逻辑运算符：AND、OR、NOT 这几个运算符计算并、或、非的结果。
    
//    3.范围运算符：IN 、BETWEEN
//    例：@"number BETWEEN {1,5}"
//    @"address IN {'shanghai','nanjing'}"
//    
//    4.字符串本身:SELF
//    例：@"SELF == 'APPLE'"
//    
//    5.字符串相关：BEGINSWITH、ENDSWITH、CONTAINS
//    例： @"name CONTAIN[cd] 'ang'" //包含某个字符串
//    @"name BEGINSWITH[c] 'sh'" //以某个字符串开头
//    @"name ENDSWITH[d] 'ang'" //以某个字符串结束
//    注:[c]不区分大小写 , [d]不区分发音符号即没有重音符号 , [cd]既不区分大小写，也不区分发音符号。
//    
//    6.通配符：LIKE
//    例：@"name LIKE[cd] '*er*'" //*代表通配符,Like也接受[cd].
//    @"name LIKE[cd] '???er*'"
//    
//    7.正则表达式：MATCHES
//    例：NSString *regex = @"^A.+e$"; //以A开头，e结尾
//    @"name MATCHES %@",regex
    
    NSArray *persons = [NSArray arrayWithObjects:
                        [Person personWithName:@"mac" andAge:20],
                        [Person personWithName:@"1" andAge:30],
                        [Person personWithName:@"2" andAge:40],
                        [Person personWithName:@"3" andAge:50],
                        [Person personWithName:@"4" andAge:60],
                        [Person personWithName:@"5" andAge:70],
                        [Person personWithName:@"6" andAge:20],
                        [Person personWithName:@"7" andAge:40],
                        [Person personWithName:@"8" andAge:60],
                        [Person personWithName:@"9" andAge:40],
                        [Person personWithName:@"0" andAge:80],
                        [Person personWithName:@"10" andAge:90],
                        [Person personWithName:@"1" andAge:20], nil];
    NSPredicate *predicate;
    //     1.比较运算符
    //年龄小于30  条件
    predicate = [NSPredicate predicateWithFormat:@"age<%d",30];
    NSArray *ageArrs = [persons filteredArrayUsingPredicate:predicate];
    NSLog(@"ageArrs == %@",ageArrs);
    
    //    2.逻辑运算符
    predicate = [NSPredicate predicateWithFormat:@"age<%d && name = %@",30,@"mac"];
    NSArray *nameAndAgeArrs = [persons filteredArrayUsingPredicate:predicate];
    NSLog(@"nameAndAgeArrs == %@",nameAndAgeArrs);
    predicate = [NSPredicate predicateWithFormat:@"age>%d AND name = %@",80,@"10"];
    NSArray *nameAndAgeArrs2 = [persons filteredArrayUsingPredicate:predicate];
    NSLog(@"nameAndAgeArrs2 == %@",nameAndAgeArrs2);
    
//    3.范围运算符：
    predicate = [NSPredicate predicateWithFormat:@"self.name IN {'1','2','4'} || self.age IN{30,40}"];
    NSArray *temp = [persons filteredArrayUsingPredicate:predicate];
    NSLog(@"temp == %@",temp);
//    4.字符串本身:SELF
    
    NSArray* array = @[@"aa",@"bb"];
    NSArray* array2 = @[@"aa",@"bb",@"cc",@"dd"];
    NSPredicate* thePredicate = [NSPredicate predicateWithFormat:@"NOT(SELF in %@)",array];
    NSArray* arr3 = [array2 filteredArrayUsingPredicate:thePredicate];
    NSLog(@"%@",arr3);
    
//    5.字符串相关：BEGINSWITH、ENDSWITH、CONTAINS
    //name以a开头的
    predicate = [NSPredicate predicateWithFormat:@"name BEGINSWITH 'm'"];
    NSArray *temp1 = [persons filteredArrayUsingPredicate:predicate];
    NSLog(@"temp == %@",temp1);
    //name以ba结尾的
    predicate = [NSPredicate predicateWithFormat:@"name ENDSWITH 'c'"];
    NSArray *temp2 = [persons filteredArrayUsingPredicate:predicate];
    NSLog(@"temp == %@",temp2);
        //name中包含字符a的
    predicate = [NSPredicate predicateWithFormat:@"name CONTAINS 'a'"];
    NSArray *temp3 = [persons filteredArrayUsingPredicate:predicate];
    NSLog(@"temp == %@",temp3);
    
//     6.通配符：LIKE
    //like 匹配任意多个字符
    //name中只要有s字符就满足条件
    predicate = [NSPredicate predicateWithFormat:@"name like '*s*'"];
    //?代表一个字符，下面的查询条件是：name中第二个字符是s的
    predicate = [NSPredicate predicateWithFormat:@"name like '?s'"];
    
//    7.正则表达式：MATCHES
    NSString *regex = @"^A.+e$";//以A 开头，以e 结尾的字符。
    NSPredicate *pre= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if([pre evaluateWithObject: @"Apple"]){
        printf("YES\n");
    }else{
        printf("NO\n");
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
