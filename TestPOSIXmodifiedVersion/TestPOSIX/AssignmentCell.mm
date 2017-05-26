//
//  AssignmentCell.m
//  TestPOSIX
//
//  Created by Xinru Chen on 5/24/17.
//  Copyright © 2017 Xinru Chen. All rights reserved.
//

#import "AssignmentCell.h"

@interface AssignmentCell ()

@property (strong, nonatomic) IBOutlet UITextView *lectureTextView;
@property (strong, nonatomic) IBOutlet UITextView *timeTextView;

@end

@implementation AssignmentCell

- (void) setAss:(AssignmentObjc *)ass {
    _ass = ass;
    self.lectureTextView.text = [@"Assignment: " stringByAppendingString:ass.lecture];
    self.timeTextView.text = [@"Time: " stringByAppendingString:ass.time];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
