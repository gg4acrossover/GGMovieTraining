//
//  GGTextCell.m
//  GGMovie
//
//  Created by viethq on 1/14/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import "GGTextCell.h"

@implementation GGTextCell

- (void)awakeFromNib
{
    // Initialization code
    self.mLabel.numberOfLines = 0;
    self.mLabel.lineBreakMode = NSLineBreakByWordWrapping;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.mLabel)
    {
        self.mLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - 16.0f; /*padding left = 8.0f, padding right = 8.0f*/
    }
}

@end
