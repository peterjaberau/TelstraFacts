/*!
 
 @class TFDataModel
 @brief The TFDataModel class
 
 @discussion
 This file contains the the DataModel and its Model parsing and creation method.
 
 @superclass SuperClass: NSObject
 @classdesign    No special design is applied here.
 @coclass
 @helps It helps no other classes.
 @helper    No helper exists for this class.
 
 */

#import <Foundation/Foundation.h>
@interface TFDataModel : NSObject
/*!
 @property NSArray *arrRows
 @brief  arrRows property is use to store Array type values
 **/

@property (nonatomic, copy) NSArray *arrRows;
/*!
 @property NSString *title
 @brief title property is use to store String type value
 **/

@property (nonatomic, copy) NSString *title;

/*!
 @Method instanceFromDictionary:- This method use to Create TFDataModel Object from input dict paramter
 @param  (NSDictionary *)aDictionary :- use to provide Dictionary type Object input
 @return TFDataModel:-   use to return TFDataModel class Object .
 
 */
+ (TFDataModel *)instanceFromDictionary:(NSDictionary *)aDictionary;
/*!
 @Method setAttributesFromDictionary:- This method use to set the value to data model
 @param  (NSDictionary *)aDictionary :- use to provide Dictionary type Object input
 @return void  .
 
 */
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
@end
