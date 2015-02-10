//
//  MarchBegins.h
//  KingdomsFall
//
//  Created by Robert Warren on 2/3/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "CCScene.h"

@interface MarchBegins : CCScene
{
    CCNode* _physicsNode;
    CCNode* _ground1;
    CCNode* _ground2;
    CCNode* _ground3;
    CCNode* _ground4;
    CCNode* _ground5;
    CCNode* _castlebg;
    CCNode* _knight;
    CCSprite* _wiz;
    CCSprite* _darkSpirit;
    CCSprite* _gold;
    CCSprite* _boulder;
    NSArray* _grounds;
    NSMutableArray* _spritesArray;
    NSTimeInterval _sinceTouch;
}
@end
