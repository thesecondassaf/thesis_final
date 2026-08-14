# Weaken Divisorial Ramification Lemmas Implementation Plan

> **Execution rule:** Carry out one task at a time. After each task, build the thesis, show the exact edited passages, and wait for the user's approval before continuing.

**Goal:** Remove unsupported numerical upper-ramification bounds at higher-dimensional divisors, while preserving all active arguments using only unramifiedness and tameness there. Classical numerical upper ramification remains confined to closed points of the original curve, where the residue field is perfect.

**Mathematical architecture:** For a general codimension-one point, use the elementary DVR definition of tame/unramified ramification. Relate it to characters only through ordinary inertia and wild inertia, which exist over arbitrary residue fields and do not require Abbes--Saito. Use classical upper numbering only after specializing to a closed curve point. All local rings completed in the argument arise from schemes of finite type over a field and are therefore excellent.

**Constraints:**

- Do not introduce Abbes--Saito or any imperfect-residue numerical filtration.
- Do not define “ramification bounded by \(r\) at \((Z,\xi)\)” for a general prime divisor.
- Preserve existing labels where possible.
- Edit only files included by `main.tex`; report inactive duplicates separately.
- Preserve all unrelated and user-owned changes.

---

### Task 1: Fix the chapter scope and add the general local dictionary

**Files:**

- Modify: `sections/RamificationAfterBlowupIntroduction.tex:1-70`
- Modify: `sections/Preliminaries/GTorsorRamification.tex:1-175`

**Outcome:** The chapter explicitly separates the positive-characteristic numerical theory from the arbitrary-residue tame theory, and every later character proof has a valid general-divisor dictionary.

- [ ] **Step 1: State the field and characteristic scope once**

  At the start of the chapter, state that \(k\) is perfect. After the torsor theorem, dispose of characteristic zero: by the DVR definition every finite separable extension is tame when the residue characteristic is zero, so the theorem is immediate there. For the remainder of the ramification-bound calculation, write \(\operatorname{char}(k)=p>0\).

  This makes the later uses of \(p\), the perfectness of \(\kappa(P)\), and the equal-characteristic upper filtration explicit without narrowing the theorem itself.

- [ ] **Step 2: Record the elementary implication unramified \(\Rightarrow\) tame**

  Immediately after `definition:tamely_ramified_in_codim_1`, note that an unramified extension is tame: its ramification index is \(1\), and its residue extension is separable.

- [ ] **Step 3: Add completion invariance in the exact scope used**

  Before using completed local fields, add a lemma for an excellent DVR \(A\), a finite separable extension \(L/K\), and the normalization \(B\):

  ```latex
  B\otimes_A\widehat A
    \cong \prod_{\mathfrak m\mid\mathfrak m_A}
             \widehat{B_{\mathfrak m}}.
  ```

  The factors have the same ramification indices and residue extensions as before completion. Consequently, unramifiedness and tameness may be tested after completion. Explain that codimension-one local rings used below are excellent because the schemes are of finite type over \(k\).

- [ ] **Step 4: Add the general character--inertia criterion**

  For a finite constant abelian group \(G\), a \(G\)-torsor restricted to
  \(\operatorname{Spec}(\widehat K_\xi)\) corresponds to

  ```latex
  \rho_\xi:G_{\widehat K_\xi}\longrightarrow G.
  ```

  Let \(I_\xi\) and \(P_\xi\) be the inertia and wild inertia subgroups of the absolute Galois group. State and prove, for arbitrary residue field,

  ```latex
  \cP \text{ is unramified at }(Z,\xi)
    \iff \rho_\xi(I_\xi)=1,
  \qquad
  \cP \text{ is tame at }(Z,\xi)
    \iff \rho_\xi(P_\xi)=1.
  ```

  Use the finite Galois component cut out by \(\ker(\rho_\xi)\) and the ordinary inertia/wild-inertia exact sequence. This is not a numerical filtration and requires no perfectness hypothesis.

- [ ] **Step 5: Make the numerical scope boundary explicit**

  Before `definition:local_ramification_boundness`, say that numerical upper ramification is used only after returning to a closed point \(P\) of the smooth curve. Since \(k\) is perfect and \(C/k\) is smooth, \(\kappa(P)/k\) is finite separable and \(\kappa(P)\) is perfect. Keep both numerical definitions and the curve-point character criterion unchanged in substance.

- [ ] **Step 6: Build and review Task 1**

  Run:

  ```bash
  latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
  ```

  Show the new scope, completion, and inertia passages and stop for approval.

---

### Task 2: Replace the four basic-properties lemmas and unify base change

**Files:**

- Modify: `sections/Preliminaries/GTorsorRamification.tex` in the subsection `Basic Properties of Ramification of G-Torsors`

**Outcome:** All general-divisor lemmas speak only about tame/unramified ramification, and their proofs are valid with imperfect residue fields.

- [ ] **Step 1: Weaken contracted products (Lemma 43)**

  Preserve `lemma:bounding_ramification_of_contracted_product`, but replace the numerical statement by:

  ```latex
  tame + tame       => tame,
  unramified + unramified => unramified.
  ```

  If \(N=P_\xi\) or \(I_\xi\), use the character of the contracted product,
  \(\rho=\rho_1+\rho_2\), and explicitly conclude
  \(\rho(N)\subseteq\rho_1(N)+\rho_2(N)=1\).

- [ ] **Step 2: Add one weakly-unramified base-change lemma**

  Let \(A\to A'\) be an extension of DVRs with ramification index \(1\) and separable residue-field extension, with fraction fields \(K\subset K'\). For finite separable \(L/K\), state:

  ```latex
  L/K \text{ is unramified (resp. tame) over }A
  \iff
  \text{every field factor of }L\otimes_KK'
  \text{ is unramified (resp. tame) over }A'.
  ```

  Henselianity and finiteness of \(K'/K\) are not required. For preservation, cite the standard stability of tame/unramified extensions under valued base change (Stacks Project, Tag `0EXY`). For reflection, compare the two towers inside a field factor: ramification indices multiply, and the original residue extension is a subextension of a separable residue extension.

- [ ] **Step 3: Make Lemma 44 a geometric corollary**

  Preserve `lemma:descend_ramification_along_etale`, but state only the equivalence of tameness and unramifiedness. Apply Step 2 to the codimension-one DVR map induced by the étale morphism. Remove all upper-numbering and numerical-bound language.

- [ ] **Step 4: Weaken fiber products (Lemma 45)**

  Delete the \(\max(r_1,r_2)\) clause. Retain the if-and-only-if statements for tame and unramified behavior. For \(N=P_\xi\) or \(I_\xi\), use
  \(\rho=(\rho_1,\rho_2)\) and
  \(\rho(N)=1\iff\rho_1(N)=\rho_2(N)=1\).

- [ ] **Step 5: Split induced torsors (Lemma 46) by scope**

  Preserve `lemma:ramification_of_induced_torsor` and its kernel proof.

  - At a general divisor, induction along \(H\hookrightarrow G\) preserves and reflects tame and unramified ramification.
  - At a closed point \(P\) of the curve only, it also preserves and reflects every classical numerical upper bound, because the two characters have the same kernel and hence the same connected local field extension.

- [ ] **Step 6: Build and review Task 2**

  Run the full `latexmk` command, show all four revised statements and proofs, and stop for approval.

---

### Task 3: Narrow scalar base change and formal--local invariance

**Files:**

- Modify: `sections/Preliminaries/ReductionsBeforeCyclicTheories.tex:98-120`
- Modify: `sections/Preliminaries/ReductionsBeforeCyclicTheories.tex:135-151`
- Modify: `sections/Preliminaries/ReductionsBeforeCyclicTheories.tex:222-229`
- Modify: `sections/Preliminaries/ReductionsBeforeCyclicTheories.tex:231-246`

**Outcome:** Exceptional-divisor statements in the reduction assert only tame/unramified behavior.

- [ ] **Step 1: Correct base change to \(\bar k\)**

  Replace the appeal to the étale lemma and delete the numerical \(r\)-claim. Apply Task 2's weakly-unramified base-change lemma directly to the ind-étale scalar-extension DVR map. Conclude only that tameness and unramifiedness are equivalent before and after base change.

- [ ] **Step 2: Narrow the formal--local conclusion**

  Keep the canonical torsor isomorphism in `lemma:formal_local_invariance`. In its concluding sentence, retain only dependence of tameness and unramifiedness on \((\cP_x,d)\); delete “bounded by \(r\).”

- [ ] **Step 3: Remove the numerical-definition citation from the proof**

  At current lines 222--229, cite only `definition:tamely_ramified_in_codim_1` when reading ramification at \(\eta_\ndls\). Do not cite the curve-point numerical definition there.

- [ ] **Step 4: Narrow `cor:reduction_to_P1`**

  At current lines 231--246, delete “for every \(r\)” and state only equivalence of tame and unramified behavior at the two exceptional divisors.

- [ ] **Step 5: Build and review Task 3**

  Run the full build and:

  ```bash
  rg -n 'bounded by \$r' sections/Preliminaries/ReductionsBeforeCyclicTheories.tex
  ```

  Expected: no numerical bound attached to an exceptional divisor. Show the changed passages and stop for approval.

---

### Task 4: Correct the induced-torsor uses and the Kummer residue-field leak

**Files:**

- Modify: `sections/RamificationAfterBlowupIsTame.tex:27-56`
- Modify: `sections/Preliminaries/CyclicRamificationTheories.tex:38-70`
- Modify: `sections/RamificationAfterBlowupIsTame.tex:121-132`

**Outcome:** The only numerical induced-torsor use is curve-local, and the exceptional-divisor Kummer calculation no longer invokes a theorem under an unmet perfect-residue hypothesis.

- [ ] **Step 1: Cite the curve-point clause at the actual numerical use**

  At current line 42, where the bound passes from \(\cP_x\) to \(\cQ\) over \(k((x))\), cite the curve-point numerical clause of `lemma:ramification_of_induced_torsor`. The residue field \(k\) is algebraically closed and hence perfect.

- [ ] **Step 2: Use only the general clause at \(\eta_\ndls\)**

  Rewrite current lines 50--51 to say that induction preserves and reflects tameness and unramifiedness at the exceptional divisor. Do not call this a numerical-bound assertion.

- [ ] **Step 3: Add a residue-field-independent Kummer monomial lemma**

  Keep the existing Kummer theorem in its stated perfect-residue context. Immediately after it, add the special lemma actually needed later:

  > For a complete DVR with arbitrary residue field of characteristic \(p\), if \((e,p)=1\) and \((a,e)=1\), the extension defined by \(Y^e=\pi^a\) has degree and ramification index \(e\), hence is totally ramified with trivial residue extension and is tame.

  Prove this from the denominator of the valuation \(v(Y)=a/e\); no perfectness is used.

- [ ] **Step 4: Use the new lemma at the exceptional divisor**

  Replace the invocation of `theorem:kummer_ramification` at current line 129 with the new monomial lemma. Explicitly mention the trivial residue extension, so tameness is verified in the sense of `definition:tamely_ramified_dvrs` even though
  \(\kappa=k(e_1/e_d,\ldots,e_{d-1}/e_d)\) is generally imperfect.

- [ ] **Step 5: Build and review Task 4**

  Run the full build, show the two corrected induced-torsor sentences and the new Kummer lemma/use, and stop for approval.

---

### Task 5: Weaken the external-product and large-degree arguments

**Files:**

- Modify: `chapter3_reorganized_codex/chapter3_reorganized_codex.tex:345-355`
- Modify: `chapter3_reorganized_codex/chapter3_reorganized_codex.tex:494-502`
- Modify: `chapter3_reorganized_codex/chapter3_reorganized_codex.tex:615-626`

**Outcome:** Chapter 3 consumes only the weakened tame/unramified lemmas.

- [ ] **Step 1: Weaken `prop:ramification-external-product`**

  Replace its numerical hypothesis and conclusion by: if both input torsors are tame at \(\eta_X,\eta_Y\), their external contracted product is tame at \(\eta_{X\times Y}\).

- [ ] **Step 2: Rewrite the final local proof paragraph**

  Apply Task 2's base-change lemma to the already computed ramification-index-one DVR maps \(R_X\to S\) and \(R_Y\to S\), whose residue extensions are separable. Then apply the weakened contracted-product lemma. Remove all claims about a preserved numerical filtration.

- [ ] **Step 3: Keep `lemma:tame-times-unramified` as a short corollary**

  Preserve its label. Invoke Task 1's observation that unramified implies tame, followed by the weakened contracted-product lemma.

- [ ] **Step 4: Confirm downstream strength**

  Verify that `lemma:moduli_reduction`, the large-degree argument, and étale descent at current line 680 require only tameness.

- [ ] **Step 5: Build and review Task 5**

  Run the full build and:

  ```bash
  rg -n 'bounded by \$r|ramification filtration is preserved' \
    chapter3_reorganized_codex/chapter3_reorganized_codex.tex
  ```

  Show the revised proposition/proof and stop for approval.

---

### Task 6: Final semantic and repository audit

**Files:** Verify every file included by `main.tex`; report inactive duplicates without editing them.

- [ ] **Step 1: Audit numerical phrases and citations**

  Across active files, run regex searches for:

  ```text
  bounded by \$r
  G_K\^r
  H\^r
  upper-numbering
  \Cref{definition:local_ramification_boundness}
  \Cref{theorem:kummer_ramification}
  perfect
  ```

  Confirm that upper-numbering language occurs only at closed curve points or in the positive-characteristic local review, never at an exceptional-divisor generic point.

- [ ] **Step 2: Audit every consumer of the four retained labels**

  Check every active reference to:

  ```text
  lemma:bounding_ramification_of_contracted_product
  lemma:descend_ramification_along_etale
  lemma:ramification_of_fiber_product
  lemma:ramification_of_induced_torsor
  ```

  Confirm that each caller requests no more than its weakened statement supplies.

- [ ] **Step 3: Perform the final build and log check**

  Run:

  ```bash
  latexmk -pdf -interaction=nonstopmode -halt-on-error main.tex
  rg -n 'undefined references|multiply defined|LaTeX Error' main.log
  ```

- [ ] **Step 4: Report inactive duplicates**

  List archival/reorganized `.tex` files that retain the old stronger language. Do not edit them without explicit direction.

- [ ] **Step 5: Deliver the final summary**

  State the mathematical scope boundary, list active files changed, report the build result, and identify remaining archival inconsistencies.
