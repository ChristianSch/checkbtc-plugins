//
//  AIBitstampExchangeAPIController.m
//  AIBitstampExchangeAPIController
//
//  Created by Christian Schulze on 23.04.14.
//  Copyright (c) 2014 andinfinity. All rights reserved.
//

#define VERSION 0.3
#define MAX_RATE_SECONDS 1 /* max number of requests per second */

#import "AIBitstampExchangeAPIController.h"

@implementation AIBitstampExchangeAPIController

- (NSNumber *)protocolVersion
{
	return @VERSION;
}

+ (NSDictionary *)metadata
{
	return @{@"name": @"Bitstamp",
			 @"url": @"bitstamp.net"};
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
	return [NSURL URLWithString:@"https://www.bitstamp.net/api/ticker/"];
}

- (NSNumber*)avgForCurrency:(NSString*)currency
{
	return [NSNumber numberWithFloat:[json[@"vwap"] floatValue]];
}

- (NSString*)currencySymbol:(NSString*)currency
{
	if ([currency isEqualToString:@"USD"]) return @"$";

	NSLog(@"Currency not supported: %@", currency);
	return nil;
}

- (NSDictionary *)currencies
{
	return @{@"USD": @"US Dollar"};
}

@end
