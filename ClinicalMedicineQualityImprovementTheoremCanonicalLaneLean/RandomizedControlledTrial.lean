import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure RandomizedControlledTrialPackage where
  sampleSize : Nat
  randomizationMethod : String
  blindingScheme : String
  primaryOutcome : String
  attritionRate : Prop
  intentionToTreat : Prop

structure RandomizedControlledTrialEvidence (R : RandomizedControlledTrialPackage) where
  attritionRateClosed : R.attritionRate
  intentionToTreatClosed : R.intentionToTreat

def RandomizedControlledTrialClosed (R : RandomizedControlledTrialPackage) : Prop :=
  R.attritionRate ∧ R.intentionToTreat

theorem randomized_controlled_trial_closed_from_evidence
    (R : RandomizedControlledTrialPackage)
    (E : RandomizedControlledTrialEvidence R) : RandomizedControlledTrialClosed R := by
  exact And.intro E.attritionRateClosed E.intentionToTreatClosed

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse