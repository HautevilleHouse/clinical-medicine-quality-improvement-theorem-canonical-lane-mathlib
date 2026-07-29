import ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean.QualityMetric

/-!
# Clinical Intervention Package
-/

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure ClinicalIntervention where
  armControl : Prop
  armIntervention : Prop
  randomization : Prop
  sampleSize : ℕ
  effectSize : ℝ
  pValue : ℝ
  confidenceInterval : ℝ × ℝ
  statisticallySignificant : Prop

def ClinicalInterventionClosed (I : ClinicalIntervention) : Prop :=
  I.statisticallySignificant

theorem clinical_intervention_closed_from_evidence (I : ClinicalIntervention) (h : I.statisticallySignificant) :
    ClinicalInterventionClosed I := h

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse
