/*!
 
 @class TFWebServiceHandler
 
 @brief The TFWebServiceHandler class
 
 @discussion
   This file is use to communicate with web server using IOSNative classes
 
 @superclass SuperClass: NSObject
 @classdesign    No special design is applied here.
 @coclass
 @helps It helps no other classes.
 @helper    No helper exists for this class.
 
 */

#import <Foundation/Foundation.h>
#import "TFDataModel.h"

typedef void (^TFRequest_Completion_Block)(BOOL success,TFDataModel *model);

@interface TFWebServiceHandler : NSObject

/*!
 @Method getFeeds:- This is instance  method use to get list of feeds from web service
 */
+(void)getFeeds:(TFRequest_Completion_Block)completionBlock;
@end
