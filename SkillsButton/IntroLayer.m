//
//  IntroLayer.m
//  SkillsButton
//
//  Created by 张瑞 on 13-5-27.
//  Copyright __MyCompanyName__ 2013年. All rights reserved.
//


// Import the interfaces
#import "IntroLayer.h"
#import "HelloWorldLayer.h"
#import "ParticleManager.h"


#pragma mark - IntroLayer

// HelloWorldLayer implementation
@implementation IntroLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	IntroLayer *layer = [IntroLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// 
-(void) onEnter
{
	[super onEnter];

	// ask director for the window size
	CGSize size = [[CCDirector sharedDirector] winSize];

	CCSprite *background;
	
	if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
		background = [CCSprite spriteWithFile:@"Bgr_4-1.png"];
		background.scaleX = size.width/640;
        background.scaleY = size.height/480;
	} else {
		background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
	}
	background.position = ccp(size.width/2, size.height/2);
    [self addChild: background];
    
    CCSprite *a = [CCSprite spriteWithFile:@"skill1.png"];
    a.scale = 0.5;
    a.position = ccp(50, 300);
    [self addChild:a z:1 tag:1];
    
    CCSprite *b = [CCSprite spriteWithFile:@"skill2.png"];
    b.scale = 0.5;
    b.position = ccp(400, 50);
    [self addChild:b z:1 tag:2];
    
    CCMenuItemFont *shoot = [CCMenuItemFont itemWithString:@"shoot" target:self selector:@selector(Shoot)];
    CCMenu *m = [CCMenu menuWithItems:shoot, nil];
    [self addChild:m z:1];
    
    
	// In one second transition to the new scene
//	[self scheduleOnce:@selector(makeTransition:) delay:1];
}

-(void)Shoot
{
//    CGSize s = [[CCDirector sharedDirector] winSize];
    CCSprite *a = (CCSprite *)[self getChildByTag:1];
    CCSprite *b = (CCSprite *)[self getChildByTag:2];
    CCParticleSystemQuad *iceArrow = [[ParticleManager shareParticleManager] particleWithType:ParticleTypeIceArrow];
    iceArrow.position = a.position;
    iceArrow.scale = 0.3;
//    float offX = b.position.x - a.position.x;
//    float offY = b.position.y - a.position.y;
//    float realX = s.width + a.contentSize.width/2;
//    float ratio = offX/offY;
//    float realY = (realX * ratio) + a.position.y;
//    float offRealX = realX - a.position.x;
//    float offRealY = realY - a.position.y;
//    float r = atanf(offRealX/offRealY) ;
//    float ro = CC_RADIANS_TO_DEGREES(r);
//    iceArrow.rotation = -1 * ro;
    [self addChild:iceArrow z:1];
    [iceArrow runAction:[CCMoveTo actionWithDuration:1.2f position:b.position]];
}

-(void) makeTransition:(ccTime)dt
{
	[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[HelloWorldLayer scene] withColor:ccWHITE]];
}
@end
