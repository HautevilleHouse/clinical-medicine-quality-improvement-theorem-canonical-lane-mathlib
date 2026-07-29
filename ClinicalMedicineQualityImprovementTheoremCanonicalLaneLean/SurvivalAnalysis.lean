import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure CoxModel where
  hazardFunction : ℝ → ℝ
  baselineHazard : ℝ → ℝ
  covariates : List ℝ
  regressionCoefficients : List ℝ
  proportionalHazardsAssumption : Prop
  linearPredictor : ℝ
  covariatesNonempty : covariates ≠ []
  coefficientsMatch : covariates.length = regressionCoefficients.length

structure CoxModelEvidence (C : CoxModel) where
  proportionalHazardsClosed : C.proportionalHazardsAssumption
  linearPredictorComputed : C.linearPredictor = C.regressionCoefficients.zipWith (· * ·) C.covariates |>.sum

def CoxModelClosed (C : CoxModel) : Prop :=
  C.proportionalHazardsAssumption ∧ C.linearPredictor = C.regressionCoefficients.zipWith (· * ·) C.covariates |>.sum

theorem cox_model_closed_from_evidence (C : CoxModel) (E : CoxModelEvidence C) : CoxModelClosed C :=
  And.intro E.proportionalHazardsClosed E.linearPredictorComputed

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse