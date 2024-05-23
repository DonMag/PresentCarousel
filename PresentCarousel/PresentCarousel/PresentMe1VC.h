//
//  PresentMe1VC.h
//  PresentCarousel
//
//  Created by Don Mag on 5/23/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PresentMe1VC : UIViewController
{
	__weak id presentNextDelegate;
}
- (void)setDelegate:(id)d;
@end

NS_ASSUME_NONNULL_END
