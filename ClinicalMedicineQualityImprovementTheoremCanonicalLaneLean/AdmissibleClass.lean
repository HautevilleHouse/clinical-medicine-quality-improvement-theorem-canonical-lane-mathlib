import ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedClinicalObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ClinicalEvidenceClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse
