//
//  SliderWithLabel.m
//  Swatchr
//
//  Created by Kamal Radharamanan on 8/16/12.
//  Copyright (c) 2012 Kamal Radharamanan. All rights reserved.
//

#import "SliderWithLabel.h"

@implementation SliderWithLabel

@synthesize delegate;
@synthesize slider;

- (id)initWithFrame:(CGRect)frame color:(UIColor *)color alpha:(BOOL)alphaIn
{
    self = [super initWithFrame:frame];
    if (self) {
        UIFont *labelFont = [UIFont systemFontOfSize:12];
        CGSize sizeOfString = [@"8888" sizeWithFont:labelFont];
        CGRect sliderFrame = CGRectMake(0, 0, (frame.size.width-sizeOfString.width), frame.size.height);
        CGRect labelFrame = CGRectMake(sliderFrame.size.width, 0, sizeOfString.width, frame.size.height);
        
        slider = [[UISlider alloc] initWithFrame:sliderFrame];
        slider.thumbTintColor = color;
        slider.minimumTrackTintColor = color;
        [slider setValue:0.5 animated:YES];
        
        label = [[UILabel alloc] initWithFrame:labelFrame];
        label.textColor = color;
        label.font = labelFont;
        
        if (alphaIn == false) {label.text = [NSString stringWithFormat:@"%.0f", slider.value*255];}
        else if (alphaIn == true) {label.text = [NSString stringWithFormat:@"%.2f", slider.value];}
        
        alpha = alphaIn;
        
        [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        
        [self addSubview:slider];
        [self addSubview:label];
        
    }
        return self;
}

-(void)sliderValueChanged:(UISlider *)inputSlider
{
    if (alpha == false) {label.text = [NSString stringWithFormat:@"%.0f", slider.value*255];}
    else if (alpha == true) {label.text = [NSString stringWithFormat:@"%.2f", slider.value];}
    
    [self.delegate sliderValueChanged:inputSlider];
}

@end
