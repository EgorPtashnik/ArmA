"убрать скрипт посадки вертолетов"
//_heli setVariable ["ahdnc_disable", true, true];

"Убрать Death and Hit reactions"
/**
this setVariable ["WBK_DAH_DisableAnim_Death",1]; - for death animations
this setVariable ["WBK_DAH_DisableAnim_Hit",1]; - for hit reactions
 */


"Веревками с вертолета"
/** 
You can customize which classes of vehicles support rappelling by setting the AR_SUPPORTED_VEHICLES_OVERRIDE variable in an init.sqf file.

AR_SUPPORTED_VEHICLES_OVERRIDE = [ "CUP_CH47F_base", "RHS_CH_47F" ];

The example above will only allow rappelling from vehicles of class CUP_CH47F_base and RHS_CH_47F.

You can disable shooting whlie rappelling by setting the AR_DISABLE_SHOOTING_OVERRIDE varaible in an init.sqf file. Defaults to false (shooting enabled).

AR_DISABLE_SHOOTING_OVERRIDE = true;

You can limit the number of rappell positions (for all helicopters) using the AR_MAX_RAPPEL_POINTS_OVERRIDE variable in an init.sqf file. Defaults to 6. You can set any value from 1 to 6.

AR_MAX_RAPPEL_POINTS_OVERRIDE = 2;

You can define custom rappel points instead of using the default 6 rappel points by using the AP_CUSTOM_RAPPEL_POINTS variable. You can either specify [x,y,z] model positions or memory point names. Define the AP_CUSTOM_RAPPEL_POINTS variable in your init.sqf file. See https://github.com/sethduda/AdvancedRappelling/blob/master/README.md for an example of how to do this.

You can have AI auto-rappel from a helicopter using the following script (all units in the cargo seats will rappel):

[HELI_NAME] call AR_Rappel_All_Cargo

This function will rappel the cargo units at 25m at the heli's current position. If the heli is currently moving, it will stop so units can rappel.

If you want more control, there are addtional parameters you can set:

[HELI_NAME,RAPPEL_HEIGHT,POSITION_ASL] call AR_Rappel_All_Cargo

RAPPEL_HEIGHT: height in meters to rappel
POSITION_ASL: Exact position ASL where you want the units to rappel to. This script will get them within ~1m of that position.
*/