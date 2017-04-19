//
//  ViewController.h
//  MyData
//
//  Created by Matt Memmo on 3/29/14.
//  Copyright (c) 2014 RWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController 



@property (weak, nonatomic) IBOutlet UITextField *user;


@property (weak, nonatomic) IBOutlet UITextField *email;


- (IBAction)view:(id)sender;

- (IBAction)deleteName:(id)sender;


- (IBAction)addName:(id)sender;

- (IBAction)update:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *listNames;


@property (weak, nonatomic) IBOutlet UILabel *globVar; 



@property (weak, nonatomic) IBOutlet UITextField *ider;















@end
