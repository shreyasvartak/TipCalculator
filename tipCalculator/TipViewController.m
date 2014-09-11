//
//  TipViewController.m
//  tipCalculator
//
//  Created by Shreyas Vartak on 9/7/14.
//  Copyright (c) 2014 Shreyas Vartak. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;

- (void)updateValues;

- (void)onSettingsButton;

- (void)updateDefaultTip;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calclulator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //settings button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    [self updateDefaultTip];
    [self updateValues];
}

- (void) updateDefaultTip
{
    //load default tip
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipSelected = [defaults integerForKey:@"tipPref"];
    NSLog(@"selected tip in TipViewController: %d", tipSelected);
    
    //update segmentViewController
    self.tipControl.selectedSegmentIndex = tipSelected;

}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    [self updateDefaultTip];
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = billAmount + tipAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
    
}

-(void)onSettingsButton {
        [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

@end
