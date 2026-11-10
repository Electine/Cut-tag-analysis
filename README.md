
# CUT&Tag AP2 motif analysis and multimodal integration

A reproducible motif-analysis workflow for *Toxoplasma gondii* AP2 transcription factors using CUT&Tag peaks linked to transcriptional responses by BETA.

The workflow uses MEME-ChIP to perform:

1. **General AP2 motif discovery** from BETA-associated CUT&Tag peaks.
2. **Differential motif analysis** comparing:
   - Activated vs Nonresponsive AP2-bound regions
   - Repressed vs Nonresponsive AP2-bound regions

Peak-centred sequences are analysed using MEME, STREME and CentriMo through MEME-ChIP.

## Environment

The original analysis was performed on Windows using WSL2 with Ubuntu.

MEME Suite version:

```bash
meme-chip -version
```

Original workflow:

```text
MEME Suite 5.5.4
```

### Starting WSL from Windows

From PowerShell or Git Bash, list installed WSL distributions:

```bash
wsl -l -v
```

The analysis was run using the distribution named:

```text
Ubuntu
```

Start it with:

```bash
wsl -d Ubuntu
```

All subsequent commands are run **inside Ubuntu**, not from the Windows shell.

## Requirements

The workflow requires:

- WSL2 / Linux / Ubuntu
- Bash
- MEME Suite
- Perl
- Python 3
- Ghostscript
- standard compilation and XML libraries required by MEME Suite

On Ubuntu, supporting dependencies can be installed with:

```bash
sudo apt update

sudo apt install -y \
  build-essential \
  perl \
  python3 \
  zlib1g-dev \
  ghostscript \
  libexpat1-dev \
  libxml-simple-perl \
  libjson-perl \
  wget
```

Check that the required MEME Suite programs are available:

```bash
meme-chip -version
streme --version
tomtom -version
```

If MEME Suite is already installed and these commands return valid versions, it does not need to be reinstalled.

For MEME Suite installation instructions, see the official MEME Suite documentation:

https://meme-suite.org/meme/doc/install.html

## Input sequences

CUT&Tag peaks were first linked to genes using BETA.

For motif analysis, fixed **250-bp genomic sequences centred on each BETA-associated union peak** were extracted from the *Toxoplasma gondii* ME49 ToxoDB Release 68 genome.

Input FASTA files are organised as:

```text
FASTA_250bp/
├── all_BETA_peaks/
└── motif_classes/
```

`all_BETA_peaks/` contains all BETA-associated peaks for each AP2.

`motif_classes/` contains peaks classified according to the transcriptional response of the associated gene:

```text
Activated
Repressed
Nonresponsive
Mixed
```

Mixed peaks are excluded from the primary differential motif analysis.

## General AP2 motif discovery

General AP2 binding motifs are identified using all BETA-associated peaks for each AP2.

Example:

```bash
meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -oc Meme_general_AP2IV-3 \
  all_BETA_peaks/AP2IV-3_all_BETA_peaks_250bp.fa
```

This analysis asks:

> Which sequence motifs are associated with AP2 occupancy?

## Differential motif analysis

Differential motif analysis compares transcriptionally responsive AP2-bound regions with AP2-bound regions that showed no significant transcriptional response.

For each AP2, two comparisons are performed:

```text
Activated vs Nonresponsive

Repressed vs Nonresponsive
```

The nonresponsive sequences are supplied to MEME-ChIP using `-neg`.

Example — Activated vs Nonresponsive:

```bash
meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2IV-3_Nonresponsive_250bp.fa \
  -oc Meme_differential_AP2IV-3/Activated_vs_Nonresponsive \
  motif_classes/AP2IV-3_Activated_250bp.fa
```

Example — Repressed vs Nonresponsive:

```bash
meme-chip \
  -dna \
  -ccut 0 \
  -minw 4 \
  -maxw 15 \
  -meme-mod zoops \
  -meme-nmotifs 5 \
  -neg motif_classes/AP2IV-3_Nonresponsive_250bp.fa \
  -oc Meme_differential_AP2IV-3/Repressed_vs_Nonresponsive \
  motif_classes/AP2IV-3_Repressed_250bp.fa
```

Differential analysis was performed for AP2s with sufficient numbers of transcriptionally responsive BETA-associated peaks:

```text
AP2III-1
AP2IV-3
AP2IX-9
AP2X-10
```

## MEME-ChIP parameters

| Setting | Value |
| --- | --- |
| Alphabet | DNA |
| Input sequence length | 250 bp |
| Central trimming | Disabled (`-ccut 0`) |
| Minimum motif width | 4 bp |
| Maximum motif width | 15 bp |
| MEME occurrence model | ZOOPS |
| Requested MEME motifs | 5 |
| Known motif database | None supplied |

The complete 250-bp peak-centred sequence is retained so that positional enrichment can subsequently be assessed using CentriMo.

## Motif-logo conversion

MEME Suite may produce EPS motif logos without successfully generating PNG versions in some WSL environments.

Ghostscript can be used to convert EPS logos to 300-dpi PNG files:

```bash
while IFS= read -r -d '' logo; do
  gs -dSAFER -dBATCH -dNOPAUSE -dEPSCrop \
    -sDEVICE=pngalpha \
    -r300 \
    -sOutputFile="${logo%.eps}.png" \
    "$logo"
done < <(find . -type f -name '*.eps' -print0)
```

PNG files are written beside the corresponding EPS files.

## MEME-ChIP output

Important outputs include:

```text
meme-chip.html
meme_out/meme.html
streme_out/streme.html
centrimo_out/
summary.tsv
```

MEME and STREME provide de novo motif discovery, while CentriMo evaluates positional enrichment of motifs within the peak-centred regions.

Motif significance and enrichment statistics should be evaluated before biological interpretation. The requested number of MEME motifs does not imply that all recovered motifs are statistically or biologically meaningful.

## Reproducibility

The repository contains the command-line workflow used for motif discovery.

Project-specific absolute paths and raw experimental data are intentionally excluded from the public repository. Users should provide their own FASTA inputs and output directories.

The original analysis was performed with MEME Suite v5.5.4 under Ubuntu/WSL2.
