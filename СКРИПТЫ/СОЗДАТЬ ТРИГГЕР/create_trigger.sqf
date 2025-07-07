// CREATE TRIGGER
//trigger area cleared
_trg = createTrigger ["EmptyDetector", [7639,6221]];
_trg setTriggerArea [100, 100, 0, false];
_trg setTriggerActivation ["EAST", "NOT PRESENT", false];
_trg setTriggerStatements ["this", "BIS_SuppliSeize = true", ""];
_trg setTriggerTimeout [5, 10, 7, false];
