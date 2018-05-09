//
//  ViewController.m
//  EnumTest
//
//  Created by mac on 2018/4/18.
//  Copyright © 2018年 Sion Information Technology Co., Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 第一种: 普通枚举
enum Season{
    Spring = 0,
    Summer = 1,
    Autumn = 2,
    Winter = 3
};


// 第二种: 别名枚举
typedef enum{
    
    MAN,
    WOMAN
    
} Sex;

// 第三种 typedf NS_ENUM 定义类型
typedef NS_ENUM(NSInteger,ZYType)
{
    ZYTypeTop,
    ZYTypeRight,
    ZYTypeBottom,
    ZYTypeLeft
};

// 第四种 位移枚举
// 一个参数可以传递多个值
// 注意: 当遇到位移枚举时,观察第一个枚举值,如果 !=0, 直接传0做参数即可,性能最高
typedef NS_OPTIONS(NSUInteger, GG) {
    AAA                 = 1 << 0,
    BBB   = 1 << 1,
    CCC        = 1 << 2,
    DDD  = 1 << 3,
    EEE    = 1 << 4,
    FFF       = 1 << 5,
    GGG = 1 << 6
};

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;

    
    [self printDirection:ZYTypeTop];
    
    [self show:1];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)printDirection:(ZYType)direction
{
//    NSLog(@"%zd",direction);
//    NSLog(@"%ld",direction);
    switch (direction) {
        case ZYTypeTop:
            printf("上! \n");
            break;
        case ZYTypeRight:
            printf("右! \n");
            break;
        case ZYTypeBottom:
            printf("下! \n");
            break;
        case ZYTypeLeft:
            printf("左! \n");
            break;
            
        default:
            break;
    }
}

- (void)show:(GG)test{
    
    NSLog(@"%ld",test);
    
    if (test == 3) {
        NSLog(@"有 AAA BBB CCC");
    }
 
    switch (test) {
        case AAA:
            NSLog(@"%ld",AAA);
            break;
            
        default:
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
