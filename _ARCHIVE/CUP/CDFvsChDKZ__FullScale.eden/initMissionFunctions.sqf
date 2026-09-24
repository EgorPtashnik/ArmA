//Get classes to spawn based on "type"
fn_getClasses = {
    params ["_side", "_type", ["_classes", []]];
    switch _type do {
        case "ASSAULT": {
            if (_side == OPFOR) then { _classes = ["rhsgref_ins_grenadier", "rhsgref_ins_grenadier", "rhsgref_ins_rifleman_akm", "rhsgref_ins_rifleman_akm", "rhsgref_ins_medic", "rhsgref_ins_arifleman_rpk"] }
            else { _classes = ["rhsgref_cdf_b_reg_squadleader", "rhsgref_cdf_b_reg_grenadier", "rhsgref_cdf_b_reg_grenadier", "rhsgref_cdf_b_reg_medic", "rhsgref_cdf_b_reg_arifleman_rpk"] };
        };

        case "AT": {
            if (_side == OPFOR) then { _classes = ["rhsgref_ins_medic", "rhsgref_ins_rifleman_aks74", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_rifleman_RPG26", "rhsgref_ins_rifleman_akm"] }
            else { _classes = ["rhsgref_cdf_b_reg_rifleman_aks74", "rhsgref_cdf_b_reg_rifleman_rpg75", "rhsgref_cdf_b_reg_rifleman_rpg75", "rhsgref_cdf_b_reg_rifleman_rpg75"] };
        };

        case "AA": {
            if (_side == OPFOR) then { _classes = ["rhsgref_ins_rifleman_aksu", "rhsgref_ins_specialist_aa", "rhsgref_ins_specialist_aa", "rhsgref_ins_medic", "rhsgref_ins_rifleman_aks74"] }
            else { _classes = ["rhsgref_cdf_b_reg_squadleader", "rhsgref_cdf_b_reg_specialist_aa", "rhsgref_cdf_b_reg_specialist_aa", "rhsgref_cdf_b_reg_machinegunner"] };
        };

        case "LIGHT": {
            if (_side == OPFOR) then { _classes = ["rhsgref_BRDM2_ins"] }
            else { _classes = ["rhsgref_cdf_b_btr60", "rhsgref_BRDM2_b"] };
        };

        case "MEDIUM": {
            if (_side == OPFOR) then { _classes = ["rhsgref_ins_bmp1", "rhsgref_ins_btr70","rhsgref_ins_btr60"] }
            else { _classes = ["rhsgref_cdf_b_btr70", "rhsgref_cdf_b_btr80"] };
        };

        case "HEAVY": {
            if (_side == OPFOR) then { _classes = ["rhsgref_ins_t72ba", "UK3CB_O_T55_CHK"] }
            else { _classes = ["rhsgref_cdf_b_t72ba_tv", "UK3CB_B_T55_CDF"] };
        };

        default {
            if (_side == OPFOR) then { _classes = ["rhsgref_ins_rifleman_akm", "rhsgref_ins_rifleman", "rhsgref_ins_rifleman", "rhsgref_ins_spotter", "rhsgref_ins_rifleman_aks74", "rhsgref_ins_spotter"] }
            else { _classes = ["rhsgref_cdf_b_reg_squadleader", "rhsgref_cdf_b_reg_arifleman_rpk", "rhsgref_cdf_b_reg_medic", "rhsgref_cdf_b_reg_rifleman_akm", "rhsgref_cdf_b_reg_rifleman_akm"] };
        };
    };

    _classes
};

//Spawns infantry group depedning on typeL ASSAULT, AA, AT, DEFAULT
fn_createInfantry = {
    params ["_pos", "_side"];
    private _type = "DEFAULT";
    private _radius = 0;
    {
        if (_x isEqualType "string")    then { _type = _x; continue };
        if (_x isEqualType 0)           then { _radius = _x; continue };
    } forEach _this;

    _pos = [_pos, _radius] call EP_fnc_getRandomPosition;
    private _classes = [_side, _type] call fn_getClasses;
    private _group = [_pos, _side, _classes] call EP_fnc_createGroup;

    _group
};

//Spawns Vehicle: LIGHT, MEDIUM, HEAVY
fn_createVehicle = {
    params ["_pos", "_side"];
    private _type = "DEFAULT";
    private _radius = 0;
    {
        if (_x isEqualType "string")    then { _type = _x; continue };
        if (_x isEqualType 0)           then { _radius = _x; continue };
    } forEach _this;

    _pos = [_pos, _radius] call EP_fnc_getRandomPosition;
    private _class = selectRandom ([_side, _type] call fn_getClasses);
    private _veh = [_pos, _side, _class] call EP_fnc_createVehicle;

    //Remove rocket for BMP-1
    if (_class == "rhsgref_ins_bmp1") then {
        [
            _veh,
            ["chedaki",1], ["crate_l1_unhide",1,"crate_l2_unhide",1,"crate_l3_unhide",1,"crate_r1_unhide",1,"crate_r2_unhide",1,"crate_r3_unhide",1,"wood_1_unhide",1,"maljutka_hide_source",1]
        ] call BIS_fnc_initVehicle;
    };

    _veh
};