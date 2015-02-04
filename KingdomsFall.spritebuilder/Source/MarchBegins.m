//
//  MarchBegins.m
//  KingdomsFall
//
//  Created by Robert Warren on 2/3/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MarchBegins.h"
#import <AVFoundation/AVFoundation.h>

@implementation MarchBegins

- (void)didLoadFromCCB {
    [[OALSimpleAudio sharedInstance] playBg:@"Alters.caf" loop:YES];
}

-(void)playSound:(id)sender
{
    
    if (sender == _knight) {
       [[OALSimpleAudio sharedInstance] playEffect:@"Realistic_Punch.caf" loop:NO];
    }
    else if (sender == _gold)
    {
        [[OALSimpleAudio sharedInstance] playEffect:@"gold.caf" loop:NO];
    }
    else if (sender == _darkSpirit)
    {
        [[OALSimpleAudio sharedInstance] playEffect:@"Mace_Hit.caf" loop:NO];
    }
    else if (sender == _wiz)
    {
        [[OALSimpleAudio sharedInstance] playEffect:@"Mace_Hit.caf" loop:NO];
    }
}
@end
