case "Intro": {
    3 enableChannel false;
        sleep 3;
        [[
            ["Zeus", "All Minotaur elements, this is Zeus. European armor has breached Sector Echo. They are moving fast and hunting our remaining transport columns. You are the final wall.", 8, 6, "myin5"],
            ["Minotaur-Red", "Zeus, this is Minotaur-Red. We are dug in at the border checkpoint. What is the status of Gorgon's sector?", 6, 6, "myin2"],
            ["Gorgon-1", "Minotaur, Gorgon here. Our AA is still active. We will keep the sky clear, but the ground is all yours. Do not let them break that line.", 8, 6, "myin2"],
            ["Zeus", "Solid copy, Gorgon. Minotaur, you hold that line at all costs until I authorize the fallback. Break through, and the entire regiment is lost. Out.", 8, 6, "myin5"]
        ]] call EP_fnc_missionConversations;
    3 enableChannel true;
};
