## Tomtom motif comparison

De novo motifs from Activated and Repressed AP2-bound regions were compared using Tomtom and screened against known reference motif collections.

### Activated versus Repressed

```bash
tomtom \
  -thresh 0.1 \
  -oc Activated_vs_Repressed_Tomtom \
  Activated_vs_Nonresponsive/combined.meme \
  Repressed_vs_Nonresponsive/combined.meme
```

### Reference databases

Reference comparisons included:

- a custom literature-curated *T. gondii* ApiAP2 motif set;
- the Campbell *P. falciparum* ApiAP2 PBM collection;
- JASPAR CORE non-redundant motifs.

Example:

```bash
tomtom \
  -thresh 0.1 \
  -oc Tomtom_reference \
  Activated_vs_Nonresponsive/combined.meme \
  reference_database.meme
```

Primary motif matches were evaluated at:

```text
q-value <= 0.1
```

For exploratory inspection only, broader JASPAR similarities were also examined using:

```bash
tomtom \
  -evalue \
  -thresh 10 \
  -oc Tomtom_reference_exploratory \
  Activated_vs_Nonresponsive/combined.meme \
  JASPAR_CORE.meme
```

Exploratory E-value-filtered matches were not considered statistically significant motif assignments.
