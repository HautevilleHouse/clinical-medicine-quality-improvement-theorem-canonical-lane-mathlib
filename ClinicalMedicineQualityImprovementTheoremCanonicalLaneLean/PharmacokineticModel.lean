import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure PharmacokineticModelPackage where
  drugCompound : Type
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationHalfLife : Prop
  clearance : Prop
  dosageRegimen : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationHalfLifeClosed : P.eliminationHalfLife
  clearanceClosed : P.clearance
  dosageRegimenClosed : P.dosageRegimen

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationHalfLife ∧
  P.clearance ∧ P.dosageRegimen

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage)
    (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationHalfLifeClosed
        (And.intro E.clearanceClosed E.dosageRegimenClosed)))

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse