//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Shreyas Vartak on 9/7/14.
//  Copyright (c) 2014 Shreyas Vartak. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *deffaultTipControl;

- (IBAction)onTipSelected:(id)sender;

- (void)loadDefaultTip;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    [self.deffaultTipControl addTarget:self
//                                action:@selector(onTipSelected)
//                      forControlEvents:UIControlEventValueChanged];
    [self loadDefaultTip];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadDefaultTip
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipSelected = [defaults integerForKey:@"tipPref"];
    NSLog(@"selected tip in SettingsViewController: %d", tipSelected);
    self.deffaultTipControl.selectedSegmentIndex = tipSelected;

}

- (IBAction)onTipSelected:(id)sender {
    //[self.view endEditing:YES];
    int defaultTipIndex = self.deffaultTipControl.selectedSegmentIndex;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:defaultTipIndex forKey:@"tipPref"];
    [defaults synchronize];
}
@end
