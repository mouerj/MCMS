//
//  MagicalCreature.m
//  MCMS
//
//  Created by Andrew Palka on 1/19/16.
//  Copyright © 2016 Joseph Mouer. All rights reserved.
//

#import "MagicalCreature.h"
#import <UIKit/UIKit.h>

@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name andImageNamed:(NSString *)imageName andSwag:(NSString *)swag {
    self = [super init];
    if (self) {
        self.name = name;
        self.image = [UIImage imageNamed:imageName];
        self.swag = swag;
    }
    return self;
}

@end
