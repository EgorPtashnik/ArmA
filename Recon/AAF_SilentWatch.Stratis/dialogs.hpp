////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Admin, v1.063, #Guvuvy)
////////////////////////////////////////////////////////
class EP_ChoiceDialog
{
    idd = 1;
    movingeable = false;
    
    class controls
    {
        class EP_ChoiceDialog_Frame: RscFrame
        {
            idc = 1800;
            x = 0.075;
            y = 0.04;
            w = 0.85;
            h = 0.92;
        };
        class EP_ChoiceDialog_Text: RscText
        {
            idc = 1000;
            text = "Choose your role..."; //--- ToDo: Localize;
            x = 0.2125;
            y = 0.04;
            w = 0.6;
            h = 0.14;
            sizeEx = 4 * GUI_GRID_H;
        };
        class EP_ChoiceDialog_Sniper: RscButton
        {
            idc = 1600;
            text = "Sniper"; //--- ToDo: Localize;
            x = 0.1;
            y = 0.8;
            w = 0.4;
            h = 0.12;
            sizeEx = 3 * GUI_GRID_H;
        };
        class EP_ChoiceDialog_QRF: RscButton
        {
            idc = 1601;
            text = "QRF"; //--- ToDo: Localize;
            x = 0.5;
            y = 0.8;
            w = 0.4;
            h = 0.12;
            sizeEx = 3 * GUI_GRID_H;
        };
        class RscPicture_1200: RscPicture
        {
            idc = 1200;
            text = "pic\1.jpg";
            x = 0.1;
            y = 0.2;
            w = 0.4;
            h = 0.6;
        };
        class RscPicture_1201: RscPicture
        {
            idc = 1201;
            text = "pic\2.jpg";
            x = 0.5;
            y = 0.2;
            w = 0.4;
            h = 0.6;
        };

    }
}
