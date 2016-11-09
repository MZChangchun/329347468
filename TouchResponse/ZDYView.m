//
//  ZDYView.m
//  拦截响应者链
//



#import "ZDYView.h"

#define ScreenSize  ([UIScreen mainScreen].bounds.size)
#define RGB(R,G,B)       [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:1.f];

@implementation ZDYView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor orangeColor];
        self.alpha = 0.3;
        [self addLabel];
    }
    return self;
}

-(void)addLabel
{
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 200)];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:13];
    lable.textColor = [UIColor redColor];
    lable.backgroundColor = [UIColor whiteColor];
    lable.layer.cornerRadius = 5.0;
    lable.clipsToBounds = YES;
    lable.userInteractionEnabled = YES;
    lable.layer.borderWidth = 1.0;
    lable.layer.borderColor = [UIColor redColor].CGColor;
    lable.tag = 10005;
    [self addSubview:lable];
}





@end
