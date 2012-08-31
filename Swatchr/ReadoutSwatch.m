//
//  ReadoutSwatch.m
//  Swatchr
//
//  Created by Kamal Radharamanan on 8/17/12.
//  Copyright (c) 2012 Kamal Radharamanan. All rights reserved.
//

#import "ReadoutSwatch.h"

@implementation ReadoutSwatch

- (id)initWithFrame:(CGRect)frame color:(UIColor *)color
{
    self = [super initWithFrame:frame];
    if (self) {
        swatch = [[UIView alloc] initWithFrame:CGRectMake(110, 0, 100, 100)];
        red = [[UILabel alloc] initWithFrame:CGRectMake(40, 110, 100, 20)];
        green = [[UILabel alloc] initWithFrame:CGRectMake(140, 110, 100, 20)];
        blue = [[UILabel alloc] initWithFrame:CGRectMake(240, 110, 100, 20)];
        red.textColor = [UIColor redColor];
        green.textColor = [UIColor greenColor];
        blue.textColor = [UIColor blueColor];
        
        swatch.backgroundColor = color;
        
        [swatch.backgroundColor getRed:&r green:&g blue:&b alpha:&a];
        red.text = [NSString stringWithFormat:@"%.0f",r*255];
        green.text = [NSString stringWithFormat:@"%.0f",g*255];
        blue.text = [NSString stringWithFormat:@"%.0f",b*255];
        
        
        [self addSubview:swatch];
        [self addSubview:red];
        [self addSubview:green];
        [self addSubview:blue];
    }
    return self;
}

- (void)updateSwatchWithLeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor
{
    float rLeft, gLeft, bLeft, aLeft, rRight, gRight, bRight, aRight, rOut, gOut, bOut;
    
    [leftColor getRed:&rLeft green:&gLeft blue:&bLeft alpha:&aLeft];
    [rightColor getRed:&rRight green:&gRight blue:&bRight alpha:&aRight];

    //Alpha compositing is a recursive algorithm!  That's why it slows down anything you want
    //to utilize it. All RGBA images must be transformed to RGB to be displayed on the screen
    //the field that addresses this is called compositing algebra, explained in greater depth
    //at en.wikipedia.org/wiki/Alpha_compositing.  The equations applied are as follows:
    //colorOut = ((1-alphaIn)*backgroundColor) + (alphaIn * colorIn) with "color" referring to
    //the respective channel and the initial background color being white (1) in this case.
    //Since the call is recursive with the one tile on top of the other, the colorOut after
    //calculating for the first tile is plugged in as the backgroundColor in the same equation
    //with the other tile's alpha and color data plugged in.  This stack is actually recursed
    //for every single pixel on the screen with alpha-valued layers by the GPU.
    
    rOut = ((1-aRight)*(((1-aLeft)*(1)) + (aLeft * rLeft))) + (aRight * rRight);
    gOut = ((1-aRight)*(((1-aLeft)*(1)) + (aLeft * gLeft))) + (aRight * gRight);
    bOut = ((1-aRight)*(((1-aLeft)*(1)) + (aLeft * bLeft))) + (aRight * bRight);

    //Sanity check for color readout:
    //NSLog(@"%g,%g,%g", rOut, gOut, bOut);
    
    UIColor *color = [[UIColor alloc] initWithRed:rOut green:gOut blue:bOut alpha:1.0];
    
    swatch.backgroundColor = color;
    
    [swatch.backgroundColor getRed:&r green:&g blue:&b alpha:&a];
    red.text = [NSString stringWithFormat:@"%.0f",r*255];
    green.text = [NSString stringWithFormat:@"%.0f",g*255];
    blue.text = [NSString stringWithFormat:@"%.0f",b*255];
}

@end
