//
//  SepiaViewController.h
//  FilterTest
//
//  Created by Kashima Takumi on 2014/03/26.
//  Copyright (c) 2014年 TEAM TAKOYAKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UISlider *sepiaSlider;
@property (strong, nonatomic) IBOutlet UISlider *grayScaleSlider;
@property (strong, nonatomic) IBOutlet UILabel *sepiaSliderLabel;
@property (strong, nonatomic) IBOutlet UILabel *grayScaleSliderLabel;
- (IBAction)sepiaChangedCheck:(id)sender;
- (IBAction)sepiaChangedValue:(id)sender;
- (IBAction)grayScaleChangedCheck:(id)sender;
- (IBAction)grayScaleChangedValue:(id)sender;
@end
