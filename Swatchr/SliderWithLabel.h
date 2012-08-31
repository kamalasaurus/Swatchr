//
//  SliderWithLabel.h
//  Swatchr
//
//  Created by Kamal Radharamanan on 8/16/12.
//  Copyright (c) 2012 Kamal Radharamanan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderWithLabel : UIView

{
    UISlider *slider;
    UILabel *label;
    BOOL alpha;
}

@property (nonatomic, weak) id delegate;
@property (nonatomic, strong) UISlider *slider;

-(id)initWithFrame:(CGRect)frame color:(UIColor *)color alpha:(BOOL)alphaIn;

@end

@protocol SliderWithLabelDelegate

-(void)sliderValueChanged:(UISlider *) slider;

@end