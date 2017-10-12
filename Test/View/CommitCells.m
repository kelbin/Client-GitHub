//
//  CommitCells.m
//  Test
//
//  Created by Kelbin on 11.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import "CommitCells.h"

@implementation CommitCells

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.author = [[UILabel alloc] init];
        self.author.frame = CGRectMake(10, 40, 50, 15);
        self.author.font = [UIFont fontWithName:@"Arial" size:13];
        
        self.sh = [[UILabel alloc] init];
        self.sh.frame = CGRectMake(10, 10, self.frame.size.width, 14);
        self.sh.font = [UIFont fontWithName:@"Arial" size:14];
        
        self.commitMessage = [[UILabel alloc] init];
        self.commitMessage.frame = CGRectMake(80, 40, 50, 15);
        self.commitMessage.font = [UIFont fontWithName:@"Arial" size:13];
        
        self.date = [[UILabel alloc] init];
        self.date.frame = CGRectMake(180, 40, 150, 15);
        self.date.font = [UIFont fontWithName:@"Arial" size:13];

        [self addSubview:self.author];
        [self addSubview:self.sh];
        [self addSubview:self.date];
        [self addSubview:self.commitMessage];
    }
    return self;
}

@end
