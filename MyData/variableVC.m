//
//  variableVC.m
//  MyData
//
//  Created by Matt Memmo on 5/13/14.
//  Copyright (c) 2014 RWS. All rights reserved.
//

#import "variableVC.h"
#import "global.h"


@interface variableVC ()

@end
global * myVar;

@implementation variableVC

@synthesize vari;
@synthesize globalVar;


- (void)viewDidLoad
{
    [super viewDidLoad];
    myVar = [global sharedSingleton];
    vari.text = myVar.var1s;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}




- (IBAction)click:(id)sender {
    vari.text = myVar.var1s;
    globalVar.text=var3;
}
@end
