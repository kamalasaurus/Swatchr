//
//  RootViewController.m
//  Swatchr
//
//  Created by Kamal Radharamanan on 8/16/12.
//  Copyright (c) 2012 Kamal Radharamanan. All rights reserved.
//

#import "RootViewController.h"
#import "SwatchWithSliders.h"
#import "ReadoutSwatch.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    leftSwatchWithSliders = [[SwatchWithSliders alloc] initWithFrame:CGRectMake(20, 60, 180, 250)];
    rightSwatchWithSliders = [[SwatchWithSliders alloc] initWithFrame:CGRectMake(120, 60, 180, 250)];
    
    [self.view addSubview:leftSwatchWithSliders];
    [self.view addSubview:rightSwatchWithSliders];
    
    [leftSwatchWithSliders setDelegate:self];
    rightSwatchWithSliders.delegate = self;
    
    readoutSwatch = [[ReadoutSwatch alloc] initWithFrame:CGRectMake(0, 320, 320, 100) color:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5]];
    
    [self.view addSubview:readoutSwatch];
    
    leftSwatchWithSliders.swatchColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    rightSwatchWithSliders.swatchColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    
    [self colorChanged:leftSwatchWithSliders.swatchColor rightColor:rightSwatchWithSliders.swatchColor];
}

- (void)colorChangedOnObject:(SwatchWithSliders *)swatch;
{
        [self colorChanged:leftSwatchWithSliders.swatchColor rightColor:rightSwatchWithSliders.swatchColor];
}

- (void)colorChanged:(UIColor *)leftColor rightColor:(UIColor *)rightColor
{
    [readoutSwatch updateSwatchWithLeftColor:leftColor rightColor:rightColor];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
