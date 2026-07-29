import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure CoxProportionalHazardsPackage where
  survivalData : Type
  covariates : List String
  proportionalHazardsAssumption : Prop
  coxModelFit : Prop
  hazardRatioEstimates : Prop

structure CoxProportionalHazardsEvidence (C : CoxProportionalHazardsPackage) where
  proportionalHazardsAssumptionClosed : C.proportionalHazardsAssumption
  coxModelFitClosed : C.coxModelFit
  hazardRatioEstimatesClosed : C.hazardRatioEstimates

def CoxProportionalHazardsClosed (C : CoxProportionalHazardsPackage) : Prop :=
  C.proportionalHazardsAssumption ∧ C.coxModelFit ∧ C.hazardRatioEstimates

theorem cox_proportional_hazards_closed_from_evidence (C : CoxProportionalHazardsPackage)
    (E : CoxProportionalHazardsEvidence C) : CoxProportionalHazardsClosed C := by
  exact And.intro E.proportionalHazardsAssumptionClosed
    (And.intro E.coxModelFitClosed E.hazardRatioEstimatesClosed)

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse