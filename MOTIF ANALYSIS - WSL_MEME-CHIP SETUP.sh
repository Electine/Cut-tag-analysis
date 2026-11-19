# =====================================================================
# Toxoplasma gondii AP2 CUT&Tag motif analysis
#
# MEME Suite v5.5.4
#
# This script performs:
#   1. General motif discovery using all BETA-associated peaks
#   2. Differential motif analysis:
#        Activated vs Nonresponsive
#        Repressed vs Nonresponsive
#   3. EPS-to-PNG conversion of motif logos
#
# Run from the directory containing:
#
#   all_BETA_peaks/
#   motif_classes/
#
# Individual sections can also be run separately.
# =====================================================================


# =====================================================================
# CHECK REQUIRED PROGRAMS
# =====================================================================

meme-chip -version
streme --version
tomtom -version
gs --version


# =====================================================================
# GENERAL AP2 MOTIF DISCOVERY
#
# Input:
#   all BETA-associated peaks for each AP2
#
# Question:
#   Which sequence motifs characterize AP2-bound regions?
# =====================================================================


# ---------------------------------------------------------------------
# AP2III-1
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2III-1

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2III-1 \
  all_BETA_peaks/AP2III-1_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2III-3
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2III-3

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2III-3 \
  all_BETA_peaks/AP2III-3_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2III-4
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2III-4

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2III-4 \
  all_BETA_peaks/AP2III-4_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2IV-2
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2IV-2

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2IV-2 \
  all_BETA_peaks/AP2IV-2_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2IV-3
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2IV-3

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2IV-3 \
  all_BETA_peaks/AP2IV-3_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2IX-1
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2IX-1

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2IX-1 \
  all_BETA_peaks/AP2IX-1_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2IX-3
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2IX-3

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2IX-3 \
  all_BETA_peaks/AP2IX-3_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2IX-9
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2IX-9

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2IX-9 \
  all_BETA_peaks/AP2IX-9_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2VI-3
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2VI-3

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2VI-3 \
  all_BETA_peaks/AP2VI-3_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2X-10
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2X-10

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2X-10 \
  all_BETA_peaks/AP2X-10_all_BETA_peaks_250bp.fa


# ---------------------------------------------------------------------
# AP2X-6
# ---------------------------------------------------------------------

mkdir -p Meme_general_AP2X-6

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2X-6 \
  all_BETA_peaks/AP2X-6_all_BETA_peaks_250bp.fa



# =====================================================================
# DIFFERENTIAL MOTIF ANALYSIS
#
# Only AP2s with sufficient responsive peak numbers were analysed:
#
#   AP2III-1
#   AP2IV-3
#   AP2IX-9
#   AP2X-10
#
# For each AP2:
#
#   Activated vs Nonresponsive
#   Repressed vs Nonresponsive
#
# The -neg file is always the NONRESPONSIVE peak set from the SAME AP2.
# The final FASTA argument is the primary responsive peak set.
# =====================================================================


# =====================================================================
# AP2III-1
# =====================================================================

mkdir -p Meme_differential_AP2III-1


# Activated vs Nonresponsive

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2III-1_Nonresponsive_250bp.fa \
  -o Meme_differential_AP2III-1/Activated_vs_Nonresponsive \
  motif_classes/AP2III-1_Activated_250bp.fa


# Repressed vs Nonresponsive

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2III-1_Nonresponsive_250bp.fa \
  -o Meme_differential_AP2III-1/Repressed_vs_Nonresponsive \
  motif_classes/AP2III-1_Repressed_250bp.fa



# =====================================================================
# AP2IV-3
# =====================================================================

mkdir -p Meme_differential_AP2IV-3


# Activated vs Nonresponsive

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2IV-3_Nonresponsive_250bp.fa \
  -o Meme_differential_AP2IV-3/Activated_vs_Nonresponsive \
  motif_classes/AP2IV-3_Activated_250bp.fa


# Repressed vs Nonresponsive

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2IV-3_Nonresponsive_250bp.fa \
  -o Meme_differential_AP2IV-3/Repressed_vs_Nonresponsive \
  motif_classes/AP2IV-3_Repressed_250bp.fa



# =====================================================================
# AP2IX-9
# =====================================================================

mkdir -p Meme_differential_AP2IX-9


# Activated vs Nonresponsive

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2IX-9_Nonresponsive_250bp.fa \
  -o Meme_differential_AP2IX-9/Activated_vs_Nonresponsive \
  motif_classes/AP2IX-9_Activated_250bp.fa


# Repressed vs Nonresponsive

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2IX-9_Nonresponsive_250bp.fa \
  -o Meme_differential_AP2IX-9/Repressed_vs_Nonresponsive \
  motif_classes/AP2IX-9_Repressed_250bp.fa



# =====================================================================
# AP2X-10
# =====================================================================

mkdir -p Meme_differential_AP2X-10


# Activated vs Nonresponsive

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2X-10_Nonresponsive_250bp.fa \
  -o Meme_differential_AP2X-10/Activated_vs_Nonresponsive \
  motif_classes/AP2X-10_Activated_250bp.fa


# Repressed vs Nonresponsive

meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2X-10_Nonresponsive_250bp.fa \
  -o Meme_differential_AP2X-10/Repressed_vs_Nonresponsive \
  motif_classes/AP2X-10_Repressed_250bp.fa



# =====================================================================
# CONVERT EPS MOTIF LOGOS TO PNG
#
# Ghostscript converts all EPS files produced by MEME Suite to
# 300-dpi PNG files.
# =====================================================================

while IFS= read -r -d '' logo; do

  gs -dSAFER -dBATCH -dNOPAUSE -dEPSCrop \
    -sDEVICE=pngalpha \
    -r300 \
    -sOutputFile="${logo%.eps}.png" \
    "$logo"

done < <(
  find . \
    -type f \
    -name '*.eps' \
    -print0
)
# =====================================================================
# Compare if motifs in repressed are simlar to activated 
tomtom \
  -thresh 0.1 \
  -oc AP2IV-3_Activated_vs_Repressed_Tomtom \
  Meme_differential_AP2_IV-3/Activated_vs_Nonresponsive/combined.meme \
  Meme_differential_AP2_IV-3/Repressed_vs_Nonresponsive/combined.meme

