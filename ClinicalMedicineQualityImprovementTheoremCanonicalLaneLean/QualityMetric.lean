import ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean.SurvivalAnalysis

/-!
# Quality Metric Package
-/

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure QualityMetric where
  patientOutcome : ℝ
  hospitalReadmission : ℝ
  mortalityRate : ℝ
  qualityIndex : ℝ
  improvementTarget : Prop

def QualityMetricClosed (Q : QualityMetric) : Prop :=
  Q.improvementTarget

theorem quality_metric_closed_from_evidence (Q : QualityMetric) (h : Q.improvementTarget) :
    QualityMetricClosed Q := h

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse
