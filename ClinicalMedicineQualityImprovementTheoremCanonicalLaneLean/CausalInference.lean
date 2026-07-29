import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure CausalModel where
  confoundingControl : Prop
  treatmentEffect : Prop
  instrumentalVariable : Prop
  propensityScore : Prop
  doseResponse : Prop

def CausalModelClosed (C : CausalModel) : Prop :=
  C.confoundingControl ∧ C.treatmentEffect ∧
  C.instrumentalVariable ∧ C.propensityScore ∧
  C.doseResponse

structure CausalModelEvidence (C : CausalModel) where
  confoundingControlClosed : C.confoundingControl
  treatmentEffectClosed : C.treatmentEffect
  instrumentalVariableClosed : C.instrumentalVariable
  propensityScoreClosed : C.propensityScore
  doseResponseClosed : C.doseResponse

theorem causal_model_closed_from_evidence (C : CausalModel)
    (E : CausalModelEvidence C) : CausalModelClosed C := by
  exact And.intro E.confoundingControlClosed
    (And.intro E.treatmentEffectClosed
      (And.intro E.instrumentalVariableClosed
        (And.intro E.propensityScoreClosed E.doseResponseClosed)))

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse