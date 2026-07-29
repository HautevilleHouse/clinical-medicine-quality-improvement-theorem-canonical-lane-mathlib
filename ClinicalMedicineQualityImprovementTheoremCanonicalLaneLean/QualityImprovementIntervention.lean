import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure QualityImprovementInterventionPackage where
  interventionType : String
  implementationProtocol : Prop
  outcomeMeasure : String
  statisticalProcessControl : Prop
  sustainabilityPlan : Prop

structure QualityImprovementInterventionEvidence (Q : QualityImprovementInterventionPackage) where
  implementationProtocolClosed : Q.implementationProtocol
  statisticalProcessControlClosed : Q.statisticalProcessControl
  sustainabilityPlanClosed : Q.sustainabilityPlan

def QualityImprovementInterventionClosed (Q : QualityImprovementInterventionPackage) : Prop :=
  Q.implementationProtocol ∧ Q.statisticalProcessControl ∧ Q.sustainabilityPlan

theorem quality_improvement_intervention_closed_from_evidence
    (Q : QualityImprovementInterventionPackage)
    (E : QualityImprovementInterventionEvidence Q) : QualityImprovementInterventionClosed Q := by
  exact And.intro E.implementationProtocolClosed
    (And.intro E.statisticalProcessControlClosed E.sustainabilityPlanClosed)

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse