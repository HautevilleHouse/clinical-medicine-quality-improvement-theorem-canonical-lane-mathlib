import ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ClinicalEvidenceClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse
