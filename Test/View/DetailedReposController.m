//
//  DetailedReposController.m
//  Test
//
//  Created by Kelbin on 10.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import "DetailedReposController.h"

@interface DetailedReposController () <UITableViewDelegate, UITableViewDataSource> {
    UITableView *tableView;
}

@end

@implementation DetailedReposController
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self labelForForks];
    [self labelForLogin];
    [self labelForWatches];
    [self avatarUrl];
    [self imageForForks];
    [self imageForWatchers];
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y + 270, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[CommitCells class] forCellReuseIdentifier:@"CommitCells"];
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)labelForLogin {
    UILabel *labelLog = [UILabel new];
    labelLog.text = _login;
    labelLog.frame = CGRectMake(130, 170, 100, 100);
    labelLog.textColor = [UIColor blackColor];
    [self.view addSubview:labelLog];
}

- (void)labelForForks {
    UILabel *labelForks = [UILabel new];
    NSString *forks = [NSString stringWithFormat:@"%@",_forks];
    labelForks.text = forks;
    labelForks.frame = CGRectMake(250, 120, 100, 100);
    labelForks.textColor = [UIColor blackColor];
    [self.view addSubview:labelForks];
}

- (void)avatarUrl {
        NSURL *url = [NSURL URLWithString:_avatar];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *avatar = [UIImage imageWithData:data];
        UIImageView *avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 100, 100, 100)];
        avatarView.image = avatar;
        avatarView.layer.cornerRadius = 50;
        avatarView.clipsToBounds = YES;
        [self.view addSubview:avatarView];
}

- (void)imageForForks {
    UIImageView *forkView = [[UIImageView alloc] initWithFrame:CGRectMake(240, 120, 30, 30)];
    forkView.image = [UIImage imageNamed:@"forksIcon"];
    [self.view addSubview:forkView];
}

- (void)imageForWatchers {
    UIImageView *watchView = [[UIImageView alloc] initWithFrame:CGRectMake(270, 120, 70, 30)];
    watchView.image = [UIImage imageNamed:@"eyeIcon"];
    [self.view addSubview:watchView];
}

- (void)labelForWatches {
    UILabel *labelWatchers = [UILabel new];
    NSString *watchers = [NSString stringWithFormat:@"%@",_watchers];
    labelWatchers.text = watchers;
    labelWatchers.frame = CGRectMake(300, 120, 100, 100);
    labelWatchers.textColor = [UIColor blackColor];
    [self.view addSubview:labelWatchers];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _commitArray.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CommitCells";
    CommitCells *cell = (CommitCells *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil)
        cell = [[CommitCells alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundView = [[UIView alloc] init];
        [cell.backgroundView setBackgroundColor:[UIColor clearColor]];
    
    //NSString *forks = [NSString stringWithFormat:@"%@",_forks];
    cell.sh.text = _commitArray[indexPath.row].sh;
    cell.date.text = _commitArray[indexPath.row].detail.authored.date;
    cell.author.text = _commitArray[indexPath.row].detail.authored.name;
    cell.commitMessage.text = _commitArray[indexPath.row].detail.message;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
    return 80;
}

@end
