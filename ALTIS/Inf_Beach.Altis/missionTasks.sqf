case "t1": {
	[_taskID, "attack"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Захватите <marker name='O_MrkOutpost'>береговой аванпост</marker> CSAT.", "Выбейте Противника"],
        "O_MrkOutpost",
        true
    ] call BIS_fnc_taskCreate;
};

case "t2": {
	[_taskID, "defend"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Вражеский отряд быстрого реагирования приближается. Удерживайте позицию любой ценой!", "Удерживайте Позицию"],
        "O_MrkOutpost",
        true
    ] call BIS_fnc_taskCreate;
};

case "t3": {
	[_taskID, "attack"] call EP_fnc_missionTasks;
    [
        player,
        _taskID,
        ["Вместе с отрядами Альфа и Браво штурмуйте вражеский <marker name='O_MrkBravo'>хаб с припасами</marker> и организуйте плацдарм для войск НАТО.", "Захватите Объект Браво"],
        "O_MrkBravo",
        true
    ] call BIS_fnc_taskCreate;
};