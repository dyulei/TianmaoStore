//
//  Fun_2_TableViewCell.m
//  BirthDay_soft
//
//  Created by YuLei on 14-5-26.
//  Copyright (c) 2014年 ___DuanYuLei___. All rights reserved.
//

#import "Fun_2_TableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation Fun_2_TableViewCell{
    
    __weak IBOutlet UIImageView *imagePic;
    __weak IBOutlet UILabel *title_name;
    __weak IBOutlet UILabel *_description;
    __weak IBOutlet UILabel *_joinPeople;
    
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



-(void)setModel:(DataModel_Fun_2 *)model{
    title_name.text = model.name;
    _description.text = model.desc;
    _joinPeople.text = [NSString stringWithFormat:@"%@人提到过", model.joiners];
    [imagePic setImageWithURL:[NSURL URLWithString:model.logo]];
}

@end
/*
 @property (nonatomic, strong)NSString *logo;
 @property (nonatomic, strong)NSString *name;
 @property (nonatomic, strong)NSString *desc;
 @property (nonatomic, strong)NSString *labelId;
 @property (nonatomic, strong)NSString *joiners;
 */