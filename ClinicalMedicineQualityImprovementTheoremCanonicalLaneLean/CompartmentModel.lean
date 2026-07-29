import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure CompartmentModel where
  drugDose : ℝ
  absorptionRate : ℝ
  distributionVolume : ℝ
  eliminationRate : ℝ
  plasmaConcentration : ℝ → ℝ
  initialCondition : plasmaConcentration 0 = 0
  absorptionDefined : absorptionRate > 0
  eliminationDefined : eliminationRate > 0
  distributionDefined : distributionVolume > 0

structure CompartmentModelEvidence (C : CompartmentModel) where
  absorptionClosed : C.absorptionRate > 0
  eliminationClosed : C.eliminationRate > 0
  distributionClosed : C.distributionVolume > 0

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.absorptionRate > 0 ∧ C.eliminationRate > 0 ∧ C.distributionVolume > 0

theorem compartment_model_closed_from_evidence (C : CompartmentModel) (E : CompartmentModelEvidence C) : CompartmentModelClosed C :=
  And.intro E.absorptionClosed (And.intro E.eliminationClosed E.distributionClosed)

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse