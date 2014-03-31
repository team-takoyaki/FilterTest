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

// Tone curve
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput0XSlider;
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput0YSlider;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput0XLabel;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput0YLabel;
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput1XSlider;
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput1YSlider;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput1XLabel;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput1YLabel;
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput2XSlider;
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput2YSlider;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput2XLabel;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput2YLabel;
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput3XSlider;
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput3YSlider;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput3XLabel;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput3YLabel;
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput4XSlider;
@property (strong, nonatomic) IBOutlet UISlider *toneCurveInput4YSlider;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput4XLabel;
@property (strong, nonatomic) IBOutlet UILabel *toneCurveInput4YLabel;
- (IBAction)toneCurveChangedCheck:(id)sender;
- (IBAction)toneCurveInput0XChangedValue:(id)sender;
- (IBAction)toneCurveInput0YChangedValue:(id)sender;
- (IBAction)toneCurveInput1XChangedValue:(id)sender;
- (IBAction)toneCurveInput1YChangedValue:(id)sender;
- (IBAction)toneCurveInput2XChangedValue:(id)sender;
- (IBAction)toneCurveInput2YChangedValue:(id)sender;
- (IBAction)toneCurveInput3XChangedValue:(id)sender;
- (IBAction)toneCurveInput3YChangedValue:(id)sender;
- (IBAction)toneCurveInput4XChangedValue:(id)sender;
- (IBAction)toneCurveInput4YChangedValue:(id)sender;


// ScrollView関連
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
