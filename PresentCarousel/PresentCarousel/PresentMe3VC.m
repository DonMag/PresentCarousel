//
//  PresentMe3VC.m
//  PresentCarousel
//
//  Created by Don Mag on 5/23/24.
//

#import "PresentMe3VC.h"
#import "PresentNextDelegate.h"

@interface PresentMe3VC ()

@end

@implementation PresentMe3VC

- (void)viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:1.0 alpha:1.0];
	
	UIAction *tapAction = [UIAction actionWithHandler:^(UIAction* action) {
		if (self->presentNextDelegate) {
			[self->presentNextDelegate presentNextVC];
		}
	}];
	
	UIButtonConfiguration *cfg = [UIButtonConfiguration filledButtonConfiguration];
	cfg.title = @"Present VC 1";
	
	UIButton *myButton = [UIButton buttonWithConfiguration:cfg primaryAction:tapAction];
	
	UILabel *myLabel = [UILabel new];
	myLabel.font = [UIFont systemFontOfSize:60.0 weight:UIFontWeightBold];
	myLabel.text = @"VC 3";
	
	myLabel.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:myLabel];
	myButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:myButton];
	
	UILayoutGuide *g = [self.view safeAreaLayoutGuide];
	
	[NSLayoutConstraint activateConstraints:@[
		[myLabel.topAnchor constraintEqualToAnchor:g.topAnchor constant:120.0],
		[myLabel.centerXAnchor constraintEqualToAnchor:g.centerXAnchor],
		[myButton.centerXAnchor constraintEqualToAnchor:g.centerXAnchor],
		[myButton.centerYAnchor constraintEqualToAnchor:g.centerYAnchor],
	]];
	
}

- (void)setDelegate:(id)d {
	presentNextDelegate = d;
}

@end
