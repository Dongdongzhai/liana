//
//  ViewController.m
//  01-了解-耗时操作
//
//  Created by xiaomage on 16/11/18.
//  Copyright © 2016年 xiaomage. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    //01 获得主线程
    NSThread  *mainThread = [NSThread mainThread];
    NSLog(@"%@",mainThread);
    
    //02 获得当前线程(执行当前任务的线程)
    NSThread *currentThread = [NSThread currentThread];
    NSLog(@"%@",currentThread);
    
    //常识:通常情况,几乎所有的任务(方法)都在主线程中执行,除非人为创建
    //03 判断线程是否是主线程
    //03.1 打印看number == 1 主线程,否则就是子线程
    //03.2 通过类方法判断
    NSLog(@"%zd",[NSThread isMainThread]);  //判断当前线程是否是主线程
    //03.3 通过对象方法判断
    NSLog(@"%zd",[currentThread isMainThread]); //判断给定的线程对象是否是主线程
    
    //主线程的注意点:
    //01 耗时操作不能放在主线程中执行,应该开子线程执行
    //02 UI相关的操作都必须在主线程中执行
    
}

- (IBAction)btnClick:(id)sender {

    //当前方法在哪个线程执行
//    NSLog(@"%@",[NSThread currentThread]);
    
    //执行耗时操作
    for (int i = 0; i < 1000000; ++i) {
        NSLog(@"%zd---%@",i,[NSThread currentThread]);
    }
    
    //结论:耗时操作不能放在主线程中执行,应该开子线程执行
}

@end
