//
//  MarchBegins.m
//  KingdomsFall
//
//  Created by Robert Warren on 2/3/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "MarchBegins.h"
#import <AVFoundation/AVFoundation.h>

//static const CGFloat scrollSpeed = 80.f;

@implementation MarchBegins

//All initial calls including background music
- (void)didLoadFromCCB {
    //background music
    [[OALSimpleAudio sharedInstance] preloadBg:@"Alters.caf"];
    [[OALSimpleAudio sharedInstance] playBg:@"Alters.caf" loop:YES];
    //ground array for scrolling background
    _grounds = @[_ground1, _ground2, _ground3, _ground4, _ground5];
    //sprites array for determining which was collided with and which sound effect to play.
    _spritesArray = [NSMutableArray arrayWithObjects:_wiz, _darkSpirit, _gold, _boulder, nil];
    //enable touch
    self.userInteractionEnabled = TRUE;
    
    
}
//sounds from week 1
/*-(void)playSound:(id)sender
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
}*/

//constant run method. scrolling background full works when run but constant. looking for way to run it only when knight moves. also runs collision check.
- (void)update:(CCTime)delta {
    
    //scrolling background
    /*_physicsNode.position = ccp(_physicsNode.position.x - (scrollSpeed *delta), _physicsNode.position.y);
    for (CCNode *ground in _grounds) {
        CGPoint groundWorldPosition = [_physicsNode convertToWorldSpace:ground.position];
        CGPoint groundScreenPosition = [self convertToNodeSpace:groundWorldPosition];
        if (groundScreenPosition.x <= (-2 * ground.contentSize.width)) {
            ground.position = ccp(ground.position.x +4 * ground.contentSize.width, ground.position.y);
        }
    }*/
    
    //collision check
    CCSprite *sprite = [self spriteCollisionWithRect:_knight.boundingBox];
    if (sprite!=nil) {
        
    }


}

//collision check method
-(CCSprite*)spriteCollisionWithRect:(CGRect)bounds
{
    for (CCSprite *sprite in _spritesArray) {
        if (CGRectIntersectsRect(sprite.boundingBox, bounds)) {
            if (sprite == _gold)
            {
                [[OALSimpleAudio sharedInstance] preloadEffect:@"gold.caf"];
                [[OALSimpleAudio sharedInstance] playEffect:@"gold.caf" loop:NO];
                [sprite removeFromParentAndCleanup:YES];
                [_spritesArray removeObject:sprite];
            }
            else if (sprite == _darkSpirit)
            {
                [[OALSimpleAudio sharedInstance] preloadEffect:@"Mace_Hit.caf"];
                [[OALSimpleAudio sharedInstance] playEffect:@"Mace_Hit.caf" loop:NO];
                [sprite removeFromParentAndCleanup:YES];
                [_spritesArray removeObject:sprite];
            }
            else if (sprite == _wiz)
            {
                [[OALSimpleAudio sharedInstance] preloadEffect:@"Mace_Hit.caf"];
                [[OALSimpleAudio sharedInstance] playEffect:@"Mace_Hit.caf" loop:NO];
                [sprite removeFromParentAndCleanup:YES];
                [_spritesArray removeObject:sprite];
            }
            else if (sprite == _boulder)
            {
                _knight.position = ccp(_knight.position.x, _knight.position.y);
                CCActionMoveBy *moveNodeUpNOver = [CCActionMoveBy actionWithDuration:1.0f position:ccp(60.0f, 60.0f)];
                [_knight runAction:moveNodeUpNOver];
                [_spritesArray removeObject:sprite];
                [[OALSimpleAudio sharedInstance] preloadEffect:@"jump.caf"];
                [[OALSimpleAudio sharedInstance] playEffect:@"jump.caf" loop:NO];
            }
            
            return sprite;
        }
    }
    return nil;
}

//tap action and knight movement
- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    //move knight
    _knight.position = ccp(_knight.position.x, _knight.position.y);
    CCActionMoveBy *moveNodeRight = [CCActionMoveBy actionWithDuration:1.0f position:ccp(40.0f, 0.0f)];
    [_knight runAction:moveNodeRight];
    
}




@end
