# Changes in Mathlib between v4.10.0 and v4.21.0-rc3 affecting FltRegular/NumberTheory/QuotientTrace.lean

## Summary

The main change is that much of the functionality from your `QuotientTrace.lean` file has been upstreamed to Mathlib as `Mathlib.RingTheory.Trace.Quotient` in v4.21.0-rc3. This new file contains many of the same lemmas and theorems that you implemented.

## Specific Changes

### 1. New File Added to Mathlib
- **`Mathlib.RingTheory.Trace.Quotient`**: This new file contains:
  - `Algebra.trace_quotient_mk` (equivalent to your implementation)
  - `equivQuotMaximalIdealOfIsLocalization` (same as yours)
  - `quotMapEquivQuotMapMaximalIdealOfIsLocalization` (same as yours)
  - `trace_quotient_eq_trace_localization_quotient` (same as yours)
  - `Algebra.trace_quotient_eq_of_isDedekindDomain` (the main theorem from your file)

### 2. Module/File Structure Changes
- `LinearAlgebra.FiniteDimensional` has been split into multiple files:
  - `LinearAlgebra.FiniteDimensional.Basic`
  - `LinearAlgebra.FiniteDimensional.Defs`
  - `LinearAlgebra.FiniteDimensional.Lemmas`
- Additional LinearAlgebra files added:
  - `LinearAlgebra.Dimension.ErdosKaplansky`
  - `LinearAlgebra.Dimension.Subsingleton`
  - `LinearAlgebra.Dimension.Torsion.Basic`
  - `LinearAlgebra.Dimension.Torsion.Finite`
  - `LinearAlgebra.FreeModule.Int`
  - `LinearAlgebra.FreeModule.ModN`
  - `LinearAlgebra.FreeModule.Finite.CardQuotient`
  - `LinearAlgebra.FreeModule.Finite.Quotient`

### 3. LocalRing Changes
- A new file `Mathlib.RingTheory.LocalRing.Quotient` has been added containing:
  - `IsLocalRing.quotient_span_eq_top_iff_span_eq_top` (was `quotient_span_eq_top_iff_span_eq_top_of_localRing` in your file)
  - `IsLocalRing.finrank_quotient_map` (was `finrank_quotient_map_of_localRing` in your file)  
  - `IsLocalRing.basisQuotient` (was `basisQuotientOfLocalRing` in your file)
  - `IsLocalRing.basisQuotient_apply` (was `basisQuotientOfLocalRing_apply` in your file)
  - `IsLocalRing.basisQuotient_repr` (was `basisQuotientOfLocalRing_repr` in your file)
- Old names are deprecated with aliases provided

### 4. API Changes

#### Lemma Name Changes:
- `Module.finite_def`: Still exists and works the same way
- `leftMulMatrix_apply`: Still exists, no changes
- `basisOfTopLeSpanOfCardEqFinrank`: Still exists, no changes
- `IsDedekindDomain.isDedekindDomainDvr`: Changed from a `theorem` to an `instance`
- `Module.Finite_of_isLocalization`: Still exists (note the capital F)
- `IsLocalization.mk'_eq_zero_iff`: Still exists, no changes
- `Module.free_of_finite_type_torsion_free'`: Still exists, no changes

#### Naming Convention Changes:
- Functions in `IsLocalRing` namespace no longer have `_of_localRing` suffix
- Some deprecation aliases are provided for backward compatibility

### 5. Import Changes
No changes to the import paths you're using - all imports remain valid.

### 6. Trace API
- `Algebra.trace` and `Algebra.intTrace`: No significant changes to the API
- The trace quotient functionality has been formalized in the new `RingTheory.Trace.Quotient` file

### 7. Localization API
No significant changes to the localization API that would affect your code.

## Recommendations

1. **Consider removing duplicate code**: Since much of your `QuotientTrace.lean` functionality is now in Mathlib, you could:
   - Import `Mathlib.RingTheory.Trace.Quotient` and `Mathlib.RingTheory.LocalRing.Quotient`
   - Remove the duplicate definitions and theorems
   - Keep only the parts that are specific to your FltRegular project

2. **Update naming conventions**: If you want to align with the new Mathlib conventions:
   - Change `basisQuotientOfLocalRing` to `IsLocalRing.basisQuotient`
   - Change `finrank_quotient_map_of_localRing` to `IsLocalRing.finrank_quotient_map`
   - Change `quotient_span_eq_top_iff_span_eq_top_of_localRing` to `IsLocalRing.quotient_span_eq_top_iff_span_eq_top`

3. **Fix the instance usage**: Change references to `IsDedekindDomain.isDedekindDomainDvr` from theorem application to instance inference.

4. **No urgent changes needed**: Your code should still compile with v4.21.0-rc3, but updating to use the upstreamed versions would reduce code duplication and maintenance burden.