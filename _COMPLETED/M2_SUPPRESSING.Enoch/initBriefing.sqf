// briefing.sqf - Executed on client side to build map screen information tabs

// ====================================================================================
// DIARY RECORDS (Tabs on the map screen)
// ====================================================================================


// Execution Plan
player createDiaryRecord ["Diary", [
    "Execution",
    "1. <font color='#00FF00'>HALO Drop:</font> Insert via stealth high-altitude parachute drop behind enemy lines.<br/>
    2. <font color='#00FF00'>Gather Squad:</font> Regroup at the designated rendezvous point immediately.<br/>
    3. <font color='#00FF00'>Infiltrate:</font> Advance 300 meters into the artillery base perimeter without raising a base-wide alert.<br/>
    4. <font color='#00FF00'>Sabotage:</font> Plant timed/remote IEDs on all primary artillery assets.<br/>
    5. <font color='#00FF00'>Extract:</font> Exfiltrate via the inbound helicopter."
]];

// Situation Details
player createDiaryRecord ["Diary", [
    "Situation",
    "Darkest night. Your Spetsnaz sabotage team, <font color='#00FFFF'>Ten-2</font>, is being dropped into the rear enemy lines under total darkness. <br/><br/>
    An enemy artillery battery is actively hammering frontline positions. Headed by <font color='#00FFFF'>Ten-1 (HQ)</font>, your primary objective is to sever this fire support network using IEDs. Keep your profile low, utilize your night vision, and leave no trace behind. <br/><br/>
    Be advised: The situation on the southern flank is deteriorating rapidly. Intel suggests mechanized elements are pushing hard, and you may be rerouted to support a medium-scale urban defense if friendly lines fracture."
]];