//
//  TestTouchEvnetView.m
//  TestTouchEvent

#import "TouchEventTransferView.h"

@implementation TouchEventTransferView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //如果点击的点不在视图里,则用父类默认方法处理
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    else{
        //如果点击的点在本视图,则改变相应链
        UIResponder *nextResponder = self.nextResponder;
        while (![nextResponder isKindOfClass:[UIView class]]) {
            nextResponder = nextResponder.nextResponder;
        }
        if ([nextResponder isKindOfClass:[UIView class]]) {
            UIView *view = (UIView *)nextResponder;
            for (NSInteger i= view.subviews.count-1;i>=0;i--) {
                UIView *subView = [view.subviews objectAtIndex:i];
                //不能响应事件的view过滤掉
                if (subView.userInteractionEnabled==NO || subView.alpha<=0.01 || subView.hidden == YES) {
                    continue;
                }
                //点在本视图内的view
                if ([subView pointInside:point withEvent:event]) {
                    //只特殊处理本视图的响应链
                    if (subView == self) {
                        for (NSInteger j= self.subviews.count-1;j>=0;j--) {
                            UIView *selfSubView = [self.subviews objectAtIndex:j];
                            //坐标系转换到self,再调self中查找合适的subview
                            CGPoint pointOfSelfSubView = [self convertPoint:point toView:selfSubView];
                            if ([selfSubView pointInside:pointOfSelfSubView withEvent:event]) {
                                UIView *confirmView = [selfSubView hitTest:pointOfSelfSubView withEvent:event];
                                if (confirmView) {
                                    return confirmView;
                                }
                                else{
                                    continue;
                                }
                            }
                        }
                        continue;
                    }
                    else{
                        //点不在self中,则用原来的响应链处理方式
                        return [subView hitTest:point withEvent:event];
                    }
                }
            }
        }
    return nil;
    }
}

@end
