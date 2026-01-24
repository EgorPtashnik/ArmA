private ["_objects"];
_objects = (getMissionLayerEntities "InsertionCombat" # 0) + (getMissionLayerEntities "ObjectsAmbient" # 0) + (getMissionLayerEntities "2_KillAPCs" # 0) + (units grpEastAmbush) + [oMember_1, oMember_2, oMember_3];
{deleteVehicle _x} forEach _objects;
