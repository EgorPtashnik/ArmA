case "EP_Intro": {
    [[
        [Comms_Player, "Overwatch, я Cobra. Мы на исходной, начинаем выдвижение к точке Альфа. Прием.", 2],
        [Comms_HQ, "Вас понял, Cobra. Напоминаю: режим полной скрытности. Объект должен быть доставлен живым. Мы следим за вами. Конец связи.", 2]
    ], true] call EP_fnc_comms;
};

case "EP_Start": {
    [[
        [Comms_Player, "Так, парни, выдвигаемся. Соблюдать скрытность, огонь не открывать.", 2]
    ], false] call EP_fnc_comms;
};

case "Camp01Clear": {
    [[
        [Comms_Player, "Overwatch, я Cobra. Закрыли точку Альфа. Информации нет, жду указаний. Прием.", 4],
        [Comms_HQ, "Принято. Продвигайтесь к точке Браво. Не компроментируйте себя. В этом лагере больше часовых. Как приняли? Прием.", 2],
        [Comms_Player, "Вас понял, Overwatch. Работаем. Конец связи.", 2]
    ], true] call EP_fnc_comms;
};

case "Camp02Clear": {
    [[
        [Comms_Player, "Overwatch, прием. Зачистили второй лагерь.", 4],
        [Comms_HQ, "Хорошо. Обыщите территорию. Ищите любые свидетельства Package. Мы на связи.", 2]
    ], true] call EP_fnc_comms;
};

case "FoundHVTLocation": {
    [[
        [Comms_Player, "Кажется я что-то нашел, секунду...", 6],
        [Comms_Player, "Да, это оно! Overwatch, я Cobra. Локация объекта установлена. 600 метров к северу от нашей текущей позиции. Жду указаний. Прием.", 6],
        [Comms_HQ, "Отличная работа, Cobra! Даю разрешение на огонь на поражение. Немедленно выдвигайтесь туда. Объект должен выжить! Как приняли?", 2],
        [Comms_Player, "Принял отлично, Overwatch. Выдвигаемся! Cobra, конец связи.", 2]
    ], true] call EP_fnc_comms;
};

case "HVTSecured": {
    [[
        [Comms_Player, "Overwatch, я Cobra. Package у нас. Необходима эвакуация, высылайте Raven. Как приняли? Прием.", 4],
        [Comms_HQ, "Вас понял, Cobra. Ждите.", 6],
        [Comms_Raven, "Cobra, это Raven. Выдвигаемся к точке эвакуации. ETA - 5 минут. Прием.", 4],
        [Comms_Player, "Вас понял. Overwatch, Raven, Cobra выдвигается к точке эвакуации. Конец связи.", 2]
    ], true] call EP_fnc_comms;
};

case "Extracted": {
    [[
        [Comms_Raven, "Overwatch, я Raven. Package у нас. Выдвигаемся на базу.", 1]
    ], true] call EP_fnc_comms;
};

//***************
//Misc
//***************
case "Misc_Clear": {
    [[
        [Comms_Player, "Чисто.", 2]
    ], false] call EP_fnc_comms;
};