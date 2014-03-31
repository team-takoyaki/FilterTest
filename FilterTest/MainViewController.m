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
@property (nonatomic, assign) BOOL isToneCurveEnabled;
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
    self.isToneCurveEnabled = NO;
    
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

- (IBAction)toneCurveChangedCheck:(id)sender
{
    UISwitch *_switch = (UISwitch *)sender;
    self.isToneCurveEnabled = _switch.on;
    
    [self filterImage];
}

- (IBAction)toneCurveInput0XChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)toneCurveInput0YChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)toneCurveInput1XChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)toneCurveInput1YChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)toneCurveInput2XChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)toneCurveInput2YChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)toneCurveInput3XChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)toneCurveInput3YChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)toneCurveInput4XChangedValue:(id)sender
{
    [self filterImage];
}

- (IBAction)toneCurveInput4YChangedValue:(id)sender
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
    
    // Tone curve
    CGFloat toneCurveInput0XValue = _toneCurveInput0XSlider.value;
    _toneCurveInput0XLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput0XValue];
    CGFloat toneCurveInput0YValue = _toneCurveInput0YSlider.value;
    _toneCurveInput0YLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput0YValue];
    
    CGFloat toneCurveInput1XValue = _toneCurveInput1XSlider.value;
    _toneCurveInput1XLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput1XValue];
    CGFloat toneCurveInput1YValue = _toneCurveInput1YSlider.value;
    _toneCurveInput1YLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput1YValue];
    
    CGFloat toneCurveInput2XValue = _toneCurveInput2XSlider.value;
    _toneCurveInput2XLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput2XValue];
    CGFloat toneCurveInput2YValue = _toneCurveInput2YSlider.value;
    _toneCurveInput2YLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput2YValue];
    
    CGFloat toneCurveInput3XValue = _toneCurveInput3XSlider.value;
    _toneCurveInput3XLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput3XValue];
    CGFloat toneCurveInput3YValue = _toneCurveInput3YSlider.value;
    _toneCurveInput3YLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput3YValue];
    
    CGFloat toneCurveInput4XValue = _toneCurveInput4XSlider.value;
    _toneCurveInput4XLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput4XValue];
    CGFloat toneCurveInput4YValue = _toneCurveInput4YSlider.value;
    _toneCurveInput4YLabel.text = [NSString stringWithFormat:@"%f", toneCurveInput4YValue];
    
    if (_isToneCurveEnabled) {
        // Tone curveのための値を用意する
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:[CIVector vectorWithX:toneCurveInput0XValue Y:toneCurveInput0YValue]];
        [array addObject:[CIVector vectorWithX:toneCurveInput1XValue Y:toneCurveInput1YValue]];
        [array addObject:[CIVector vectorWithX:toneCurveInput2XValue Y:toneCurveInput2YValue]];
        [array addObject:[CIVector vectorWithX:toneCurveInput3XValue Y:toneCurveInput3YValue]];
        [array addObject:[CIVector vectorWithX:toneCurveInput4XValue Y:toneCurveInput4YValue]];
        // Tone curveのフィルタをかける
        filteredImage = [TTKEditImage imageFilterToneCurve:filteredImage withVectors:array];
    }
    
    self.imageView.image = filteredImage;
}
@end
