spawn {

    private _pos = getPos cursorTarget;

    
    EP_APC doWatch _pos; 
    
    sleep 5; 
    
    spawn { 
        for "_i" from 1 to 20 do { 
            sleep 0.3; 
            [EP_APC, "CUP_Vacannon_2A42_BMP2"] call BIS_fnc_fire; 
        }; 
    }; 
    
    spawn { 
        for "_i" from 1 to 50 do { 
            sleep 0.1; 
            [EP_APC, "CUP_Vhmg_PKT_veh_Noeject"] call BIS_fnc_fire; 
        }; 
    };

};

getPos cursorTarget