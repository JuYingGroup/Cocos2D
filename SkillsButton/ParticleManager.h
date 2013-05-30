//
//  ParticleManager.h
//  SkillsButton
//
//  Created by 张瑞 on 13-5-27.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum {
    ParticleTypeIceArrow,
    ParticleTypeStar
}ParticleTypes;

@interface ParticleManager : NSObject

+(id)shareParticleManager;
//取得单例对象
-(CCParticleSystemQuad * ) particleWithType:(ParticleTypes) type;
//取得指定类型的粒子效果对象

@end
