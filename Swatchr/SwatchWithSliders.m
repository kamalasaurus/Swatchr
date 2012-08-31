//
//  SwatchWithSliders.m
//  Swatchr
//
//  Created by Kamal Radharamanan on 8/17/12.
//  Copyright (c) 2012 Kamal Radharamanan. All rights reserved.
//

#import "SwatchWithSliders.h"
#import "SliderWithLabel.h"

@implementation SwatchWithSliders

@synthesize delegate;
@synthesize swatchColor = _swatchColor;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        swatch = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 180, 100)];
        swatch.backgroundColor = [[UIColor alloc] initWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
        
        sliderR = [[SliderWithLabel alloc] initWithFrame:CGRectMake(40, 130, 100, 20) color:[UIColor redColor] alpha:false];
        sliderG = [[SliderWithLabel alloc] initWithFrame:CGRectMake(40, 160, 100, 20) color:[UIColor greenColor] alpha:false];
        sliderB = [[SliderWithLabel alloc] initWithFrame:CGRectMake(40, 190, 100, 20) color:[UIColor blueColor] alpha:false];
        sliderA = [[SliderWithLabel alloc] initWithFrame:CGRectMake(40, 220, 100, 20) color:[UIColor grayColor] alpha:true];
        
        sliderR.delegate = self;
        sliderG.delegate = self;
        sliderB.delegate = self;
        sliderA.delegate = self;
        
        [self addSubview:swatch];
        [self addSubview:sliderR];
        [self addSubview:sliderG];
        [self addSubview:sliderB];
        [self addSubview:sliderA];
        
    }
    return self;
}

-(void)sliderValueChanged:(UISlider *) slider
{
    float r, g, b, a;
    
    [swatch.backgroundColor getRed:&r green:&g blue:&b alpha:&a];
    
    if      (slider == sliderR.slider) { r = slider.value; }
    else if (slider == sliderG.slider) { g = slider.value; }
    else if (slider == sliderB.slider) { b = slider.value; }
    else if (slider == sliderA.slider) { a = slider.value; }
    
    swatch.backgroundColor = [[UIColor alloc] initWithRed:r green:g blue:b alpha:a];
    
    self.swatchColor = swatch.backgroundColor;
    
    [self.delegate colorChangedOnObject:self];
    
}

@end
