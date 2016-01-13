//
//  GGDiscoverListCell.m
//  GGMovie
//
//  Created by viethq on 1/6/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import "GGDiscoverListCell.h"

@implementation GGDiscoverListCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.mLabel.numberOfLines = 0;
    self.mLabel.lineBreakMode = NSLineBreakByWordWrapping;
}

@end
