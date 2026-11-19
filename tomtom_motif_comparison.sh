#!/usr/bin/env bash
set -e

# Tomtom motif comparison
# Run this script from the folder containing Activated_vs_Nonresponsive
# and Repressed_vs_Nonresponsive.

# These are the motifs discovered by MEME-ChIP.
activated="Activated_vs_Nonresponsive/combined.meme"
repressed="Repressed_vs_Nonresponsive/combined.meme"

# Replace these three example filenames with the paths to your reference files.
toxoplasma="custom_Tg_ApiAP2.meme"
plasmodium="Campbell_Pf_ApiAP2.meme"
jaspar="JASPAR_CORE.meme"

# 1. Compare the Activated motifs with the Repressed motifs.
tomtom -thresh 0.1 -o Activated_vs_Repressed \
  "$activated" "$repressed"

# 2. Compare the Activated motifs with the curated T. gondii ApiAP2 motifs.
tomtom -thresh 0.1 -o Activated_vs_Tg_ApiAP2 \
  "$activated" "$toxoplasma"

# 3. Compare the Activated motifs with the Campbell P. falciparum ApiAP2 motifs.
tomtom -thresh 0.1 -o Activated_vs_Campbell_ApiAP2 \
  "$activated" "$plasmodium"

# 4. Compare the Activated motifs with JASPAR CORE.
tomtom -thresh 0.1 -o Activated_vs_JASPAR \
  "$activated" "$jaspar"

# 5. Optional exploratory JASPAR search.
# The four comparisons above use a q-value threshold of 0.1.
# This broader search uses an E-value threshold of 10 for inspection only.
# To run it, remove the leading # from the command below.
# tomtom -evalue -thresh 10 -o Activated_vs_JASPAR_exploratory "$activated" "$jaspar"
