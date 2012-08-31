//
//  ReadoutSwatch.h
//  Swatchr
//
//  Created by Kamal Radharamanan on 8/17/12.
//  Copyright (c) 2012 Kamal Radharamanan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadoutSwatch : UIView

{
    float r, g, b, a;
    UIView *swatch;
    UILabel *red;
    UILabel *green;
    UILabel *blue;
}

- (id)initWithFrame:(CGRect)frame color:(UIColor *)color;
- (void)updateSwatchWithLeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor;

@end
