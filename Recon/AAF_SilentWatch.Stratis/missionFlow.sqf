enableEnvironment false;
enableSentences false;
enableRadio false;

// Start animated briefing
handle = execVM "missionBriefing.sqf";

// Briefing done
waitUntil { sleep 1; scriptDone handle };

// Map closed
waitUntil { !visibleMap };
["EP_blackScreen", false] call BIS_fnc_blackOut;
handle = execVM "scripts\Intro.sqf";

// Car at drop point
waitUntil {sleep 1; (unitReady driver I_Car) };
handle = execVM "scripts\Phase_1.sqf";

// Phase 1 done
waitUntil { sleep 1; scriptDone handle };

handle = execVM "scripts\Phase_2.sqf";
