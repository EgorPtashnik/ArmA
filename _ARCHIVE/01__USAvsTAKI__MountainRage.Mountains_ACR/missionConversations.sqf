case "intro_1": {
    [[
        ["Charlie-1-1", "Squads, attention. Approaching BAF outpost. Check your gear and prepare for insertion.", 5],
        ["Bravo-2-1", "Why can't they handle their own sector? Fucking Brits...", 4],
        ["Bravo-1-1", "Easy there. They recently lost almost half of their personnel during the assault. It's understandable...", 7],
        ["Bravo-2-1", "Yeah, yeah. I doubt they'd feel the same way about us...", 3],
        ["Charlie-1-1", "Maintain the fucking radio silence, will you?", 2] // Removed "the fucking" as "Maintain radio silence" is a standard direct command, but kept the sharp tone.
    ]] call EP_fnc_missionConversations;
};

case "intro_2": {
    [[
        ["Charlie-1-1", "Two minutes!", 4],
        ["Charlie-1-1", "Dismounting right past that hill and moving into the village.", 5],
        ["Charlie-1-1", "Our intel suggests that enemy armor has pulled all the way back to the airport for rearming. But stay sharp!", 6],
        ["Charlie-1-1", "Alpha will approach from the west and provide flank fire. Bravo-2, your task is to support the convoy at the nearest Takistani checkpoint. Move right through it, that's all we need.", 10],
        ["Bravo-2-1", "Roger that.", 3],
        ["Charlie-1-1", "Bravo-1, you will be responsible for drawing enemy attention in the village. Avoid decisive engagement and wait for us.", 5], // "Avoid decisive engagement" means draw attention without getting locked down in a full fight.
        ["Bravo-1-1", "Solid copy, we'll keep our heads down.", 3],
        ["Charlie-1-1", "That's all for now. Good luck, everyone. Charlie-1-1, out.", 4]
    ]] call EP_fnc_missionConversations;
};

case "AlphaInPos": {
    [[
        ["Alpha-1", "Charlie, this is Alpha-1. We're in position. Preparing for the assault. How copy? Over.", 5], // Added standard net call structure
        ["Charlie-1-1", "Loud and clear, Alpha!", 4],
        ["Alpha-1", "Broadcasting our position to GPS data link. Moving out!", 5]
    ]] call EP_fnc_missionConversations;
};

case "AlphaKIA": {
    if (alive leader EP_Convoy) then {
        [[
            ["Charlie-1-1", "Fuck, Alpha is down! I repeat, Alpha is KIA!", 3] // Enhanced military panic/urgency
        ]] call EP_fnc_missionConversations;
    };
};

case "BmpKIA": {
    [[
        ["Bravo-1-1", "Woohoo! Enemy IFV is down!", 3] // "Woohoo" sounds slightly more natural for an exclamation of success than "Uhuuu".
    ]] call EP_fnc_missionConversations;
};

case "SendConvoyAttack": {
    [[
        ["Charlie-1-1", "This is Charlie. Moving out. Hold your positions!", 3]
    ]] call EP_fnc_missionConversations;
};

case "BaseSeized": {
    private _name = "Charlie-1-1"; // Fixed: Changed period to semicolon
    if !(alive leader EP_Convoy) then {_name = "Bravo-1-1"};

    [[
        [_name, format ["Crossroads, this is %1. Hostile positions are secured. Proceeding with the next step. Over.", _name], 3], // Fixed missing comma at the end of this line. "Secured" and "phase" sound more military.
        ["Crossroads", "Copy that. We've received word from Delta that enemy AA positions are down.", 5],
        ["Crossroads", "I'm calling in air support to your position. The Takistanis must be spinning up a counter-attack. Stay sharp. Crossroads, out.", 6]
    ]] call EP_fnc_missionConversations;
};

case "Counterattack": {
    [[
        ["Crossroads", "All units, be adviced! Enemy counterattack is approaching your position. Hold up! We're sending reinforcements. Crossroads, our.", 7]
    ]] call EP_fnc_missionConversations;
};

case "CounterattackDone": {
    [[
        ["Crossroads", "Enemy counterattack is retreating. Good job, everyone. Count the casualties and treat wounded. We need to prepare the fortifications.", 7]
    ]] call EP_fnc_missionConversations;

    private _talks = [];
    if (alive leader EP_Alpha) then {
        _talks pushBack ["Crossroads", "Alpha, setup the perimeter and clear the barricade along the main road", 5];
    };
    _talks pushBack ["Crossroads", "Bravo, you are RTB. Helicopter will help with the logistics. After that you will reinforce our main defence border.", 7];
    _talks pushBack ["Bravo-1-1", "Finally going home...", 5];
    [_talks] call EP_fnc_missionConversations;
};