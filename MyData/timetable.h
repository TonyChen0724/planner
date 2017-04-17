//
//  timetable.h
//  MyData
//
//  Created by Xinru Chen on 4/17/17.
//  Copyright © 2017 RWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface timetable : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *ider;
@property (weak, nonatomic) IBOutlet UILabel *listNames;
@property (weak, nonatomic) IBOutlet UILabel *globVar; // where is this label? maybe

- (IBAction)view:(id)sender;
- (IBAction)deleteName:(id)sender;
@end
