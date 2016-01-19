//
//  CreatureViewController.m
//  MCMS
//
//  Created by Andrew Palka on 1/19/16.
//  Copyright © 2016 Joseph Mouer. All rights reserved.
//

#import "CreatureViewController.h"
#import "ViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController () <UITextFieldDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;


@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.nameTextField setHidden:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if (self.nameTextField.text.length > 0) {
        NSString *changed = self.nameTextField.text;
        self.title = changed;
        
        ViewController *vc = [[ViewController alloc]init];
        NSString *old = [[vc.creatures objectAtIndex:self.creatureIndex]name];
        NSLog([NSString stringWithFormat:@"%li",(long)self.creatureIndex]);
        NSLog(old);
        old = changed;
        [self.nameTextField resignFirstResponder];
        return TRUE;
    }
    [self.nameTextField resignFirstResponder];
    return NO;
}


- (IBAction)onEditTapped:(UIBarButtonItem *)sender {
    if ([sender.title  isEqual: @"Edit"]) {
        [sender setTitle:@"Done"];
        [self.nameTextField setHidden:NO];
    }   else  {
        [self.nameTextField setHidden:YES];
        [sender setTitle:@"Edit"];}
}

@end
