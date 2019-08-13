% Bob remembers Fact ∴ remember(Bob, Fact)
% ∴ LO(s, f) ≡ ∃s,f[goal(s, remember(f))]
% ∧ learn(s, remember(f), s0, s1) → do(taught(s, remember(f)):assessment(s, remember(f)), s0, s1) → remember(s, f, s1)
% teaches(LR, remember(f)) ∨ assesses(a, remember(f)).

% Bob recalls Fact ∴ dispostion(Bob, remember, Fact) ∧ realizes(recall(Bob, Fact), disposition(Bob, remember, Fact)) ∧ concretizes(recall(Bob, Fact), Fact).
% instanceOf(disposition(Bob, remember, Fact), RememberingFactDisposition) ∧ instanceOf(recall(Bob, Fact), RecallingFactProcess)
% So Blooms verbs can denote types of processes that realize the main 5 verbs (dispositions) in the taxonomy...


% ∃graded.Grade ⊑ ∃concretizes.GDC
% ∃about.Knowledge ⊑ ∃concretizes.GDC

% Grade ⊑ GDC ⊓ ∃grades.Capability
% CognitiveLevel ⊑ Grade ⊓ ∃concretizedIn.CognitiveCapability
% ∀{Remembering, Understanding, Applying, Evaluating, Creating} ⊑ CognitiveLevel.

% Capability             ⊑ Disposition            ⊓ ∃graded.Grade
% CognitiveCapability    ⊑ Capability             ⊓ ∃graded.CognitiveLevel ⊓ ∃about.Knowledge
% CapabilityToRemember   ⊑ CognitiveCapability    ⊓ ∃graded.Remembering
% CapabilityToUnderstand ⊑ CapabilityToRemember   ⊓ ∃graded.Understanding
% CapabilityToApply      ⊑ CapabilityToUnderstand ⊓ ∃graded.Applying
% CapabilityToEvaluate   ⊑ CapabilityToApply      ⊓ ∃graded.Evaluating
% CapabilityToCreate     ⊑ CapabilityToEvaluate   ⊓ ∃graded.Creating
%
% TeachingQuality ⊑ Quality ⊓ ∃graded.CognitiveLevel ⊓ ∃about.Knowledge ⊓ ∃qualityOf.TeachingArtifact
% PracticeQuality ⊑ Quality ⊓ ∃graded.CognitiveLevel ⊓ ∃about.Knowledge ⊓ ∃qualityOf.ExerciseArtifact
% AssessmentQuality ⊑ Quality ⊓ ∃graded.CognitiveLevel ⊓ ∃about.Knowledge ⊓ ∃qualityOf.AssessmentArtifact
%
% Recall ≡ Process ⊓ ∃realizes.CapabilityToRemember
% Teaching ⊑ Process ⊓ ∃hasParticipant.∃hasQuality.TeachingQuality
% Practice ⊑ Process ⊓ ∃hasParticipant.∃hasQuality.PracticeQuality
% Assessment ⊑ Process ⊓ ∃hasParticipant.∃hasQuality.AssessmentQuality
% SuccessfulAssessment ⊑ Assessment ⊓ ∃realizes.CognitiveCapability
