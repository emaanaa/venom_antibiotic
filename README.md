# Venom Antibiotic Discovery — R Reproduction

This project reproduces part of the analysis from:

> Guan C, Torres MDT, Li S, de la Fuente-Nunez C. **Computational exploration of global venoms for antimicrobial discovery with Venomics artificial intelligence.** 
> *Nature Communications* 16, 6446 (2025). 
> https://doi.org/10.1038/s41467-025-60051-6

The paper used AI to screen venom-derived peptides for antibiotic potential, 
then validated top candidates in mouse infection experiments. This repo focuses 
on reproducing **Figure 4c** — bacterial burden (CFU) in infected mice across 
six treatment groups, measured on Day 2 and Day 4.

## What this repo contains

- `mouse_infection_analysis.R` — full analysis script: loads the paper's 
  supplementary source data, reshapes it into tidy format, visualizes bacterial 
  burden by treatment group, and runs t-tests comparing each treatment against 
  the untreated control
- `venom_source_data.xlsx` — source data for the paper's figures, from the 
  paper's supplementary materials (Nature Communications, CC BY-NC-ND 4.0)

## What's reproduction vs. original

- The **data and the core finding** (venom-derived peptide UniprotKB-7 reduces 
  bacterial burden vs. control) belong to the paper's authors — this is a 
  reproduction, not a new discovery
- The **R code, the six-group comparison plot with individual data points, and 
  the summary statistics table** are my own independent work, written to learn R

## Key result

A Welch two-sample t-test comparing Control vs. UniprotKB-7-treated mice on 
Day 2 showed a statistically significant reduction in bacterial burden 
(p = 0.043). The Day 4 comparison showed a larger absolute difference in means 
but was not statistically significant (p = 0.099), likely due to high variance 
in Control group counts by that timepoint.

## Tools

R, tidyverse (dplyr, ggplot2, tidyr), readxl
