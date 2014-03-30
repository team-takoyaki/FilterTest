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

// GrayScale
@property (strong, nonatomic) IBOutlet UISlider *grayScaleSlider;
@property (strong, nonatomic) IBOutlet UILabel *grayScaleSliderLabel;
- (IBAction)grayScaleChangedCheck:(id)sender;
- (IBAction)grayScaleChangedValue:(id)sender;
@property (strong, nonatomic) IBOutlet UISlider *grayScaleColorSlider;
@property (strong, nonatomic) IBOutlet UILabel *grayScaleColorSliderLabel;
- (IBAction)grayScaleColorChangedValue:(id)sender;

// ScrollView関連
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
