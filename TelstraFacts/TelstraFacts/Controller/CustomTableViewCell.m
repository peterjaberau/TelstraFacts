
#import "CustomTableViewCell.h"
#import "UIView+AutolayoutView.h"
#import "UIImageView+WebCache.h"

@interface CustomTableViewCell (){
}
//creating UIlabel and Image view Object
@property(nonatomic,strong)   UILabel *lblTitle,*lblDesc;
@property(nonatomic,strong)  UIImageView *imgView;
@end
@implementation CustomTableViewCell
//define image width as a constant variable
#define  imageWidth 40
//registering outlet
@synthesize lblTitle,lblDesc,imgView;
#pragma initWithStyle
//use to initialise the cell method
 -(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
     //setup custom Objects
    [self setupCustomTableViewCell];
    return self;
 }
#pragma setupCustomTableViewCell
-(void) setupCustomTableViewCell {
    
    //creating label object
    lblTitle = [UILabel autolayoutView];
    //setting font
    lblTitle.font = [UIFont boldSystemFontOfSize:15.0f];
    //setting number of line
    lblTitle.numberOfLines = 0;
    //setting bg color
    lblTitle.backgroundColor = [UIColor clearColor];
    //add label to cell content view
    [ self.contentView addSubview:lblTitle];
    
    //creating label object
    lblDesc = [UILabel autolayoutView];
    //setting font
    lblDesc.font = [UIFont systemFontOfSize:13.0f];
    //setting number of line
    lblDesc.numberOfLines = 0;
    //setting bg color
    lblDesc.backgroundColor = [UIColor clearColor];
    //add label to cell content view
    [ self.contentView addSubview:lblDesc];
    
    //creating UIImageView object
    imgView= [UIImageView autolayoutView];
    //add UIImageView to cell content view
    [self.contentView addSubview:imgView];
    
    //binding control inside dictionary
    NSDictionary *views = NSDictionaryOfVariableBindings(self.contentView,lblTitle,lblDesc,imgView);
    //adding metrics
    NSDictionary *metrics =@{@"imageWidth":@imageWidth,@"padding":@5.0,@"top":@5.0 };

    // Title and image horizontal layout
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-top-[lblTitle]-top-[imgView(imageWidth)]-top-|" options:0 metrics:metrics views:views]];
    
    //Description and image horizontal layout
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-top-[lblDesc]-top-[imgView(imageWidth)]-top-|" options:0 metrics:metrics views:views]];
    
    // Title and Description vertical layout - spacing at least zero between the two
    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[lblTitle]->=1-[lblDesc]-padding-|" options:NSLayoutFormatAlignAllLeft metrics:metrics views:views]];
    
    // Image  layout
   [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-top-[imgView(imageWidth)]" options:NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight metrics:metrics views:views]];
    
    [self setupWidth];
}
#pragma setupWidth
-(void)setupWidth{
    //setting width
    float width=[UIScreen mainScreen].bounds.size.width-(65);
    lblDesc.preferredMaxLayoutWidth = width; // This is necessary to allow the label to use multi-line text properly
    lblTitle.preferredMaxLayoutWidth = width; // This is necessary to allow the label to use multi-line text properly
}
#pragma setData
-(void) setData:(TFDataSubElement *)model{
    [self setupWidth];
    //set details and title of the cell
     lblDesc.text =model.descriptionText ;
    lblTitle.text = model.title;
    //checking image url if found then download image from URL
    if (model.imageHref != nil)
    {
        self.imgView.hidden = NO;
        NSURL *url=[NSURL URLWithString:model.imageHref];
         if(url!=nil&&[url absoluteString].length>0)
            [self.imgView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"ImageNotFound"]];
         else
            self.imgView.hidden = YES;
      }
    else {
        self.imgView.hidden = YES;
    }
}
@end
