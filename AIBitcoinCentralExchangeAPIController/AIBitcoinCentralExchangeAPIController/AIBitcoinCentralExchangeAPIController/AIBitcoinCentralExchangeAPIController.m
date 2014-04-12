//
//  AIBitcoinCentralExchangeAPIController.m
//  AIBitcoinCentralExchangeAPIController
//
//  Created by X on 11.04.14.
//  Copyright (c) 2014 andinfinity. All rights reserved.
//

#define VERSION 0.3


#import "AIBitcoinCentralExchangeAPIController.h"

@implementation AIBitcoinCentralExchangeAPIController

@synthesize protocolVersion;

- (id)init
{
	self = [super init];
	
	if (self != nil)
	{
		protocolVersion = @VERSION;
	}
	
	return self;
}

+ (NSDictionary *)metadata
{
	return @{
			 @"name": @"Bitcoin-Central",
			 @"@url": @"bitcoin-central.com"
			 };
}

- (void)handleData:(NSData*)data
{
	self->json = [NSJSONSerialization
				  JSONObjectWithData:data
				  options:NSJSONReadingMutableContainers
				  error:nil];
}

- (NSURL *)dataURLForCurrency:(NSString*)currency
{
	return [NSURL URLWithString:@"https://bitcoin-central.net/api/v1/data/eur/ticker"];
}

- (NSNumber*)avgForCurrency:(NSString*)currency
{
	return json[@"midpoint"];
}

- (NSString*)currencySymbol:(NSString*)currency
{
	if ([currency isEqualToString:@"EUR"]) {
		return @"€";
	}
	
	NSLog(@"Currency not supported: %@", currency);
	return nil;
}

- (NSDictionary *)currencies
{
	return @{
			 @"EUR": @"Euro",
			 };
}

@end
