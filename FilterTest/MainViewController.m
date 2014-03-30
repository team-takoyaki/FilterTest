//
//  SepiaViewController.m
//  FilterTest
//
//  Created by Kashima Takumi on 2014/03/26.
//  Copyright (c) 2014年 TEAM TAKOYAKI. All rights reserved.
//

#import "MainViewController.h"
#import "TTKEditImage.h"

@interface MainViewController ()
@property (nonatomic, strong) UIImage *originalImage;
@property (nonatomic, assign) BOOL isSepiaEnabled;
@property (nonatomic, assign) BOOL isGrayScaleEnabled;
@property (nonatomic, assign) BOOL isColorControlEnabled;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // Storyboardから削除してScrollViewにつける
    [_contentView removeFromSuperview];
    [_scrollView addSubview:_contentView];
    
    // scrollContentViewのサイズとScrollViewのContentSizeのサイズを紐づける
    CGSize contentViewSize = _contentView.frame.size;
    _contentView.frame = CGRectMake(0, 0, contentViewSize.width,contentViewSize.height);
    _scrollView.contentSize = contentViewSize;

    self.originalImage = _imageView.image;
    NSAssert(_originalImage != nil, @"画像の取得に失敗しました");
    
    // フラグの初期化
    self.isSepiaEnabled = NO;
    self.isGrayScaleEnabled = NO;
    self.isColorControlEnabled = NO;
    
    [self filterImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)sepiaChangedCheck:(id)sender
{
    UISwitch *_switch = (UISwitch *)sender;
    self.isSepiaEnabled = _switch.on;
    
    [self filterImage];
}

- (IBAction)sepiaChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)grayScaleChangedCheck:(id)sender
{
    UISwitch *_switch = (UISwitch *)sender;
    self.isGrayScaleEnabled = _switch.on;
    
    [self filterImage];
}

- (IBAction)grayScaleChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)grayScaleColorChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)colorControlChangedCheck:(id)sender
{
    UISwitch *_switch = (UISwitch *)sender;
    self.isColorControlEnabled = _switch.on;
    
    [self filterImage];
}

- (IBAction)colorControlSaturationChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)colorControlBrightnessChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)colorControlContrastChangedValue:(id)sender
{
    [self filterImage];
}

- (void)filterImage
{
    UIImage *filteredImage = [_originalImage copy];

    // Sepia
    CGFloat sepiaValue = _sepiaSlider.value;
    _sepiaSliderLabel.text = [NSString stringWithFormat:@"%f", sepiaValue];
    if (_isSepiaEnabled) {
        filteredImage = [TTKEditImage imageFilterSepia:filteredImage withIntensity:sepiaValue];
    }
    
    // Gray scale
    CGFloat grayScaleValue = _grayScaleSlider.value;
    _grayScaleSliderLabel.text = [NSString stringWithFormat:@"%f", grayScaleValue];
    CGFloat grayScaleColorValue = _grayScaleColorSlider.value;
    _grayScaleColorSliderLabel.text = [NSString stringWithFormat:@"%f", grayScaleColorValue];
    if (_isGrayScaleEnabled) {
        filteredImage = [TTKEditImage imageFilterGrayScale:filteredImage withIntensity:grayScaleValue singleColorRate:grayScaleColorValue];
    }
    
    // Color control
    CGFloat colorControlSaturationValue = _colorControlSaturationSlider.value;
    _colorControlSaturationLabel.text = [NSString stringWithFormat:@"%f", colorControlSaturationValue];
    CGFloat colorControlBrightnessValue = _colorControlBrightnessSlider.value;
    _colorControlBrightnessLabel.text = [NSString stringWithFormat:@"%f", colorControlBrightnessValue];
    CGFloat colorControlContrastValue = _colorControlContrastSlider.value;
    _colorControlContrastLabel.text = [NSString stringWithFormat:@"%f", colorControlContrastValue];
    if (_isColorControlEnabled) {
        filteredImage = [TTKEditImage imageFilterColorAdjustment:filteredImage withSaturation:colorControlSaturationValue brightness:colorControlBrightnessValue contrast:colorControlContrastValue];
    }
    
    self.imageView.image = filteredImage;
}
@end
