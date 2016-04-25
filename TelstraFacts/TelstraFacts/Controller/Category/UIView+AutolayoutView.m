
#import "UIView+AutolayoutView.h"
@implementation UIView (AutolayoutView)
+(id)autolayoutView
{
    //creating UIView Object
    UIView *view = [self new];
    //setting constraint-based layout=NO
    view.translatesAutoresizingMaskIntoConstraints = NO;
    return view;
}
@end