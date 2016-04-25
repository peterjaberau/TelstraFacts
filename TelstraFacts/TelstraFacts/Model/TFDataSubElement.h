/*!
 
 @class TFDataSubElement
 
 @brief The TFDataSubElement class
 
 @discussion
 This file contains the the TFDataSubElement and its Model parsing and creation method.
 
 @superclass SuperClass: NSObject
 @classdesign    No special design is applied here.
 @coclass
 @helps It helps no other classes.
 @helper    No helper exists for this class.
 
 */
#import <Foundation/Foundation.h>

@interface TFDataSubElement : NSObject
/*!
 @property NSString *descriptionText
 @brief descriptionText property is use to store String type value
 **/
@property (nonatomic, copy) NSString *descriptionText;
/*!
 @property NSString *imageHref
 @brief imageHref property is use to store String type value
 **/
@property (nonatomic, copy) NSString *imageHref;
/*!
 @property NSString *strTitle
 @brief strTitle property is use to store String type value
 **/
@property (nonatomic, copy) NSString *title;
/*!
@Method instanceFromDictionary:- This method use to Create TFDataSubElement Object from input dict paramter
@param  (NSDictionary *)aDictionary :- use to provide Dictionary type Object input
@return TFDataSubElement:-   use to return TFDataSubElement class Object .

*/
+ (TFDataSubElement *)instanceFromDictionary:(NSDictionary *)aDictionary;
/*!
 @Method setAttributesFromDictionary:- This method use to set the value to data model
 @param  (NSDictionary *)aDictionary :- use to provide Dictionary type Object input
 @return void  .
 
 */
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
@end
