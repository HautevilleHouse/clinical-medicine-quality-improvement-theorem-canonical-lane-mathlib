import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  volumeDistribution : Float -> Float
  eliminationRate : Float
  absorptionRate : Float
  dosingRegimen : Float -> Float

structure CompartmentPharmacokineticsPackage where
  model : CompartmentModel
  initialConcentration : Float -> Float
  concentrationOverTime : Float -> Float -> Prop
  closedFormSolution : Prop
  steadyStateReached : Prop

structure CompartmentPharmacokineticsEvidence (P : CompartmentPharmacokineticsPackage) where
  concentrationOverTimeClosed : P.concentrationOverTime
  closedFormSolutionClosed : P.closedFormSolution
  steadyStateReachedClosed : P.steadyStateReached

def CompartmentPharmacokineticsClosed (P : CompartmentPharmacokineticsPackage) : Prop :=
  P.concentrationOverTime ∧ P.closedFormSolution ∧ P.steadyStateReached

theorem compartment_pharmacokinetics_closed_from_evidence
    (P : CompartmentPharmacokineticsPackage) (E : CompartmentPharmacokineticsEvidence P) :
    CompartmentPharmacokineticsClosed P := by
  exact And.intro E.concentrationOverTimeClosed (And.intro E.closedFormSolutionClosed E.steadyStateReachedClosed)

end ClinicalMedicineQualityImprovementTheoremCanonicalLaneLean
end HautevilleHouse