
#import "TFDataSubElement.h"
@implementation TFDataSubElement

/*
 synthesize the class level property values
 */
@synthesize descriptionText;
@synthesize imageHref;
@synthesize title;

/*
 created the class level constant string type varibale
 */
NSString *const kSubDescriptionKey = @"description";
NSString *const kSubDescriptionTestKey = @"descriptionText";
/*
 This method is use to create TFDataSubElement type Object from dictionary type input value
 */
+ (TFDataSubElement *)instanceFromDictionary:(NSDictionary *)aDictionary{
    TFDataSubElement *subElementObj = [[TFDataSubElement alloc] init];
    [subElementObj setAttributesFromDictionary:aDictionary];
    return subElementObj;
}
/*
 This method use to compare the input value & if it maches then it set up property
 */
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary{
    
    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    [self setValuesForKeysWithDictionary:aDictionary];
}
/*
 This method use to set up the class level property values dictionary type input
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    //Special case for description key
    if ([key isEqualToString:kSubDescriptionKey]) {
        [self setValue:value forKey:kSubDescriptionTestKey];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
}
@end
