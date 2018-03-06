// See http://iphonedevwiki.net/index.php/Logos

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
    NSString *identifier_;    // 8 = 0x8
    int max_upgrades_;    // 16 = 0x10
    NSString *state_key_;    // 24 = 0x18
    int state_;    // 32 = 0x20
    int unlock_cost_;    // 36 = 0x24
    int rarity_;    // 40 = 0x28
    int damage_type_;    // 44 = 0x2c
    int preview_enemy_;    // 48 = 0x30
    int zen_mode_;    // 52 = 0x34
    int weapon_level_;    // 56 = 0x38
    int primary_level_;    // 60 = 0x3c
    int secondary_level_;    // 64 = 0x40
    int times_played_;    // 68 = 0x44
    int enemies_destroyed_;    // 72 = 0x48
    long long integer_id_;    // 80 = 0x50
    NSArray *weapon_upgrades_;    // 88 = 0x58
    NSArray *primary_upgrades_;    // 96 = 0x60
    NSArray *secondary_upgrades_;    // 104 = 0x68
    NSString *range_indicator_;    // 112 = 0x70
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

%hook Phoenix2Ship
//
//- (id)copyWithState:(int)arg1 weaponLevel:(int)arg2 primaryLevel:(int)arg3 secondaryLevel:(int)arg4 timesPlayed:(int)arg5 enemiesDestroyed:(int)arg6
//{
//    %log;
//    return %orig;
//}
//
- (id)initWithIdentifier:(id)arg1 integerID:(long long)arg2 unlockCost:(long long)arg3 weaponUpgrades:(id)arg4 primaryUpgrades:(id)arg5 secondaryUpgrades:(id)arg6 rangeIndicator:(id)arg7 rarity:(int)arg8 damageType:(int)arg9 zenMode:(int)arg10 previewEnemy:(int)arg11
{
    %log;
    return %orig;
}
//
%end

%hook Phoenix2GameViewController

//- (void)resumeGameOfUser:(id)arg1 withReviveToken:(id)arg2
//{
//    %log;
//    %orig;
//}
- (void)createNewScoreAndStartNewGameOfUser:(id)arg1 withShip:(Phoenix2Ship *)arg2
{
//    *(int*)(arg2+0x38) = 6;
//    *(int*)(arg2+0x3c) = 6;
//    *(int*)(arg2+0x40) = 6;
    %log;
    NSLog(@"%@(%@) weaponLevel=%d,primaryLevel=%d,secondaryLevel=%d", [arg2 localizedName], [arg2 identifier], arg2.weaponLevel, arg2.primaryLevel, arg2.secondaryLevel);
    %orig(arg1, arg2);
}
//- (void)scoreDidNotUpload:(id)arg1 error:(id)arg2
//{
//    %log;
//    %orig;
//}
//- (id)finalizeScore:(struct GameResults)arg1
//{
//    id r = %orig;
//    NSLog(@"finalizeScore:  score=%d,zen_ability_activated=%d,signature=%s, r=%@", arg1.score, arg1.zen_ability_activated, arg1.signature.c_str(), r);
//    return r;
//}
//- (void)startGameOfUser:(id)arg1 withShip:(id)arg2
//{
//    %log;
//    %orig;
//}
//- (void)menuController:(id)arg1 startGameOfUser:(id)arg2 withSelectedShip:(id)arg3
//{
//    %log;
//    %orig;
//}
//- (void)adWillStart
//{
//    [self adDidFinish];
//}
//- (void)menuControllerControllerDidFinishAd:(id)arg1
//{
//    %log;
//    %orig;
//}
//- (void)menuControllerControllerWillShowAd:(id)arg1
//{
//    %log;
//    %orig;
//}
//- (void)stageResultsViewControllerDidFinishAd:(id)arg1
//{
//    %log;
//    %orig;
//}
//- (void)stageResultsViewControllerWillShowAd:(id)arg1
//{
//    %log;
//    %orig;
//}

%end

%hook Phoenix2Score

//- (void)addToken:(id)arg1
//{
//    %log;
//    %orig;
//}
//- (id)initScoreOfUser:(id)arg1 scoreID:(int)arg2 name:(id)arg3 score:(int)arg4 rank:(int)arg5 ship:(long long)arg6 wavesBeaten:(int)arg7 time:(double)arg8 playerLevel:(int)arg9 playerShips:(int)arg10 playerUpgrades:(int)arg11 weaponLevel:(int)arg12 primaryLevel:(int)arg13 secondaryLevel:(int)arg14
//{
//    %log;
//    return %orig;
//}
//- (id)initScoreOfUser:(id)arg1 scoreID:(int)arg2 stage:(id)arg3 name:(id)arg4 score:(int)arg5 ship:(long long)arg6 wavesBeaten:(int)arg7 time:(double)arg8 waveTimes:(long long)arg9
//{
//    %log;
//    return %orig;
//}
- (id)initScoreOfUser:(id)arg1 forStage:(id)arg2 usingShip:(Phoenix2Ship *)arg3
{
    %log;
    Phoenix2Ship *ship = [arg3 copyWithState:arg3.state
                                 weaponLevel:arg3.weaponLevel
                                primaryLevel:arg3.primaryLevel
                              secondaryLevel:arg3.secondaryLevel
                                 timesPlayed:arg3.timesPlayed
                            enemiesDestroyed:arg3.enemiesDestroyed];
    NSLog(@"%@(%@) weaponLevel=%d,primaryLevel=%d,secondaryLevel=%d", [ship localizedName], [ship identifier], ship.weaponLevel, ship.primaryLevel, ship.secondaryLevel);
    id r = %orig(arg1, arg2, ship);
    MSHookIvar<int>(arg3, "damage_type_") = 1;//0无护甲暴击、1装甲完全伤害、2高护盾有效
    MSHookIvar<int>(arg3, "weapon_level_") = 6;
    MSHookIvar<int>(arg3, "primary_level_") = 6;
    MSHookIvar<int>(arg3, "secondary_level_") = 6;
//    MSHookIvar<NSString*>(arg3, "range_indicator_") =  @"range.indicator.blade.storm.level1";
//    MSHookIvar<NSString*>(arg3, "identifier_") =  @"player_ship_68";
//    MSHookIvar<long long>(arg3, "integer_id_") = 68;
    NSLog(@"HACK %@(%@) weaponLevel=%d,primaryLevel=%d,secondaryLevel=%d", [arg3 localizedName], [arg3 identifier], arg3.weaponLevel, arg3.primaryLevel, arg3.secondaryLevel);
    return r;
}

%end
