//
//  CarouselViewController.m
//  PresentCarousel
//
//  Created by Don Mag on 5/23/24.
//

#import "CarouselViewController.h"
#import "PresentMe1VC.h"
#import "PresentMe2VC.h"
#import "PresentMe3VC.h"

#import "PresentNextDelegate.h"

@interface CarouselViewController () <PresentNextDelegate>
{
	NSMutableArray <UIViewController *>*theViewControllers;
	NSMutableArray <NSLayoutConstraint *>*topConstraints;
	NSInteger idx;
}
@end

@implementation CarouselViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.view.backgroundColor = UIColor.systemBackgroundColor;
	
	theViewControllers = [NSMutableArray new];
	topConstraints = [NSMutableArray new];
	
	// instantiate the view controllers
	PresentMe1VC *vc1 = [PresentMe1VC new];
	PresentMe2VC *vc2 = [PresentMe2VC new];
	PresentMe3VC *vc3 = [PresentMe3VC new];
	
	// their buttons will "call back" here to show the next one
	[vc1 setDelegate:self];
	[vc2 setDelegate:self];
	[vc3 setDelegate:self];
	
	for (UIViewController *vc in @[vc1, vc2, vc3]) {
		[theViewControllers addObject:vc];
		vc.view.translatesAutoresizingMaskIntoConstraints = NO;
		[self.view addSubview:vc.view];
		[self.view sendSubviewToBack:vc.view];
		[vc didMoveToParentViewController:self];
		NSLayoutConstraint *c;
		c = [vc.view.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:0.0];
		[topConstraints addObject:c];
		[NSLayoutConstraint activateConstraints:@[
			c,
			[vc.view.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:0.0],
			[vc.view.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:0.0],
			[vc.view.heightAnchor constraintEqualToAnchor:self.view.heightAnchor constant:0.0],
		]];
	}
	
	idx = 0;
}

- (void)presentNextVC {
	
	// increment the index
	idx += 1;

	NSInteger n = idx % theViewControllers.count;

	// position the next view's Top at the Bottom
	topConstraints[n].constant = self.view.frame.size.height;

	// bring the next view to the front
	[self.view bringSubviewToFront:theViewControllers[n].view];
	
	// force layout update
	[self.view setNeedsLayout];
	[self.view layoutIfNeeded];

	// animate it up (simulating a new present)
	topConstraints[n].constant = 0.0;
	[UIView animateWithDuration:0.3 animations:^{
		[self.view layoutIfNeeded];
	}];
	
}

@end
