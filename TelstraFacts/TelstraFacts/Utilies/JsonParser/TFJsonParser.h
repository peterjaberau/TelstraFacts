
#import <Foundation/Foundation.h>
/*!
 @class TFJsonParser
 
 @brief The TFJsonParser class
 
 @discussion
 This file contains the the json Object parsing and creation method.
 
 @superclass SuperClass: NSObject
 @classdesign    No special design is applied here.
 @coclass
 @helps It helps no other classes.
 @helper    No helper exists for this class.
 */
@interface TFJsonParser : NSObject

/*!
 @Method parseJsonObject:- This method returns the current id as Object type (it will be json object,error or nil value)
 @param  data  The json object will be returned for.
 @return id   it will be json object,error or nil value .
 
 */

+(id)parseJsonObject:(id)data;

/*!
 @Method createJsonObject:- This method returns the current id as Object type (it will be json string,error or nil value)
 @param  id  it will take input as a dictionary array or string.
 @return id  it will be json object,error or nil value .
 */
+(id)createJsonObject:(id)obj;
@end
