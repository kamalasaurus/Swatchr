//
//  RootViewController.h
//  Swatchr
//
//  Created by Kamal Radharamanan on 8/16/12.
//  Copyright (c) 2012 Kamal Radharamanan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwatchWithSliders.h"

@class SwatchWithSliders;
@class ReadoutSwatch;

@interface RootViewController : UIViewController <SwatchWithSlidersDelegate>

{
    SwatchWithSliders *leftSwatchWithSliders;
    SwatchWithSliders *rightSwatchWithSliders;
    ReadoutSwatch *readoutSwatch;
}

@end
