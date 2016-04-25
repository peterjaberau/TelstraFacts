 
/*!
 
 @class CustomTableViewCell
 @brief The CustomTableViewCell class
 
 @discussion
 This file contains the the CustomTableViewCell  method  and its control implmentation.
 
 @superclass SuperClass: UITableViewCell
 
 */

#import <UIKit/UIKit.h>
#import "TFDataSubElement.h"
@interface CustomTableViewCell : UITableViewCell
/*!
 @Method setData:- This method use to set the value to from data model
 @param  (TFDataSubElement *)model :- use to provide TFDataSubElement type Object input
 @return void  .
  */
-(void)setData:(TFDataSubElement *)model;
@end
