

#import "TFDataModel.h"
#import "TFDataSubElement.h"

@implementation TFDataModel

/*
 synthesize the class level property values
 */
@synthesize arrRows;
@synthesize title;
/*
 created the class level constant string type varibale
 */
NSString *const kRowsKey = @"rows";
NSString *const kTitleKey = @"title";
/*
 This method is use to create TFDataModel type Object from dictionary type input value
 */
+ (TFDataModel *)instanceFromDictionary:(NSDictionary *)aDictionary{
    TFDataModel *taDataObj = [[TFDataModel alloc] init];
    [taDataObj setAttributesFromDictionary:aDictionary];
    return taDataObj;
}
/*
 This method use to compare the input value & if it maches then it set up property
 */
-(void)setAttributesFromDictionary:(NSDictionary *)aDictionary{
    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    [self setValuesForKeysWithDictionary:aDictionary];
}
/*
 This method use to set up the class level property values dictionary type input
 */
- (void)setValue:(id)value forKey:(NSString *)key{
    //compare the rows key and enumarate the rows array
    if ([key isEqualToString:kRowsKey]) {
        if ([value isKindOfClass:[NSArray class]])
        {
            //creating array Object with fix size
            NSMutableArray *arrData = [NSMutableArray arrayWithCapacity:[value count]];
            //enumarate the Rows array and Create Subelement object
            for (id data in value) {
                TFDataSubElement *subElements = [TFDataSubElement instanceFromDictionary:data];
                if(subElements.title!=nil || subElements.descriptionText!=nil )
                {
                    [arrData addObject:subElements];
                }
            }
            //assign rows data to class level array
            self.arrRows = arrData;
        }
    } else {
        //set title property
        [super setValue:value forKey:kTitleKey];
    }
}
@end
