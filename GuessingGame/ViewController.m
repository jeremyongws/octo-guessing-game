//
//  ViewController.m
//  GuessingGame
//
//  Created by Jeremy Ong on 30/03/2016.
//  Copyright © 2016 Jeremy Ong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *appLabel;
@property (weak, nonatomic) IBOutlet UITextField *appTextField;
@property NSUInteger randomNumber;
@property NSUInteger tries;
@property (weak, nonatomic) IBOutlet UILabel *triesLabel;
@property NSString *previousGuess;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.tries = 0;
	self.randomNumber = arc4random_uniform(100);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)onGuessButtonPressed:(id)sender {
	NSInteger answerInt = [self.appTextField.text integerValue];
	if (![self.previousGuess isEqualToString:self.appTextField.text]){
		self.tries = self.tries + 1;
		self.triesLabel.text = [NSString stringWithFormat:@"Number of tries : %lu", (unsigned long)self.tries];
	}
	
	if (answerInt < self.randomNumber){
		self.appLabel.text = @"your guess is lower than the number";
	} else if (answerInt == self.randomNumber) {
		self.appLabel.text = @"your guess is equal to the number";
	} else {
		self.appLabel.text = @"your guess is higher than the number";
	}
	self.previousGuess = self.appTextField.text;
}

@end
