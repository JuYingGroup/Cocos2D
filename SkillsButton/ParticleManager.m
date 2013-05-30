//
//  ParticleManager.m
//  SkillsButton
//
//  Created by 张瑞 on 13-5-27.
//
//

#import "ParticleManager.h"

static ParticleManager *particleManger;
@implementation ParticleManager

+(id)shareParticleManager
{
    if (particleManger == nil) {
        particleManger = [[ParticleManager alloc] init];
    }
    return particleManger;
}

-(CCParticleSystemQuad *)particleWithType:(ParticleTypes)type
{
    CCParticleSystemQuad *system = nil;
    
    switch (type) {
        case ParticleTypeIceArrow:
        {
            system = [CCParticleSystemQuad particleWithFile:@"IceArrow1.plist"];
            [system setAutoRemoveOnFinish:YES];
            [system setPositionType:kCCPositionTypeFree];
        }
            break;
        case ParticleTypeStar:
            break;
        default:
            break;
    }
    return system;
}

- (void)dealloc
{
    [particleManger release];
    [super dealloc];
}

@end
