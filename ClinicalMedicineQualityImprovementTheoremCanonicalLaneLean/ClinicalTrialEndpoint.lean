import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure ClinicalTrialEndpoint where
  treatmentGroup : Set ℕ
  controlGroup : Set ℕ
  outcomeDifference : ℝ
  pValue : ℝ
  significanceLevel : ℝ
  endpointReached : Prop
  pValueValid : 0 ≤ pValue ∧ pValue ≤ 1
  significanceValid : 0 < significanceLevel ∧ significanceLevel < 1

structure ClinicalTrialEndpointEvidence (E : ClinicalTrialEndpoint) where
  endpointReachedClosed : E.endpointReached
  pValueBelowSignificance : E.pValue < E.significanceLevel

def ClinicalTrialEndpointClosed (E : ClinicalTrialEndpoint) : Prop :=
  E.endpointReached ∧ E.pValue < E.significanceLevel

theorem clinical_trial_endpoint_closed_from_evidence (E : ClinicalTrialEndpoint) (Ev : ClinicalTrialEndpointEvidence E) : ClinicalTrialEndpointClosed E :=
  And.intro Ev.endpointReachedClosed Ev.pValueBelowSignificance

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse