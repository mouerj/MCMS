//
//  MagicalCreature.h
//  MCMS
//
//  Created by Andrew Palka on 1/19/16.
//  Copyright © 2016 Joseph Mouer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property UIImage *image;
-(instancetype)initWithName:(NSString *)name andImageNamed:(NSString *)imageName;
@end
