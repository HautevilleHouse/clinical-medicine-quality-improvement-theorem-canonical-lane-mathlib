import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure DiagnosticTest where
  sensitivity : ℝ
  specificity : ℝ
  prevalence : ℝ
  positivePredictiveValue : Prop
  negativePredictiveValue : Prop
  sensitivityInRange : 0 ≤ sensitivity ∧ sensitivity ≤ 1
  specificityInRange : 0 ≤ specificity ∧ specificity ≤ 1
  prevalenceInRange : 0 ≤ prevalence ∧ prevalence ≤ 1

structure DiagnosticTestEvidence (D : DiagnosticTest) where
  ppvComputed : D.positivePredictiveValue
  npvComputed : D.negativePredictiveValue

def DiagnosticTestClosed (D : DiagnosticTest) : Prop :=
  D.positivePredictiveValue ∧ D.negativePredictiveValue

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTest) (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D :=
  And.intro E.ppvComputed E.npvComputed

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse