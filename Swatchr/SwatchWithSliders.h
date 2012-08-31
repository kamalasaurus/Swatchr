//
//  SwatchWithSliders.h
//  Swatchr
//
//  Created by Kamal Radharamanan on 8/17/12.
//  Copyright (c) 2012 Kamal Radharamanan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderWithLabel.h"

@class SliderWithLabel;
@class SwatchWithSliders;

@protocol SwatchWithSlidersDelegate

- (void)colorChangedOnObject:(SwatchWithSliders *)swatch;

@end

@interface SwatchWithSliders : UIView <SliderWithLabelDelegate>

{
    UIView *swatch;
    SliderWithLabel *sliderR;
    SliderWithLabel *sliderG;
    SliderWithLabel *sliderB;
    SliderWithLabel *sliderA;
    float redValue, greenValue, blueValue, alphaValue;
}

@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) UIColor *swatchColor;

-(id)initWithFrame:(CGRect)frame;

@end
