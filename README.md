# Cut-tag-analysis-multimodal intergration
# Motif discovery in AP2-IV-3 CUT&Tag peaks

A Bash workflow for MEME-ChIP analysis of *Toxoplasma gondii* AP2-IV-3 peak sequences, followed by EPS-to-PNG conversion of motif logos.

## Requirements

- Linux or Ubuntu/WSL with Bash
- [MEME Suite](https://meme-suite.org/meme/doc/install.html) (`meme-chip` on `PATH`; original workflow used version 5.5.4)
- Perl JSON module and Ghostscript (`gs`)

On Ubuntu, install supporting dependencies with:

```bash
sudo apt install libjson-perl ghostscript
```

## Input and usage

Provide peak sequences in FASTA format. This workflow was configured for 250 bp sequences; input data are not included.

Download [`run_meme_chip.sh`](run_meme_chip.sh), then run:

```bash
INPUT_FASTA="/path/to/peaks.fa" \
OUTDIR="results/AP2IV-3" \
bash run_meme_chip.sh
```

Relative paths are resolved from the current working directory unless `WORKDIR` is set. Use a new output directory for each analysis; existing analysis folders are protected from overwriting.

To convert existing EPS logos without repeating motif discovery:

```bash
OUTDIR="results/AP2IV-3" bash run_meme_chip.sh --convert-only
```

PNG files are saved at 300 dpi beside the EPS originals in all output subfolders. Existing PNGs with matching names are replaced.

## Parameters

| Setting | Value |
| --- | --- |
| Alphabet | DNA |
| Central trimming | Disabled (`-ccut 0`) |
| Motif width | 4–15 bases |
| MEME occurrence model | ZOOPS: zero or one occurrence per sequence |
| Requested MEME motifs | 5 |

Other MEME-ChIP settings retain the installed version's defaults. No known-motif database is supplied.

## Results

Open `meme-chip.html` for the combined report and `meme_out/meme.html`, `streme_out/streme.html`, and `centrimo_out/` for component results. The combined table is `summary.tsv`.

Inspect significance statistics before interpreting motifs: requesting five motifs does not guarantee five significant findings. A header-only summary may reflect output filtering. Motif enrichment alone does not establish direct protein–DNA binding.

## Documentation and validation

See the [MEME-ChIP documentation](https://meme-suite.org/meme/doc/meme-chip.html) for defaults and methods, and cite the relevant tools listed in the generated reports when publishing results.

The script has passed a Bash syntax check. End-to-end execution of this portable version has not been validated on bundled test data; no test dataset is included.

