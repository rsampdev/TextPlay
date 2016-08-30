//
//  ViewController.m
//  TextPlay
//
//  Created by Rodney Sampson on 8/29/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) IBOutlet UILabel * leftLabel;
@property (nonatomic, strong) IBOutlet UILabel * rightLabel;
@property (nonatomic, strong) NSString * newlabelTextFromTextField;

- (IBAction)updateLabel:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftLabel.adjustsFontSizeToFitWidth = true;
    self.rightLabel.adjustsFontSizeToFitWidth = true;
    self.newlabelTextFromTextField = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)updateLabel:(UIButton *)sender {
    UILabel * label = nil;
    
    if ([sender.currentTitle isEqualToString: @"Reset"]) {
        self.leftLabel.text = @"";
        self.rightLabel.text = @"";
        self.newlabelTextFromTextField = @"";
    } else {
        if ([sender.currentTitle isEqualToString:@"To left label"]) {
            label = self.leftLabel;
        } else if ([sender.currentTitle isEqualToString:@"To right label"]) {
            label = self.rightLabel;
        }
        
        [label setText:self.newlabelTextFromTextField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason {
    self.newlabelTextFromTextField = textField.text;
}

@end
