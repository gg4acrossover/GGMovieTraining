//
//  GGDetailCell.m
//  GGMovie
//
//  Created by viethq on 1/13/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import "GGDetailCell.h"

@interface GGDetailCell()

@end

@implementation GGDetailCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.mNicknameLabel.numberOfLines = 0;
    self.mNicknameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.mCommentLabel.numberOfLines = 0;
    self.mCommentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
        
    if (self.mCommentLabel)
    {
        self.mCommentLabel.preferredMaxLayoutWidth = SCREEN_WIDTH - 50.0f - 20.0f;
    }
}


@end
