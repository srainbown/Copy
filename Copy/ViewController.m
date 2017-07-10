//
//  ViewController.m
//  Copy
//
//  Created by 紫川秀 on 2017/7/10.
//  Copyright © 2017年 View. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    NSString , NSMutableString 的 copy 和 mutableCopy
//    [self strMutableCopy_One];
//    [self strMutableCopy_Two];
//    [self strCopy_Three];
//    [self strCopy_Four];
    
//    NSArray , NSMutableArray 的 特殊地方
    [self arrayCopy_Two];
    
}

#pragma mark -- NSString , NSMutableString 的 copy 和 mutableCopy
-(void)strMutableCopy_One{

    NSString *str = @"233~~";
    NSMutableString *copyStr = [str mutableCopy];
    NSLog(@"str = %@,str = %p",str,str);
    NSLog(@"copyStr = %@,copyStr = %p",copyStr,copyStr);
    //此处可知copy了内容，并没有copy地址，生成了一个新的对象
}

-(void)strMutableCopy_Two{

    NSMutableString *str = [NSMutableString stringWithFormat:@"233~~"];
    NSMutableString *copyStr = [str mutableCopy];
    
    NSLog(@"str = %@,str = %p",str,str);
    NSLog(@"copyStr = %@,copyStr = %p",copyStr,copyStr);
    //从此处可知copy了内容，并没有copy地址，生成了一个新的对象
}

-(void)strCopy_Three{

    NSMutableString *str = [NSMutableString stringWithFormat:@"233~~"];
    NSString *copyStr = [str copy];
    NSLog(@"str = %@,str = %p",str,str);
    NSLog(@"copyStr = %@,copyStr = %p",copyStr,copyStr);
    //从此处可知copy了内容，并没有copy地址，生成了一个新的对象
}

-(void)strCopy_Four{

    NSString *str = @"233~~";
    NSString *copyStr = [str copy];
    NSLog(@"str = %@,str = %p",str,str);
    NSLog(@"copyStr = %@,copyStr = %p",copyStr,copyStr);
    //从此处可知，不仅copy了内容，并且copy了地址
    /*
     这是为什么？
     1.通过不可变对象调用了copy方法，那么不会生成一个新的对象。
     2.因为原来的对象是不能修改的，拷贝出来的对象也是不能修改的，既然两个都不能修改，所以永远不能影响到另一个对象，已经符合拷贝的目的。所以，OC为了对内存进行优化，就不会生成一个新的对象。
     */
}

#pragma mark -- NSArray , NSMutableArray 的 特殊地方
/*
 首先，容器对象和非容器对象一样遵从下面的总结:
    如果对一不可变对象复制，copy是指指针复制(浅拷贝),mutableCopy就是对象复制(深拷贝)。
    如果是对可变对象复制，都是深拷贝，但是copy返回的对象是不可变的。
 
 但是，对于容器对象有两点特殊的地方
*/

-(void)arrayCopy_Two{
    
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c", nil];
    NSArray *copyArray_One = [array copy];
    NSArray *copyArray_Two = [array copy];
    NSMutableArray *copyArray_Three = [array mutableCopy];
    NSLog(@"array = %@, array = %p",array,array);
    NSLog(@"copyArray_One = %@, copyArray_One = %p",copyArray_One,copyArray_One);
    NSLog(@"copyArray_Two = %@, copyArray_Two = %p",copyArray_Two,copyArray_Two);
    NSLog(@"copyArray_Three = %@, copyArray_Three = %p",copyArray_Three,copyArray_Three);
    //原文有很多错误的内容。我在这里并没有发现什么特殊之处，3个都拷贝了内容，前2个拷贝了地址，第3个新创建了对象，完全遵照了非容器对象的法则
}






@end
