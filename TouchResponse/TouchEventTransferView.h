//
//  TestTouchEvnetView.h
//  TestTouchEvent
//
//  Created by zoro on 11/3/16.
//  Copyright © 2016年 zoro. All rights reserved.
//

#import <UIKit/UIKit.h>
//当touchEvent 最终是由此view处理时,在本view中会改变响应链传递把事件传递给nextresponse处理
//当touchEvent 最终是由此view的subview处理时,响应方式不变
@interface TouchEventTransferView : UIView

@end
