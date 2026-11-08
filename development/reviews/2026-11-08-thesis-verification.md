# Mathematical review of the active thesis — 8 November 2026

Follow-up: proposed corrections for findings 1 and 2 have now been inserted
in blue in the manuscript, including the dependent Appendix B discussion.
The findings below document the text before those proposals; the statement
that no source was changed describes the original review pass.

The original wording proposed for removal is also retained in red beside
the blue proposals, so the manuscript now displays both versions for review.

## Verdict and scope

The thesis contains false mathematical statements as written. Two findings deserve priority: the general description of ramification groups in Chapter 2, and the asserted compatibility of exceptional valuations in Appendix B. Explicit counterexamples are given below.

These findings do **not** establish that the main ramification theorem or geometric class field theory theorem is false. The direct cyclic calculation works over an algebraically closed constant field, and does not use Appendix B's proposed valuation tower. No counterexample to either main theorem was found in this review. This is a mathematical audit, not a formal certification of all proofs.

Reviewed the active introduction, all three chapters, and both appendices assembled by `main.tex`. Legacy and experimental sources were not treated as parts of the thesis. The review checked the central cyclic/Witt calculation and Chapter 3's deduction separately, including relevant primary references.

No manuscript source was changed. A forced rebuild using the configured LaTeX Workshop command, with `-g` added, succeeded and regenerated the 82-page `main.pdf`. The build has duplicate `page.1` PDF destination warnings and one overfull box; no unresolved-reference or unresolved-citation warning was found. A successful build is independent of mathematical correctness.

## 1. False uniformizer and ramification-filtration assertions

**Priority: substantive correction. Confidence: high.**

Source: `manuscript/chapters/02-ramification/discrete-valuations.tex`, lines 63–64, 74–80, and the dependent formulas at 89–96.

The text claims that a perfect residue field implies that the integral closure has the form `B=A[Π]` for a uniformizer Π. It then computes the ramification function for every automorphism by

\[
i_K^L(\sigma)=v_B(\sigma(\Pi)-\Pi),
\]

and uses this to recover all the lower ramification groups. Neither assertion holds in the stated generality.

Take

\[
A=\mathbf F_p[[t]],\quad B=\mathbf F_{p^2}[[t]],\qquad
K=\mathbf F_p((t)),\quad L=\mathbf F_{p^2}((t)).
\]

This is an unramified Galois extension satisfying the hypotheses in the text. No uniformizer Π generates B over A: reducing every element of A[Π] modulo Π gives an element of \(\mathbf F_p\), whereas \(B/(\Pi)=\mathbf F_{p^2}\).

Moreover, choose Π=t. The nonidentity residue Frobenius σ fixes t, so the displayed function gives \(i_K^L(\sigma)=\infty\). The proposed formula puts σ in every ramification group, although the actual inertia group is \(G_0=1\). The displayed Herbrand formula consequently fails as well: for this example its sum would give \(2(i+1)-1\), whereas the Herbrand function for nonnegative i is i.

**Correction:** use the uniformizer test only for σ in inertia. Define \(i_K^L(\sigma)=0\) outside inertia, and \(i_K^L(\sigma)=v_B(\sigma\Pi-\Pi)\) on inertia. Equivalently use the infimum over all elements of B. Replace the generator claim by its totally ramified version, or use the maximal unramified intermediate ring before adjoining Π.

The inertia qualification is explicit in [Elder–Keating, §2](https://arxiv.org/html/2503.16830v1#S2).

**Effect on the main argument:** this does not refute the explicit cyclic calculations over algebraically closed k, where the relevant connected local extensions are totally ramified. It does require correcting the general preliminary theory.

## 2. Appendix B's generic exceptional points are not compatible

**Priority: substantive correction to the appendix. Confidence: high.**

Source: `manuscript/appendices/B-failed-induction/attempted-induction.tex`, lines 168–171. The dependent valuation tower appears in `valuation-obstruction.tex`, lines 72–102.

The text asserts that the rational lift of a finite curve map to the two ordinary point blowups sends the generic point of the source exceptional divisor to the generic point of the target exceptional divisor. This is false, including in the intended separable, wildly ramified setting.

Let k be algebraically closed of characteristic 2, let \(C'=\mathbf P^1_t\), \(C=\mathbf P^1_x\), and take

\[
x=\frac{t^2}{1-t},\qquad d=3.
\]

This is an Artin–Schreier map: with y=1/t, one has \(y^2-y=x^{-1}\). Thus the example is not merely a purely inseparable map.

Near \(3\cdot0\) in \(C'^{(3)}\), let a,b,c be the elementary symmetric functions of \(t_1,t_2,t_3\). Let \(s_1,s_2,s_3\) be the elementary symmetric functions of the corresponding x-coordinates. Direct expansion in characteristic 2 gives, with \(D=1+a+b+c\),

\[
s_1=\frac{a^2+ab+ac+c}{D},\qquad
s_2=\frac{b^2+bc}{D},\qquad
s_3=\frac{c^2}{D}.
\]

At the generic exceptional point of the ordinary blowup of \((a,b,c)\),

\[
v(a)=v(b)=v(c)=1,
\quad\text{hence}\quad
(v(s_1),v(s_2),v(s_3))=(1,2,2).
\]

The lifted map therefore sends this point to the special point \([1:0:0]\) of the target exceptional \(\mathbf P^2\), not its generic point. In particular, \(s_2/s_1\) is a unit at the target generic exceptional point but has positive valuation at the source generic exceptional point. Its inverse cannot belong to the source valuation ring. Thus the claimed inclusion of the two specified DVRs does not exist via this function-field map.

This example can also occur as the quotient layer of the intended cyclic order-4 setting: the Witt class \((x^{-1},0)\) has largest break 2 and is bounded by d=3, while its degree-2 quotient is exactly the displayed Artin–Schreier extension.

**Correction:** do not identify the ordinary source exceptional valuation with a place above the ordinary target exceptional valuation. Choose an actual extension of the target valuation in the source function field, and then justify any induction input at that chosen place. This requires changing the appendix's tower argument. The later absorption example still illustrates the general danger of wild base change, but it does not repair this earlier identification.

**Effect on the main argument:** Appendix B explains a failed alternative strategy. Chapter 2's direct Witt-vector argument does not depend on this false compatibility claim.

## 3. The symmetric torsor quotient is false at degree zero

**Priority: minor hypothesis/convention correction. Confidence: high.**

Source: `manuscript/chapters/01-preliminaries/symmetric-powers.tex`, line 44 allows d≥0; lines 195–209 give the quotient construction; lines 219–227 assert it is a G-torsor. Lines 362–385 explicitly allow zero degrees in additivity.

For d=0 and a nontrivial G,

\[
G^0=1,\qquad K_G=1,\qquad
K_G\backslash\mathcal P^{\times_S0}/S_0=S.
\]

This is not a G-torsor over S. Also the asserted identification \(G^d/K_G\simeq G\) fails at d=0.

**Correction:** impose d≥1 on the quotient construction and separately define \(\mathcal P^{[0]}=G\times S\), the neutral torsor. This also supplies the correct zero-degree object for the stated additivity formula. [Guignard, §2.31](https://arxiv.org/html/1804.02243#S2.SS8) explicitly assumes positive degree for this construction.

## 4. Arithmetic versus geometric tame fundamental group

**Priority: minor statement correction. Confidence: high.**

Source: `manuscript/introduction.tex`, lines 36–38, under the standing assumption that k is perfect.

The claim that the tame fundamental group of \(\mathbf A^1_k\) is trivial is false for an arbitrary perfect k. For example,

\[
\mathbf A^1_{\mathbf F_{q^2}}\longrightarrow\mathbf A^1_{\mathbf F_q}
\]

is a nontrivial connected finite étale cover, and is unramified at infinity. The intended triviality statement is for the **geometric** tame fundamental group, or for algebraically closed k. The corresponding fiberwise reasoning should say this explicitly.

## Smaller scope and proof-justification points

These do not obstruct the actual positive-dimensional curve applications:

- `manuscript/chapters/03-geometric-class-field-theory/compactification.tex`, lines 25–34 and 59–73: make the assumption \(\mathfrak m>0\) explicit for this construction and theorem. When \(\mathfrak m=0\), the specified center is all of \(C^{(d)}\), whose blowup is empty, contradicting the claimed inclusion of \(U^{(d)}\). The preceding discussion strongly suggests the intended restriction, so this is a scope clarification.
- `manuscript/chapters/03-geometric-class-field-theory/boundary-tameness.tex`, lines 51–56: require \(\dim X,\dim Y>0\). For \(X=\operatorname{Spec}k\), the blowup at its sole point is empty and the named exceptional generic point does not exist.
- `manuscript/chapters/01-preliminaries/symmetric-powers.tex`, line 408: the cited flat-base-change proposition does not, as written, justify descent in the subsection's full quasi-projective generality. Supply a descent justification with the necessary hypotheses, or state flatness where used. The later curve applications are flat. This is a proof-justification issue, not an established counterexample to additivity.

## Central arguments checked without a confirmed error

The positive-degree frame-torsor and symmetric torsor constructions, the symmetric-regularity lemma, the direct exceptional-divisor calculation, and the weighted-degree argument for Witt addition were checked without finding a further mathematical error. The Schmid–Witt break formula agrees with [Elder–Keating, Theorem 2.3](https://arxiv.org/html/2503.16830v1#S2).

Chapter 3's compactification and relative hyperplane description agree with [Takeuchi, §3](https://arxiv.org/html/1804.02136). No confirmed fatal error was found in the deduction from boundary tameness to extension and descent. In particular, its use of the pro-p abelianized fundamental group of geometric affine space is substantially more precise than the arithmetic statement in the introduction.
