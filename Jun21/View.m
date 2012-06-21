//
//  RHCPView.m
//  Jun21
//
//  Created by Axel Nunez on 6/21/12.
//  Copyright (c) 2012 CUNY. All rights reserved.
//

#import "View.h"
#import <CoreLocation/CLLocation.h>	//for CLLocationCoordinate2D


@implementation View


- (id) initWithFrame: (CGRect) frame
{
self = [super initWithFrame: frame];
if (self) {
    // Initialization code
    self.backgroundColor = [UIColor blueColor];
}
return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

- (void) drawRect: (CGRect) rect
{
    // Drawing code
    static CLLocationCoordinate2D a[] = {
        {41.9581727581084, -124.1533468749999},
        {41.9581727581084, -120.0224874999999},
        {39.05194240855997, -119.9785421874999},
        {35.01954892367636, -114.6611593749999},
        {34.44169771818262, -114.3974874999999},
        {34.18762044623423, -114.1338156249999},
        {33.71372807682965, -114.5293234374999},
        {33.3106873892396, -114.6611593749999},
        {32.942662221479026, -114.5293234374999},
        {32.68412885528781, -114.7490499999999},
        {32.49900240763084, -117.166042187499},
        {32.942662221479026, -117.2539328124999},
        {33.3106873892396, -117.6494406249999},
        {33.677165656601474, -118.0010031249999},
        {34.07849503048467, -118.5722921874999},
        {34.405448066600115, -120.3301046874999},
        {34.8754651164383, -120.5498312499999},
        {35.4502778422704, -120.9013937499999},
        {36.19852850622303, -121.7363546874999},
        {36.51704227477474, -121.9560812499999},
        {36.939695530133434, -121.8242453124999},
        {37.080062361355104, -122.3515890624999},
        {37.29012611091099, -122.1758078124999},
        {37.743256290822536, -122.5713156249999},
        {38.709850201495776, -123.5820578124999},
        {39.56198745751984, -123.8457296874999},
        {40.23625302983366, -124.4170187499999},
         {40.837408882295065, -124.2851828124999},
        {41.89278086637983, -124.2851828124999}
        
        
        
	};
	static const size_t n = sizeof a / sizeof a[0];
	
	CGContextRef c = UIGraphicsGetCurrentContext();
	
	CGSize s = self.bounds.size;
	CGContextTranslateCTM(c, s.width / 2, s.height / 2);
	
	//Longitude and latitude in degrees of the heart of Manhattan,
	//probably somewhere around the Angel of the Waters.
	CGFloat xtranslate = 120;
	CGFloat ytranslate = -37;
	CGFloat scale = 30;	//pixels per degree of latitude
    
	CGContextScaleCTM(c, scale * cos(ytranslate * M_PI / 180), -scale);
	CGContextTranslateCTM(c, xtranslate, ytranslate);
    
	CGContextBeginPath(c);
	CGContextMoveToPoint(c, a[0].longitude, a[0].latitude);
	
	for (size_t i = 0; i < n; ++i) {
		CGContextAddLineToPoint(c, a[i].longitude, a[i].latitude);
	}
	
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 255.0, 215.0, 0.0, 1.0);	//opaque red
    CGSize shadow = CGSizeMake(-10, 20);
    CGContextSetShadow(c, shadow, 5);
	CGContextFillPath(c);
}
@end
