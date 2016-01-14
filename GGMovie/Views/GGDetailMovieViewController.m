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
#import "GGDetailCell.h"

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
    
    /* tableview setting */
    [self.mTblView registerClass: [UITableViewCell class]
          forCellReuseIdentifier: @"identifierTest"];
    
    
    // add delegate & datasource
    self.mTblView.delegate = self;
    self.mTblView.dataSource = self;
    self.mTblView.backgroundColor = [UIColor clearColor];
    
    
    // add header view
    UIImageView *pImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, 260.0f)];
    pImgView.backgroundColor = [UIColor grayColor];
    
    [pImgView sd_setImageWithURL:[NSURL URLWithString: [NSString stringWithFormat: @"%@%@", BG_BACKDROP_PATH, self.mDetailModel.backdrop_path]]];
    
    [self.mTblView gg_addHeaderImage: pImgView.image
                           andHeight: HEIGHT(pImgView)];
    
    
    // register cell
    [self.mTblView registerNib:[UINib nibWithNibName:NSStringFromClass([GGDetailCell class]) bundle:nil] forCellReuseIdentifier: NSStringFromClass([GGDetailCell class])];
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
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1. create cell
    GGDetailCell *pTempCell = [self.mTblView dequeueReusableCellWithIdentifier:NSStringFromClass([GGDetailCell class])];
    
    //2. fill data for cell
    [self fillCell:pTempCell withData:self.mDetailModel];
    
    //3. height caculator
    CGSize s = [pTempCell.contentView  systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    DLog(@"cell h: %f", s.height);
    return s.height + 1.0f;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGDetailCell *pCell = [self.mTblView dequeueReusableCellWithIdentifier:NSStringFromClass([GGDetailCell class])];
    
    [self fillCell:pCell withData:self.mDetailModel];
    pCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return pCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Cell helper
- (void)fillCell:(UITableViewCell*)cell
        withData:(NSObject*)model
{
    if ([cell isKindOfClass:[GGDetailCell class]])
    {
        GGDiscoverModel *pModel = (GGDiscoverModel*)model;
        GGDetailCell *pDetailCell = (GGDetailCell*)cell;
                
        pDetailCell.mNicknameLabel.text = pModel.original_title;
        pDetailCell.mCommentLabel.text = @"70-year-old widower Ben Whittaker has discovered that retirement isn't all it's cracked up to be. Seizing an opportunity to get back in the game, he becomes a senior intern at an online fashion site, founded and run by Jules Ostin";
        
        [pDetailCell.mImageView sd_setImageWithURL:[NSURL URLWithString: [NSString stringWithFormat: @"%@%@", POSTER_BACKDROP_PATH, self.mDetailModel.poster_path]]];
        
        [cell setNeedsLayout];
        [cell layoutIfNeeded];
    }
}

#pragma mark - Deinit
- (void)dealloc
{
    [self.mTblView gg_removeObserver];
}

@end
