//
//  AIBitcoinCentralExchangeAPIController.h
//  AIBitcoinCentralExchangeAPIController
//
//  Created by Christian Schulze on 11.04.14.
//  Copyright (c) 2014 andinfinity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSourceProtocol.h"

@interface AIBitcoinCentralExchangeAPIController : NSObject<DataSourceProtocol>
{
	NSDictionary *json;
}

@property NSNumber *protocolVersion;

@end
