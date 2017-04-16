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
    // Do any additional setup after loading the view.
    myVar = [global sharedSingleton];
    vari.text = myVar.var1s;//singleton 1
   // myVar.var1s=@"Hey Var";//singleton 1 changed
   // var3=@"Hello, Var";//global variable
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)click:(id)sender {
    vari.text = myVar.var1s;//singleton 2
    globalVar.text=var3;//global variable
}
@end
