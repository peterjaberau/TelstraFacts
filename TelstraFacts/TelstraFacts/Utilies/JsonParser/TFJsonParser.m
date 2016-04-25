
//
//  TFJsonParser.m
//  TelstraFacts
//
//  Created by Peter Jaber on 4/21/16.
//  Copyright © 2016 Peter Jaber. All rights reserved.
//

#import "TFJsonParser.h"

@implementation TFJsonParser
/*!
 @Method parseJsonObject:- This method returns the current id as Object type (it will be json object,error or nil value)
 @param  data  The json object will be returned for.
 @return id   it will be json object,error or nil value .
 
 */
+(id)parseJsonObject:(id)data
{
    if([data isKindOfClass:[NSData class]])
    {
        NSError *parseJsonError;
        id serviceResponse=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&parseJsonError];
        if(!parseJsonError)
        {
            return serviceResponse;
        }
        return parseJsonError;
    }
    return nil;
}
/*!
 @Method createJsonObject:- This method returns the current id as Object type (it will be json string,error or nil value)
 @param  id  it will take input as a dictionary array or string.
 @return id  it will be json object,error or nil value .
 */
#pragma mark create json Object
+(id)createJsonObject:(id)obj
{
    NSError *parseJsonError;
    NSData* data = [NSJSONSerialization dataWithJSONObject:obj options:kNilOptions error:&parseJsonError];
    if(!parseJsonError)
    {
        return data;
    }
    return parseJsonError;
}
@end
