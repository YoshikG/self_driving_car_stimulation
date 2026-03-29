# Selfdriving_car_stimulation

Human-Centric Self-Driving Car Simulation (Prolog)
A sophisticated autonomous vehicle simulation built in Prolog that mimics human-like reasoning and logic-based decision-making.

## Overview
This repository contains a **Symbolic AI simulation** environment for autonomous vehicles (AVs). Unlike "black-box" neural networks, this project uses **Declarative Logic** to process environmental data. The car executes maneuvers based on a formal set of traffic laws and safety heuristics, making every decision 100% explainable and transparent.

##  Key Features
* **Rule-Based Decision Making:** Encodes real-world traffic laws (Red/Yellow/Green/Flashing signals) into a logical expert system.
* **Weather-Adaptive Logic:** Features a `road_condition/1` sensor that forces the AI to decelerate during rain or snow.
* **Deterministic Hazard Avoidance:** Prioritizes emergency braking over all other actions when an obstacle is within a critical distance .
* **Priority-Weighted Inference:** Uses the Prolog **Cut operator (!)** to ensure critical safety rules override secondary rules like speed limits.
* **Human-Like Logic:** Mimics the "if-then" heuristic reasoning humans use when navigating complex four-way stops or yielding scenarios.

##  How It Works
The environment is defined by a database of **dynamic facts**, while the car's behavior is governed by **inference rules**. 

1.  **Sensing:** The system gathers data on lights, distance, speed, and weather.
2.  **Reasoning:** The Prolog engine queries the `decide_action/1` predicate.
3.  **Selection:** It searches the knowledge base top-to-bottom, selecting the highest-priority safety match.
4.  **Action:** The simulation outputs a specific command (e.g., `emergency_brake`, `yield_and_caution`).

##  Technologies
* **Language:** Prolog (SWI-Prolog recommended)
* **Paradigm:** Declarative Logic Programming
* **Interface:** Text-based / Console-driven state visualization
* **State Management:** Dynamic predicates (`assertz`, `retractall`)

---

##  Installation & Running

### 1. Prerequisites
Install **SWI-Prolog** based on your OS:
* **Windows:** Download from the [Official Website](https://www.swi-prolog.org/).
* **Mac:** `brew install swi-prolog`
* **Linux:** `sudo apt install swi-prolog`


##  Test Scenarios
The simulation automatically evaluates the following high-stakes scenarios:
* **Heavy Rain:** Deceleration check for poor road conditions.
* **Intersection Yield:** Logic for flashing yellow lights.
* **Speeding Control:** Automatic reduction if speed $> 100$ km/h.
* **Pedestrian Step-out:** Critical emergency braking override.
* **Stationary Traffic:** Safe idling logic when blocked.
