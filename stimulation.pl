% ======================================================================
% SELF-DRIVING CAR DECISION SIMULATION (Extended Version)
% ======================================================================

% --- 1. SENSORS & STATE MANAGEMENT ---
:- dynamic(traffic_light/1).  
:- dynamic(obstacle_distance/1).  
:- dynamic(current_speed/1).  
:- dynamic(road_condition/1). % Added: rain, snow, or clear

% Initialize a default safe state
traffic_light(green).
obstacle_distance(100).
current_speed(0).
road_condition(clear).

% --- 2. DECISION RULES (THE BRAIN) ---
% Priority 1: Critical Safety (Emergency Braking)
decide_action(emergency_brake) :-
    obstacle_distance(Dist),
    Dist < 15,
    current_speed(Speed),
    Speed > 0.

% Priority 2: Traffic Signals
decide_action(stop_for_red_light) :-
    traffic_light(red).

decide_action(yield_and_caution) :-
    traffic_light(flashing_yellow).

decide_action(decelerate_for_yellow) :-
    traffic_light(yellow).

% Priority 3: Speed Regulation & Obstacles
decide_action(reduce_speed_limit_exceeded) :-
    current_speed(Speed),
    Speed > 100. % Max speed limit

decide_action(decelerate_for_obstacle) :-
    obstacle_distance(Dist),
    Dist >= 15, Dist =< 50,
    current_speed(Speed),
    Speed > 30.

decide_action(adjust_for_bad_weather) :-
    road_condition(Condition),
    Condition \= clear,
    current_speed(Speed),
    Speed > 50.

% Priority 4: Stationary States
decide_action(wait_for_clearance) :-
    obstacle_distance(Dist),
    Dist < 10,
    current_speed(0).

% Priority 5: Normal Operation
decide_action(maintain_speed) :-
    traffic_light(green),
    obstacle_distance(Dist),
    Dist > 50.

% Default Catch-all
decide_action(stay_idle) :- true.

% --- 3. SIMULATION ENGINE ---
simulate_step(Light, Distance, Speed, Weather, Action) :-
    retractall(traffic_light(_)),
    retractall(obstacle_distance(_)),
    retractall(current_speed(_)),
    retractall(road_condition(_)),
    
    assertz(traffic_light(Light)),
    assertz(obstacle_distance(Distance)),
    assertz(current_speed(Speed)),
    assertz(road_condition(Weather)),
    
    % Find the first matching action (Prolog's cut '!' can be used here for efficiency)
    decide_action(Action), !.

% --- 4. TEST SCENARIOS ---
run_scenario(Name, Light, Distance, Speed, Weather) :-
    simulate_step(Light, Distance, Speed, Weather, Action),
    format('--- Scenario: ~w ---~n', [Name]),
    format('Sensors  -> Light: ~w | Dist: ~wm | Speed: ~w km/h | Road: ~w~n', 
           [Light, Distance, Speed, Weather]),
    format('Decision -> **~w**~n~n', [Action]).

run_all_tests :-
    run_scenario('Heavy Rain/High Speed', green, 150, 70, rain),
    run_scenario('Intersection Yield', flashing_yellow, 100, 40, clear),
    run_scenario('Speeding on Highway', green, 200, 120, clear),
    run_scenario('Pedestrian in Road', green, 8, 30, clear),
    run_scenario('Stopped behind Truck', green, 4, 0, clear),
    run_scenario('Standard Green Drive', green, 80, 50, clear).

% --- 5. EXECUTION ENTRY POINT ---
:- initialization(main).

main :- 
    run_all_tests,
    halt.
