//
//  Fun_1_TableViewCell.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-23.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "Fun_1_TableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation Fun_1_TableViewCell{
    __weak IBOutlet UIImageView *_authorAvatar;
    __weak IBOutlet UILabel *_authorDisplayName;
    __weak IBOutlet UIImageView *_image;
    __weak IBOutlet UILabel *_gmt;
    __weak IBOutlet UILabel *_heat;
    __weak IBOutlet UILabel *_labelRelations;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(DataModel_Fun_1 *)model{
    [_image setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.image]]];
    [_authorAvatar setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", model.authorAvatar]]];
    [_authorAvatar.layer setCornerRadius:CGRectGetHeight([_authorAvatar bounds])/2];
    _authorAvatar.layer.masksToBounds = YES;
    
    _authorDisplayName.text = model.authorDisplayName;
    _heat.text = [NSString stringWithFormat:@"❤ %@", model.heat];

    if (model.text) {
        _labelRelations.text = model.text;
    }
    int i = 0;
    for (NSDictionary *dic in model.likers) {
        if (i>7)
            break;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40 *i+5, 426, 30, 30)];
        [imageView setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", dic[@"avatar"]]]];
        [imageView.layer setCornerRadius:CGRectGetHeight([imageView bounds])/2];
        imageView.layer.masksToBounds = YES;
        
        ++i;
        [self addSubview:imageView];
    }
}

@end
