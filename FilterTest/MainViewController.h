//
//  SepiaViewController.h
//  FilterTest
//
//  Created by Kashima Takumi on 2014/03/26.
//  Copyright (c) 2014年 TEAM TAKOYAKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIScrollViewDelegate>
// 表示されている画像
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

// Sepia
@property (strong, nonatomic) IBOutlet UISlider *sepiaSlider;
@property (strong, nonatomic) IBOutlet UILabel *sepiaSliderLabel;
- (IBAction)sepiaChangedCheck:(id)sender;
- (IBAction)sepiaChangedValue:(id)sender;

// Gray scale
@property (strong, nonatomic) IBOutlet UISlider *grayScaleSlider;
@property (strong, nonatomic) IBOutlet UILabel *grayScaleSliderLabel;
- (IBAction)grayScaleChangedCheck:(id)sender;
- (IBAction)grayScaleChangedValue:(id)sender;
@property (strong, nonatomic) IBOutlet UISlider *grayScaleColorSlider;
@property (strong, nonatomic) IBOutlet UILabel *grayScaleColorSliderLabel;
- (IBAction)grayScaleColorChangedValue:(id)sender;

// Color control
@property (strong, nonatomic) IBOutlet UISlider *colorControlSaturationSlider;
@property (strong, nonatomic) IBOutlet UILabel *colorControlSaturationLabel;
@property (strong, nonatomic) IBOutlet UISlider *colorControlBrightnessSlider;
@property (strong, nonatomic) IBOutlet UILabel *colorControlBrightnessLabel;
@property (strong, nonatomic) IBOutlet UISlider *colorControlContrastSlider;
@property (strong, nonatomic) IBOutlet UILabel *colorControlContrastLabel;
- (IBAction)colorControlChangedCheck:(id)sender;
- (IBAction)colorControlSaturationChangedValue:(id)sender;
- (IBAction)colorControlBrightnessChangedValue:(id)sender;
- (IBAction)colorControlContrastChangedValue:(id)sender;

// ScrollView関連
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
