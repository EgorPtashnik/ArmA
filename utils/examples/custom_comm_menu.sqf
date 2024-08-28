/**
	part in description.ext
	class CfgCommunicationMenu {
	class paradrop
	{
		text = "Call Paratroopers";		// Text displayed in the menu and in a notification
		submenu = "#USER:MENU_COMMS_1";	// Submenu opened upon activation (expression is ignored when submenu is not empty.)
		expression = "";	// Code executed upon activation
		icon = "\A3\ui_f\data\map\markers\nato\respawn_para_ca.paa";				// Icon displayed permanently next to the command menu
		cursor = "\A3\ui_f\data\map\markers\nato\respawn_para_ca.paa";				// Custom cursor displayed when the item is selected
		enable = "1";					// Simple expression condition for enabling the item
		removeAfterExpressionCall = 1;	// 1 to remove the item after calling
	};
};
 */


MENU_COMMS_1 =
[
	// First array: "User menu" This will be displayed under the menu, bool value: has Input Focus or not.
	// Note that as of version Arma 3 1.05, if the bool value is set to false, Custom Icons will not be displayed.
	["MenuName", false],
	// Syntax and semantics for following array elements:
	// ["Title_in_menu", [assigned_key], "Submenu_name", CMD, "expression",script-string, "isVisible", "isActive" (, optional icon path)]
	// Title_in_menu: string that will be displayed for the player
	// Assigned_key: 0 - no key, 1 - escape key, 2 - key-1, 3 - key-2, ... , 10 - key-9, 11 - key-0, 12 and up... the whole keyboard
	// Submenu_name: User menu name string (eg "#USER:MY_SUBMENU_NAME" ), "" for script to execute.
	// CMD: (for main menu:) CMD_SEPARATOR -1; CMD_NOTHING -2; CMD_HIDE_MENU -3; CMD_BACK -4; (for custom menu:) CMD_EXECUTE -5
	// script-string: command to be executed on activation. (_target=CursorTarget,_pos=CursorPos)
	// isVisible - Boolean 1 or 0 for yes or no, - or optional argument string, eg: "CursorOnGround"
	// isActive - Boolean 1 or 0 for yes or no - if item is not active, it appears gray.
	// optional icon path: The path to the texture of the cursor, that should be used on this menuitem.
	["Teleport", [2], "", -5, [["expression", "player setPos _pos;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Kill Target", [3], "", -5, [["expression", "_target setDamage 1;"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Disabled", [4], "", -5, [["expression", ""]], "1", "0"],
	["Submenu", [5], "#USER:MENU_COMMS_2", -5, [], "1", "1"]
];

MENU_COMMS_2 =
[
	["Submenu", false],
	["Option 1", [2], "", -5, [["expression", "hint 'Option 1';"]], "1", "1"],
	["Option 2", [3], "", -5, [["expression", "hint 'Option 2';"]], "1", "1"],
	["Option 3", [4], "", -5, [["expression", "hint 'Option 3';"]], "1", "1"]
];