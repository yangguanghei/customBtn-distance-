//
//  FL_Button.m
//
//  Created by 姚京 on 15/12/10.
//  Copyright © 2015年 czebd. All rights reserved.
//

#import "FL_Button.h"
/**
 *  定义宏：按钮中文本和图片的间隔
 */
#define fl_btnRadio 0.6
//    获得按钮的大小
#define fl_btnWidth self.bounds.size.width
#define fl_btnHeight self.bounds.size.height
//    获得按钮中UILabel文本的大小
#define fl_labelWidth self.titleLabel.bounds.size.width
#define fl_labelHeight self.titleLabel.bounds.size.height
//    获得按钮中image图标的大小
#define fl_imageWidth self.imageView.bounds.size.width
#define fl_imageHeight self.imageView.bounds.size.height
#define MaxY(v) CGRectGetMaxY((v).frame) //纵坐标加上控件的高度
#define MaxY(v)            CGRectGetMaxY((v).frame) //纵坐标加上控件的高度

#define labely self.titleLabel.frame.origin.y

@implementation FL_Button

+ (instancetype)fl_shareButton{
    return [[self alloc] init];
}

- (instancetype)initWithAlignmentStatus:(FLAlignmentStatus)status{
    FL_Button *fl_button = [[FL_Button alloc] init];
    fl_button.status = status;
    return fl_button;
}

- (void)setStatus:(FLAlignmentStatus)status{
    _status = status;
}


- (void)alignmentNormal{
    
    //    设置文本的坐标
    CGFloat imageX = (fl_btnWidth - fl_labelWidth - fl_imageWidth - _fl_padding) * 0.5;
    CGFloat imageY = (fl_btnHeight - fl_imageHeight) * 0.5;
    
    //    设置label的frame
     self.imageView.frame = CGRectMake(imageX, imageY, fl_imageWidth, fl_imageHeight);
    
    //    设置图片的坐标
    CGFloat labelX = CGRectGetMaxX(self.imageView.frame) + _fl_padding;
    CGFloat labelY = (fl_btnHeight - fl_labelHeight) * 0.5;
    //    设置图片的frame
//    self.titleLabel.frame = CGRectMake(labelX, labelY, fl_labelWidth, fl_labelHeight);
    self.titleLabel.frame = CGRectMake(labelX, labely, fl_labelWidth, fl_labelHeight);
}
#pragma mark - 左对齐
- (void)alignmentLeft{
    
    //    获得按钮的文本的frame
    CGRect titleFrame = self.titleLabel.frame;
    //    设置按钮的文本的x坐标为0-－－左对齐
    titleFrame.origin.x = 0;
    
    //    获得按钮的图片的frame
    CGRect imageFrame = self.imageView.frame;
    //    设置按钮的图片的x坐标紧跟文本的后面
    imageFrame.origin.x = CGRectGetWidth(titleFrame) + _fl_padding;
    
    //    重写赋值frame
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}
#pragma mark - 右对齐
- (void)alignmentRight{
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    
    CGRect imageFrame = self.imageView.frame;
    imageFrame.origin.x = self.bounds.size.width - fl_imageWidth;
    CGRect titleFrame = self.titleLabel.frame;
    titleFrame.origin.x = imageFrame.origin.x - frame.size.width - _fl_padding;
    //    重写赋值frame
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}

#pragma mark - 居中对齐
- (void)alignmentCenter{
    //    设置文本的坐标
    CGFloat labelX = (fl_btnWidth - fl_labelWidth - fl_imageWidth - _fl_padding) * 0.5;
    CGFloat labelY = (fl_btnHeight - fl_labelHeight) * 0.5;
    
    //    设置label的frame
    self.titleLabel.frame = CGRectMake(labelX, labelY, fl_labelWidth, fl_labelHeight);
    
    //    设置图片的坐标
    CGFloat imageX = CGRectGetMaxX(self.titleLabel.frame) + _fl_padding;
    CGFloat imageY = (fl_btnHeight - fl_imageHeight) * 0.5;
    //    设置图片的frame
    self.imageView.frame = CGRectMake(imageX, imageY, fl_imageWidth, fl_imageHeight);
}

#pragma mark - 图标在上，文本在下(居中)
- (void)alignmentTop{
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
//  CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    CGFloat imageY = (fl_btnHeight - fl_imageHeight - fl_labelHeight -_fl_padding) * 0.5;
    CGFloat imageX = (fl_btnWidth - fl_imageWidth) * 0.5;
    self.imageView.frame = CGRectMake(imageX, imageY, fl_imageWidth, fl_imageHeight);
//    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, MaxY(self.imageView) + _fl_padding, fl_labelWidth, fl_labelHeight);
    self.titleLabel.frame = CGRectMake(0, MaxY(self.imageView) + _fl_padding, self.frame.size.width, fl_labelHeight);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
}

#pragma mark - 图标在下，文本在上(居中)
- (void)alignmentBottom{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    // 计算文本的的宽度
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = self.titleLabel.font;
    CGRect frame = [self.titleLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dictM context:nil];
    
    CGFloat imageY = (fl_btnHeight - fl_imageHeight - fl_labelHeight -_fl_padding) * 0.5;
    CGFloat imageX = (fl_btnWidth - fl_imageWidth) * 0.5;
    self.titleLabel.frame = CGRectMake((self.center.x - frame.size.width) * 0.5, imageY, fl_labelWidth, fl_labelHeight);
    self.imageView.frame = CGRectMake(imageX, MaxY(self.titleLabel) + _fl_padding, fl_imageWidth, fl_imageHeight);
    CGPoint labelCenter = self.titleLabel.center;
    labelCenter.x = self.imageView.center.x;
    self.titleLabel.center = labelCenter;
}


- (void)alignmentImageLeft{
    
    //    获得按钮的图片的frame
    CGRect imageFrame = self.imageView.frame;
    //    设置按钮的图片的x坐标紧跟文本的后面
    imageFrame.origin.x = 0;
    //    获得按钮的文本的frame
    CGRect titleFrame = self.titleLabel.frame;
    //    设置按钮的文本的x坐标为0-－－左对齐
    titleFrame.origin.x = CGRectGetWidth(imageFrame) + _fl_padding;
    //    重写赋值frame
    self.titleLabel.frame = titleFrame;
    self.imageView.frame = imageFrame;
}

/**
 *  布局子控件
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    // 判断
    if (_status == FLAlignmentStatusNormal) {
        [self alignmentNormal];
    }
    else if (_status == FLAlignmentStatusLeft){
        [self alignmentLeft];
    }
    else if (_status == FLAlignmentStatusCenter){
        [self alignmentCenter];
    }
    else if (_status == FLAlignmentStatusRight){
        [self alignmentRight];
    }
    else if (_status == FLAlignmentStatusTop){
        [self alignmentTop];
    }
    else if (_status == FLAlignmentStatusBottom){
        [self alignmentBottom];
    }
    else if (_status == FLAlignmentStatusImageLeft){
        [self alignmentImageLeft];
    }
    
}



@end
