

#import "TFWebServiceHandler.h"
#import "TFConstanst.h"
#import "TFJsonParser.h"

@implementation TFWebServiceHandler
+(void)getFeeds:(TFRequest_Completion_Block)completionBlock{
    //set up URL
    NSURL *url=[NSURL URLWithString:web_ServerURL];
    //creating Request and setup Method and Header Fields
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60.0];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [[[NSURLSession sharedSession]  dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
      {
          //checking service response
          if(data!=nil&&!error){
              //use to convert data into string using NSASCII StringEncoding
              NSString *strData = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
              //convert ascii string to NSData using UTF 8 Encoding
              NSData *responseData=[strData dataUsingEncoding:NSUTF8StringEncoding];
              //parsing json object using IOS Native Class
              id response=[TFJsonParser parseJsonObject:responseData];
              if([response isKindOfClass:[NSDictionary class]]){
                  //creating data model from Dictiontary
                  TFDataModel *model=[TFDataModel instanceFromDictionary:response];
                  if(model){
                      completionBlock(YES,model);
                      return ;
                  }
              }
          }
          completionBlock(NO,nil);
      }]resume];
}
@end
