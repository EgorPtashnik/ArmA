params [
	"_comm"
];

switch (_comm) do {
	case "intro-1": {
		[	"Viper",
			"Eagle-1, говорит Viper. Готовимся выступать к позиции противника. Приём.",
			0, "in2", false, true, "NONE" ] spawn fnc_subtitles;
	};
	case "intro-2": {
		[	"Eagle-1",
			"Принято, Viper. Задача прежняя - обнаружить и нейтрализовать любую технику в зоне. Конец связи.",
			0, "in2", false, true, "NONE" ] spawn fnc_subtitles;
	};
		
	case "located": {
		[	"Viper",
			"Техника обнаружена. Приступаю к выполнению задачи.",
			0, "in2", false, true, "NONE" ] spawn fnc_subtitles;
	};

	case "detected-1": {
		[	"Eagle-1",
			"Viper, мы перехватили радиосообщение противника. Они вызвали группу реагирования. Оринтировочное время прибытия...",
			0, "in2", false, true, "NONE" ] spawn fnc_subtitles;
	};
	case "detected-2": {
		[	"Eagle-1",
			"Пять минуты. Повторяю. Ожидайте противника в ближайшее время. При задержке отступайте. Как приняли?",
			0, "in2", false, true, "NONE" ] spawn fnc_subtitles;
	};
	case "detected-3": {
		[	"Viper",
			"Вас понял, Eagle-1. Ускоряемся. Конец связи.",
			0, "in2", false, true, "NONE" ] spawn fnc_subtitles;
	};

	case "fail_1": {
		[	"Eagle-1",
			"Viper, говорит Eagle-1. Отмена операции. Вражеские подкрепления на подходе. Возвращайтесь в точку эвакуации.",
			0, "in2", false, true, "NONE"
		] spawn fnc_subtitles;
	};

	case "destroy-1": {
		[	"Viper",
			"Техника уничтожена. Направляюсь к зоне эвакуации. Приём.",
			0, "in2", false, true, "NONE"
		] spawn fnc_subtitles;
	};

	case "ambush": {
		[	"Eagle-1",
			"Подождите. Вражеские подкрепления еще относительно далеко. Используйте эту возможность для засады.",
			0, "in2", false, true, "NONE"
		] spawn fnc_subtitles;
	};

	case "ambush-1": {
		[	"Viper",
			"Говорит Viper. Войска реагирования уничтожены",
			0, "in2", false, true, "NONE"
		] spawn fnc_subtitles;
	};

	case "retreat-1": {
		[	"Eagle-1",
			"Принято, Viper. По нашим данным к вам направляется вертолёт советов. Используйте Avenger и подбейте птичку. Приём.",
			0, "in2", false, true, "NONE"
		] spawn fnc_subtitles;
	};
	case "retreat-2": {
		[	"Viper",
			"Вас понял. Запрашиваю спутниковое сканирование позиции вертолета.",
			0, "in2", false, true, "NONE"
		] spawn fnc_subtitles;
	};
	case "retreat-3": {
		[	"Око",
			"Сканирование подтверждено. Проверьте GPS. Конец связи.",
			0, "in2", false, true, "NONE"
		] spawn fnc_subtitles;
	};

	case "extract-1": {
		[	"Viper",
			"Вертолёт противника уничтожен. Запрашиваю немедленную эвакуацию. А то сейчас сюда весь остров ринется. Приём.",
			0, "in2", false, true, "NONE"
		] spawn fnc_subtitles;
	};
	case "extract-2": {
		[	"Eagle-1",
			"Эвакуацию на подходе. Двигайтесь к точке сбора. Координаты переданы на GPS.",
			0, "in2", false, true, "NONE"
		] spawn fnc_subtitles;
	};
};
