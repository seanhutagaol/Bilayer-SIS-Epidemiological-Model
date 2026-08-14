# Epidemiological-Actuarial Dynamics of COVID-19: Awareness-Driven Insurance Uptake, Emergent Limit Cycles, and Optimal Control

This repository features a data-calibrated, bilayer epidemiological-actuarial model that captures how awareness-driven insurance uptake generates nonlinear epidemic limit cycles, and deploys optimal control theory to design cost-effective public health interventions constrained by healthcare capacity and market solvency.

## Objective
To analyze the stability and bifurcation structure of a bilayer COVID-19 model, using numerical simulations to investigate emergent limit cycles, behavioral awareness thresholds ($i_c$), and optimal insurer subsidy strategies via nonlinear programming (`fmincon`).

## Repository Files
* `main.m` - The master execution script running the end-to-end pipeline (Data Calibration $\rightarrow$ Parameter Sweeps $\rightarrow$ Bifurcation Analysis $\rightarrow$ Optimal Control).
* `covid.csv` - The empirical incidence dataset used for baseline parameter estimation and bootstrapping.
* `functions/` - The core mathematical engine containing the ODE system, constraints, and objective functionals for the control theory solver.
* `Simulation_Results.pdf` — Compiled simulation figures, including model trajectories, emergent limit cycles, and solvency-related results.

## ⚠️ Copyright and Usage

> **© 2026 Sean Felix Fefri Hutagaol. All Rights Reserved.**
> 
> This repository contains code associated with a manuscript currently under academic review. The source code is made available for inspection and evaluation only. No permission is granted to copy, modify, redistribute, or use the code for other purposes without prior written permission from the author.
