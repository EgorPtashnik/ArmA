sleep 1;

[ "Защитник",
  "Кинжал-1, окажите поддержку группе штурма. Приём.",
  0,
  "in3",
  false,
  true,
  "in4"
] spawn fnc_subtitles;
sleep 5;
[ "Кинжал-1",
  "Вас понял. Начинаю движение.",
  1,
  "in3",
  false,
  true,
  "in4"
] spawn fnc_subtitles;

apc limitSpeed 10;
apc setDriveOnPath [
	getMarkerPos "path_1",
	getMarkerPos "path_2",
	getMarkerPos "path_3",
	getMarkerPos "path_4",
	getMarkerPos "path_5",
	getMarkerPos "path_6",
	getMarkerPos "path_7",
	getMarkerPos "path_8",
	getMarkerPos "path_9",
	getMarkerPos "path_10",
	getMarkerPos "path_11",
	getMarkerPos "path_12",
	getMarkerPos "path_13",
	getMarkerPos "path_14",
	getMarkerPos "path_15",
	getMarkerPos "path_16",
	getMarkerPos "path_17",
	getMarkerPos "path_18",
	getMarkerPos "path_19",
	getMarkerPos "path_20",
	getMarkerPos "path_21",
	getMarkerPos "path_22",
	getMarkerPos "path_23",
	getMarkerPos "path_24",
	getMarkerPos "path_25",
	getMarkerPos "path_26",
	getMarkerPos "path_27",
	getMarkerPos "path_28",
	getMarkerPos "path_29",
	getMarkerPos "path_30",
	getMarkerPos "path_31"
];