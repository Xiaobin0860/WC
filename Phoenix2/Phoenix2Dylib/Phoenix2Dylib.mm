#line 1 "/Users/xiaobin/Documents/work/myself/Phoenix2/Phoenix2Dylib/Phoenix2Dylib.xm"


#include <string>
#import <UIKit/UIKit.h>

struct GameResults {
    int score;
    _Bool completed;
    int enemies_destroyed;
    long long enemies;
    int waves_beaten;
    float waves_beat_time;
    long long lap_times;
    float time_alive;
    int grazed_projectiles;
    float energy_gained;
    float energy_gathered;
    float energy_spilled;
    float energy_drained;
    int power_dropped;
    float shield_damage;
    float armor_damage;
    float body_damage;
    float unused_damage;
    int aura_ability_activated;
    int zen_ability_activated;
    std::string signature;
    int xp;
    int revives_used;
    float weapon_dps;
};

@interface Phoenix2GameViewController : UIViewController
- (void)adDidFinish;
@end

@interface Phoenix2Ship : NSObject
{
    NSString *identifier_;    
    int max_upgrades_;    
    NSString *state_key_;    
    int state_;    
    int unlock_cost_;    
    int rarity_;    
    int damage_type_;    
    int preview_enemy_;    
    int zen_mode_;    
    int weapon_level_;    
    int primary_level_;    
    int secondary_level_;    
    int times_played_;    
    int enemies_destroyed_;    
    long long integer_id_;    
    NSArray *weapon_upgrades_;    
    NSArray *primary_upgrades_;    
    NSArray *secondary_upgrades_;    
    NSString *range_indicator_;    
}
@property(readonly, nonatomic) int enemiesDestroyed;
@property(readonly, nonatomic) int timesPlayed;
@property(readonly, nonatomic) int secondaryLevel;
@property(readonly, nonatomic) int primaryLevel;
@property(readonly, nonatomic) int weaponLevel;
@property(readonly, nonatomic) int state;
- (id)localizedName;
- (id)identifier;
- (id)copyWithState:(int)arg1 weaponLevel:(int)arg2 primaryLevel:(int)arg3 secondaryLevel:(int)arg4 timesPlayed:(int)arg5 enemiesDestroyed:(int)arg6;
@end


















#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class Phoenix2Score; @class Phoenix2GameViewController; 
static void (*_logos_orig$_ungrouped$Phoenix2GameViewController$createNewScoreAndStartNewGameOfUser$withShip$)(_LOGOS_SELF_TYPE_NORMAL Phoenix2GameViewController* _LOGOS_SELF_CONST, SEL, id, Phoenix2Ship *); static void _logos_method$_ungrouped$Phoenix2GameViewController$createNewScoreAndStartNewGameOfUser$withShip$(_LOGOS_SELF_TYPE_NORMAL Phoenix2GameViewController* _LOGOS_SELF_CONST, SEL, id, Phoenix2Ship *); static Phoenix2Score* (*_logos_orig$_ungrouped$Phoenix2Score$initScoreOfUser$forStage$usingShip$)(_LOGOS_SELF_TYPE_INIT Phoenix2Score*, SEL, id, id, Phoenix2Ship *) _LOGOS_RETURN_RETAINED; static Phoenix2Score* _logos_method$_ungrouped$Phoenix2Score$initScoreOfUser$forStage$usingShip$(_LOGOS_SELF_TYPE_INIT Phoenix2Score*, SEL, id, id, Phoenix2Ship *) _LOGOS_RETURN_RETAINED; 

#line 86 "/Users/xiaobin/Documents/work/myself/Phoenix2/Phoenix2Dylib/Phoenix2Dylib.xm"








static void _logos_method$_ungrouped$Phoenix2GameViewController$createNewScoreAndStartNewGameOfUser$withShip$(_LOGOS_SELF_TYPE_NORMAL Phoenix2GameViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, Phoenix2Ship * arg2) {



    HBLogDebug(@"-[<Phoenix2GameViewController: %p> createNewScoreAndStartNewGameOfUser:%@ withShip:%@]", self, arg1, arg2);
    NSLog(@"%@(%@) weaponLevel=%d,primaryLevel=%d,secondaryLevel=%d", [arg2 localizedName], [arg2 identifier], arg2.weaponLevel, arg2.primaryLevel, arg2.secondaryLevel);
    _logos_orig$_ungrouped$Phoenix2GameViewController$createNewScoreAndStartNewGameOfUser$withShip$(self, _cmd, arg1, arg2);
}


































































static Phoenix2Score* _logos_method$_ungrouped$Phoenix2Score$initScoreOfUser$forStage$usingShip$(_LOGOS_SELF_TYPE_INIT Phoenix2Score* __unused self, SEL __unused _cmd, id arg1, id arg2, Phoenix2Ship * arg3) _LOGOS_RETURN_RETAINED {
    HBLogDebug(@"-[<Phoenix2Score: %p> initScoreOfUser:%@ forStage:%@ usingShip:%@]", self, arg1, arg2, arg3);
    Phoenix2Ship *ship = [arg3 copyWithState:arg3.state
                                 weaponLevel:arg3.weaponLevel
                                primaryLevel:arg3.primaryLevel
                              secondaryLevel:arg3.secondaryLevel
                                 timesPlayed:arg3.timesPlayed
                            enemiesDestroyed:arg3.enemiesDestroyed];
    NSLog(@"%@(%@) weaponLevel=%d,primaryLevel=%d,secondaryLevel=%d", [ship localizedName], [ship identifier], ship.weaponLevel, ship.primaryLevel, ship.secondaryLevel);
    id r = _logos_orig$_ungrouped$Phoenix2Score$initScoreOfUser$forStage$usingShip$(self, _cmd, arg1, arg2, ship);
    char* pShip = (char*)(__bridge void*)arg3;
    *(int*)((char*)pShip+0x38) = 6;
    *(int*)((char*)pShip+0x3c) = 6;
    *(int*)((char*)pShip+0x40) = 6;
    NSLog(@"HACK %@(%@) weaponLevel=%d,primaryLevel=%d,secondaryLevel=%d", [arg3 localizedName], [arg3 identifier], arg3.weaponLevel, arg3.primaryLevel, arg3.secondaryLevel);
    return r;
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$Phoenix2GameViewController = objc_getClass("Phoenix2GameViewController"); MSHookMessageEx(_logos_class$_ungrouped$Phoenix2GameViewController, @selector(createNewScoreAndStartNewGameOfUser:withShip:), (IMP)&_logos_method$_ungrouped$Phoenix2GameViewController$createNewScoreAndStartNewGameOfUser$withShip$, (IMP*)&_logos_orig$_ungrouped$Phoenix2GameViewController$createNewScoreAndStartNewGameOfUser$withShip$);Class _logos_class$_ungrouped$Phoenix2Score = objc_getClass("Phoenix2Score"); MSHookMessageEx(_logos_class$_ungrouped$Phoenix2Score, @selector(initScoreOfUser:forStage:usingShip:), (IMP)&_logos_method$_ungrouped$Phoenix2Score$initScoreOfUser$forStage$usingShip$, (IMP*)&_logos_orig$_ungrouped$Phoenix2Score$initScoreOfUser$forStage$usingShip$);} }
#line 187 "/Users/xiaobin/Documents/work/myself/Phoenix2/Phoenix2Dylib/Phoenix2Dylib.xm"
