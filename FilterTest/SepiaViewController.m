//
//  SepiaViewController.m
//  FilterTest
//
//  Created by Kashima Takumi on 2014/03/26.
//  Copyright (c) 2014年 TEAM TAKOYAKI. All rights reserved.
//

#import "SepiaViewController.h"
#import "TTKEditImage.h"

@interface SepiaViewController ()
@property (nonatomic, strong) UIImage *originalImage;
@end

@implementation SepiaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.originalImage = _imageView.image;
    NSAssert(_originalImage != nil, @"画像の取得に失敗しました");
    
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

- (IBAction)changedValue:(id)sender
{
    [self filterImage];
}

- (void)filterImage
{
    CGFloat value = _slider.value;
    _sliderValue.text = [NSString stringWithFormat:@"%f", value];
    
    UIImage *filteredImage = [TTKEditImage imageFilterSepia:_originalImage WithIntensity:value];
    [_imageView setImage:filteredImage];
}

@end
