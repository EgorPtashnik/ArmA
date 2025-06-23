params ["_comm"];
private _handle = objNull;
switch (_comm) do {
	case "intro": {
		_handle = [
			"Браво",
			"Папа Медведь, как слышно? Говорит Браво. Я последний выживший. В данный момент нахожусь около Шапоя. Текущий план - украсть машину противника и оступить к кордону наших сил. Приём."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
		sleep 1;
		_handle = [
			"Папа Медведь",
			"Принято, Браво. По нашим разведданным в Шапое присутствуют пехотные патрули противника, но техники замечено не было. Осторожней там и доложите, когда украдете машину. Приём."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
		sleep 1;
		_handle = [
			"Браво",
			"Вас понял. Приступаю к выполнению задачи. Конец связи."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};

	case "contact": {
		_handle = [
			"Браво",
			"Вражеский патруль меня обнаружил. Вступаю в контакт с противником!"
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};

	case "incar": {
		_handle = [
			"Браво",
			"Папа Медведь, как слышно? Нашел автомобиль. Начинаю выдвигаться к вашим позиция. Не подстрелите меня! Приём."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle;};
		sleep 1;
		_handle = [
			"Папа Медведь",
			"Вас понял, Браво. Передаю информацию на кордон. Не застрелим, не бойся. Конец связи."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};

	case "carDamaged": {
		_handle = [
			"Браво",
			"Блядь! Папа Медведь, видимо машина повреждена! Буду искать способ поставить ее на ноги."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};

	case "echo": {
		_handle = [
			"Эхо",
			"Папа Медведь, говорит Эхо. Несем тяжелые потери, ведем бой недалеко от Ла Ривьеры. Проси помощи! Как слышно?"
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
		_handle = [
			"Папа Медведь",
			"Слышу вас, Эхо. Браво, направляйтесь к их позиции и заберите оттуда. Время не на нашей стороне. Как поняли? Приём."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
		_handle = [
			"Браво",
			"Вас понял, Папа Медведь. Постараюсь сделать все возможное. Конец связи"
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};

	case "echoKIA": {
		_handle = [
			"Папа Медведь",
			"Говорит Папа Медведь. Группа Эхо была уничтожена. Отступайте. Конец связи."
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};

	case "echoSaved": {
		_handle = [
			"Командир Эхо",
			"Рад видеть тебя, Браво. Внимание всем! Собирайте свои монатки и давайте сваливать отсюда! Что там с раненым?",
			1
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
		_handle = [
			"Медик Эхо",
			"Умер, Сержант. К сожалению кровотечение было слишком сильным",
			1
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
		_handle = [
			"Командир Эхо",
			"Тогда всем подъем. Быстро в машину!",
			1
		] spawn pf_subs;
		waitUntil { sleep 1; scriptDone _handle; };
	};
};
