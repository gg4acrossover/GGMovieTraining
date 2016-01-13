//
//  GGDetailMovieViewController.m
//  GGMovie
//
//  Created by viethq on 1/7/16.
//  Copyright © 2016 viethq. All rights reserved.
//

#import "GGDetailMovieViewController.h"
#import "GGDiscoverInfo.h"
#import "UIScrollView+GGHeaderView.h"

@interface GGDetailMovieViewController ()< UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mTblView;

@end

@implementation GGDetailMovieViewController

#pragma mark - Init
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self)
    {
        self.mDetailModel = nil;
    }
    
    return self;
}

#pragma mark - View life circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.mDetailModel.original_title;
    
    [self.mTblView registerClass: [UITableViewCell class]
          forCellReuseIdentifier: @"identifierTest"];
    
    self.mTblView.delegate = self;
    self.mTblView.dataSource = self;
    self.mTblView.backgroundColor = [UIColor clearColor];
    
    UIImageView *pImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, 260.0f)];
    pImgView.backgroundColor = [UIColor grayColor];
    
    [pImgView sd_setImageWithURL:[NSURL URLWithString: [NSString stringWithFormat: @"%@%@", BG_BACKDROP_PATH, self.mDetailModel.backdrop_path]]];
    
    [self.mTblView gg_addHeaderImage: pImgView.image
                           andHeight: HEIGHT(pImgView)];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MAIN_NAV setNavigationBarHidden:YES animated:YES];
}

#pragma mark - Layout
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    if (self.mTblView.mHeaderView)
    {
        CGRect f = self.mTblView.mHeaderView.frame;
        f.size.width = SCREEN_WIDTH;
        
        self.mTblView.mHeaderView.frame = f;
    }
}

#pragma mark - Tbl delegate & datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *pCell = [tableView dequeueReusableCellWithIdentifier:@"identifierTest"];
    pCell.textLabel.text = @"show me";
    return pCell;
}

#pragma mark - Deinit
- (void)dealloc
{
    [self.mTblView gg_removeObserver];
}

@end
