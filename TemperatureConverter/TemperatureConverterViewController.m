//
//  ViewController.m
//  TemperatureConverter
//
//  Created by Venkadeshkumar Dhandapani on 1/17/14.
//  Copyright (c) 2014 Venkadeshkumar Dhandapani. All rights reserved.
//

#import "TemperatureConverterViewController.h"

@interface TemperatureConverterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextInput;
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextInput;

@property (nonatomic) BOOL isFahrenhiet;
- (IBAction)convertButton:(id)sender;
- (void)convert;

@end

@implementation TemperatureConverterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.fahrenheitTextInput.delegate = self;
    self.celsiusTextInput.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertButton:(id)sender {
    [self.view endEditing:YES];
    if(!([self.celsiusTextInput.text isEqualToString: @""] && [self.fahrenheitTextInput.text isEqualToString: @""])){
        [self convert];
    }
    
}

# pragma mark - Private Methods

-(void) convert{
    if((![self.fahrenheitTextInput.text isEqualToString: @""] && self.isFahrenhiet) || (![self.fahrenheitTextInput.text isEqualToString: @""] && [self.celsiusTextInput.text isEqualToString: @""] )){
        self.celsiusTextInput.text = [NSString stringWithFormat:@"%0.2f", ([self.fahrenheitTextInput.text floatValue] - 32)*5.0/9.0];
    }else{
        self.fahrenheitTextInput.text = [NSString stringWithFormat:@"%0.2f", ([self.celsiusTextInput.text floatValue] *9.0/5.0)+32];
    }
}

# pragma mark - UITextField Delegate

-(void) textFieldDidEndEditing:(UITextField *)textField{
    if(textField == self.fahrenheitTextInput){
        self.isFahrenhiet = YES;
    }else{
        self.isFahrenhiet = NO;
    }
}

@end
