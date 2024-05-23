//
//  ViewController.m
//  PresentCarousel
//
//  Created by Don Mag on 5/23/24.
//

#import "ViewController.h"
#import "CarouselViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = UIColor.systemBackgroundColor;
	
	UIAction *tapAction = [UIAction actionWithHandler:^(UIAction* action){
		CarouselViewController *vc = [CarouselViewController new];
		[self presentViewController:vc animated:YES completion:nil];
	}];
	
	UIButtonConfiguration *cfg = [UIButtonConfiguration filledButtonConfiguration];
	cfg.title = @"Present Carousel";
	
	UIButton *myButton = [UIButton buttonWithConfiguration:cfg primaryAction:tapAction];
	
	myButton.translatesAutoresizingMaskIntoConstraints = NO;
	[self.view addSubview:myButton];
	
	UILayoutGuide *g = [self.view safeAreaLayoutGuide];
	
	[NSLayoutConstraint activateConstraints:@[
		[myButton.centerXAnchor constraintEqualToAnchor:g.centerXAnchor],
		[myButton.centerYAnchor constraintEqualToAnchor:g.centerYAnchor],
	]];
	
}

@end
