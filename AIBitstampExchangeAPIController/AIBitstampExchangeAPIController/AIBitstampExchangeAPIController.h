//
//  AIBitstampExchangeAPIController.h
//  AIBitstampExchangeAPIController
//
//  Created by Christian Schulze on 23.04.14.
//  Copyright (c) 2014 andinfinity. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataSourceProtocol.h"

@interface AIBitstampExchangeAPIController : NSObject<DataSourceProtocol>
{
	NSDictionary *json;
}

@end
