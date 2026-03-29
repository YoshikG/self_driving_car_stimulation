# Selfdriving_car_stimulation

Human-Centric Self-Driving Car Simulation (Prolog)
A sophisticated autonomous vehicle simulation built in Prolog that mimics human-like reasoning and logic-based decision-making.

# Overview : 

This repository contains a symbolic AI simulation environment for autonomous vehicles (AVs). Unlike black-box neural networks, this project uses declarative logic to process environmental data and execute maneuvers based on a formal set of traffic rules and safety heuristics.

# Key Features :

1)Rule-Based Decision Making: Encodes complex traffic laws and safety constraints into a logical expert system.                  
2)Symbolic Environmental Processing: Maps roads, intersections, and hazards as discrete predicates, allowing the AI to "understand" its surroundings.            
3)Deterministic Hazard Avoidance: Uses logical deduction to ensure safe braking and maneuvering the moment an obstacle is detected.                
4)Backtracking Pathfinding: Leverages Prolog’s native search capabilities to find optimal routes through a dynamic road network.                        
5)Human-Like Logic: Mimics the "if-then" heuristic reasoning humans use when navigating complex four-way stops or yielding scenarios.                          

# How It Works:
The environment is defined by a database of dynamic facts, while the car's behavior is governed by a set of inference rules. The core engine continuously evaluates the action/1 predicate, querying the knowledge base to determine the safest and most efficient move based on the current state.

## Technologies:
Language : Prolog (SWI-Prolog recommended)           
Paradigm : Declarative Logic Programming                     
Interface : Text-based / Console-driven state visualization

## How to Run :
Windows: Download from the SWI-Prolog website.         
Mac: brew install swi-prolog        
Linux: sudo apt install swi-prolog        

## Load the Project
Open your terminal and run: swipl main.pl
