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
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.originalImage = _imageView.image;
    NSAssert(_originalImage != nil, @"画像の取得に失敗しました");
    
    // フラグの初期化
    self.isSepiaEnabled = NO;
    self.isGrayScaleEnabled = NO;
    
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

- (void)filterImage
{
    CGFloat sepiaValue = _sepiaSlider.value;
    _sepiaSliderLabel.text = [NSString stringWithFormat:@"%f", sepiaValue];

    UIImage *filteredImage = [_originalImage copy];
    if (_isSepiaEnabled) {
        filteredImage = [TTKEditImage imageFilterSepia:filteredImage withIntensity:sepiaValue];
    }
    
    CGFloat grayScaleValue = _grayScaleSlider.value;
    _grayScaleSliderLabel.text = [NSString stringWithFormat:@"%f", grayScaleValue];
    if (_isGrayScaleEnabled) {
        filteredImage = [TTKEditImage imageFilterGrayScale:filteredImage withIntensity:grayScaleValue];
    }
    
    self.imageView.image = filteredImage;
}

@end
