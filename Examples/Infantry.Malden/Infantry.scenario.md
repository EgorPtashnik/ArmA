# Example Infantry Mission
## Technical Requirement
    - Mission must be dynamic with multiple objectives using generations of enemy troops
    - Number of enemy encounters (min - max): 3 - 5
    - Objective is created for each generated encounter
    - Gameplay is infantry combat only
    - Player must start at semi-random base
    - Depending on base player's route should be adjusted

## Steps
1. Create player bases to start from: place some vehicles, static AI units playing different animations based on their state. All vehicles must be locked (or better set as simple objectsб use BIS_fnc_replaceWithSimpleObject). Setup some patrols accordinally.
2. Create ammunition zone with predefined weapons and grenades in boxes.
3. Setup tables with lying weapons on it (weapons should be different from such in boxes).
4. Create mission intro (black screen into world with music and typeText, also add some bluring)
5. Setup starting script about radio conversation from HQ telling the player about activity in the area and requesting a patrol.
6. Handle dynamic location for player
7. Proceed with phases section

## Phases
### Phase 1
    1. Radio conversation about setuping cars for patrol.
    2. AI moves to cars (two hammers, 1st with Machine Gun, 2nd with big cargo)
        a. Create optional task [TASK_1]: prepare your gear for the patrol
        b. AI units (drivers and gunner) move to cars and drive to base exit
    3. [<=2b] AI soldiers move to cats cargo
    4. [<=3]
        a. Create task [TASK_2] to get in car and start patrol
        b. Radio about patrol ready to move
    5. [<=4]Player moves to 2nd car cargo
    6. [<=5]
        a. Complete TASK_1 without notification
        b. Complete TASK_2 with notification
        c. Create new task [TASK_3] to patrol the area
    7. Proceed to phase 2

### Phase 2
    1. Set patrol direction markers alpha to 1
    2. Radio conversation about current route. If possible open map and show small animation with markers.
    3. Setup flags for dynamic generation of enemy, execute scripts for dynamic handling
    4. Proceed to phase 3

### Phase 3
    During patroling encounter several enemy setups. For each new task will be destroy these groups. Think about counter attacks.
    After completing all 

