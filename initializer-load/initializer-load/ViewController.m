//
//  ViewController.m
//  initializer-load
//
//  Created by apple on 2018/2/1.
//  Copyright © 2018年 yangchao. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "animals.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[Person alloc]init];
    [[animals alloc]init];
}



@end
