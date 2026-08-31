---
title: "Treating a Biomaterial Like a Machine: The Closed-Loop Bone Scaffold"
slug: "bone-scaffold-closed-loop"
date: 2026-08-29
description: "A mechatronics engineer's reading of a published biomaterial: wound pH as sensor input, a strained doped crystal lattice as controller, and ion release as actuation — zinc release rises 37.5% in acid, exactly when infection risk peaks."
summary: "Sensor, controller, actuator — all three built into a crystal lattice. What a triple-doped hydroxyapatite scaffold looks like when you read it as a control system."
keywords: ["smart bone scaffold", "pH-responsive ion release", "closed-loop biomaterial", "stimuli-responsive scaffold", "triple-doped hydroxyapatite", "Mg Si Zn hydroxyapatite", "bone tissue engineering"]
tags: ["biomaterials", "control systems", "bone tissue engineering", "mechatronics"]
categories: ["Research"]
showTableOfContents: true
---

{{< katex >}}

{{< lead >}}
Every mechatronic system needs three things: a sensor to measure the world, a controller to decide
what that means, and an actuator to do something about it. The material my colleagues built has
all three — and none of them are electronic. They're built into a crystal lattice.
{{< /lead >}}

I should say plainly where I sit in this. I'm a mechatronics engineer, one of
{{< fact key="paper_authors_total" >}} authors on
[this paper](/research/mg-si-zn-hap/). The synthesis and the cell work belong to my colleagues in
the pharmacy, chemistry and biotechnology engineering faculties — they designed the chemistry and
ran the assays. What I brought was the manufacturing side, and a particular habit of looking at
things: when I read our own results, I kept seeing a control system.

That reading is mine. It is a lens, not a finding, and I'll be explicit throughout about where the
analogy stops and the measurements begin.

## What a smart bone scaffold is

**A smart bone scaffold is a synthetic bone substitute that changes its own behaviour in response
to conditions in the body around it, rather than behaving identically regardless of what is
happening to the patient.** In the case described here, the scaffold releases more of its
antibacterial component when the surrounding tissue turns acidic — which is what happens when a
wound becomes inflamed or infected. The trigger is the local chemistry of the wound itself; there
is no sensor, no battery and no electronics involved.

## Why plain hydroxyapatite isn't enough

Hydroxyapatite is the mineral that makes up the hard part of your bones, and you can make it in a
lab. That makes it an obvious candidate for repairing bone: the body recognises it.

The trouble is that pure synthetic hydroxyapatite is *too* stable. It's highly crystalline, it
dissolves very slowly, and it's brittle. Put it in a defect and it mostly just sits there. It's
inert scaffolding in the architectural sense — it holds a space open, and that's all. It doesn't
participate.

In control terms: it's a passive mechanical part. No inputs, no outputs, no state.

Natural bone mineral, it turns out, isn't pure hydroxyapatite at all. It's full of substitutions —
carbonate, magnesium, sodium, silicon. Biology never made the pure version. So the strategy is to
put some of those elements back, deliberately and in controlled amounts.

## Three elements, three jobs

What makes this material unusual is that all three dopants go in **during the initial
precipitation**, not as a coating afterwards. They end up inside the lattice, distributed through
it, rather than sitting on the surface where they'd wash off.

**Magnesium, {{< fact key="paper_mg_mol_pct" >}} mol%.** Mg²⁺ is a smaller ion than the Ca²⁺ it
replaces (about 0.72 Å against 1.00 Å). Squeezing it into calcium sites strains the lattice and
inhibits crystal growth, so the crystals come out smaller — which means more surface area per gram,
and surface area is where everything biological happens. Magnesium also matters directly to bone
metabolism; it's involved in osteoblast adhesion and proliferation.

**Silicon, {{< fact key="paper_si_wt_pct" >}} wt%.** Silicon goes in differently — as silicate
(SiO₄⁴⁻) replacing phosphate (PO₄³⁻). Those have different charges, so the substitution leaves
defects in the lattice, and defects make the material more chemically reactive and more soluble.
Biologically, silicon's headline role is angiogenesis: it stimulates VEGF secretion and helps
drive the formation of the blood vessels that new bone needs to survive. It also promotes type I
collagen synthesis, the organic framework bone mineralises onto.

**Zinc, {{< fact key="paper_zn_mol_pct" >}} mol%.** Zinc is the defensive component. It disrupts
bacterial metabolism and generates reactive oxygen species that damage bacterial membranes. It
also supports osteoblast differentiation at low concentrations. The catch — and this is the whole
design problem — is that zinc is only helpful in a narrow band. Too much and it becomes cytotoxic,
and prior work has shown zinc accumulating at a defect site can actively *impede* healing rather
than help it. The {{< fact key="paper_zn_mol_pct" >}} mol% figure is chosen to sit below that line.

Three variables, each with a useful effect and a failure mode, interacting in one crystal
structure. That's a multi-variable design problem before it's a chemistry problem.

## The whole study, in one diagram

{{< mermaid >}}
flowchart TD
    P["Precursors: CaCl₂, MgSO₄, ZnCl₂<br/>K₂HPO₄, Na₂SiO₃"] --> S["Co-precipitation<br/>60 °C, pH held at 11.2"]
    S --> T["Wash, dry 80 °C,<br/>heat treat 600 °C"]
    T --> C["Characterisation"]
    C --> C1["XRD — phase, 17 nm crystallites"]
    C --> C2["FT-IR — functional groups"]
    C --> C3["AFM — surface roughness"]
    T --> R["Ion release in SBF, 28 days"]
    R --> R1["pH study: 5.5 / 6.5 / 7.4 / 8.0"]
    T --> B["Biological testing"]
    B --> B1["MTT on MG-63 osteoblasts"]
    B --> B2["Antimicrobial: S. aureus, E. coli"]
    T --> F["3D scaffold fabrication"]
    F --> F1["65% porosity, 18 MPa"]
{{< /mermaid >}}

## The output signal: what comes out, and when

Soak the powder in simulated body fluid and measure what leaches out over four weeks.

{{< chart >}}
type: 'line',
data: {
  labels: [1, 3, 7, 14, 21, 28],
  datasets: [
    { label: 'Ca²⁺', data: [15.2, 28.7, 45.3, 62.1, 68.4, 72.6] },
    { label: 'Si',   data: [3.5, 5.8, 7.9, 9.3, 10.1, 10.8] },
    { label: 'Mg²⁺', data: [2.8, 4.5, 6.2, 7.8, 8.5, 9.2] },
    { label: 'Zn²⁺', data: [0.9, 1.8, 2.5, 3.1, 3.4, 3.6] }
  ]
},
options: {
  scales: {
    x: { title: { display: true, text: 'Time (days)' } },
    y: { title: { display: true, text: 'Cumulative release (mg/L)' } }
  }
}
{{< /chart >}}

Every curve has the same shape: steep for the first week, then flattening into a slow, sustained
release out to day {{< fact key="paper_release_days" >}}. That biphasic profile is what you want
from a step response in this context — an initial burst while the body is dealing with the acute
injury, then a long tail that keeps supplying ions through the months of remodelling. Nothing
dumps its payload at once and nothing runs dry.

## The interesting part: the response depends on the input

Here is the result that made me want to write this article. The same material, held at four
different pH values, releases at four different rates.

{{< chart >}}
type: 'bar',
data: {
  labels: ['pH 5.5', 'pH 6.5', 'pH 7.4', 'pH 8.0'],
  datasets: [
    { label: 'Ca²⁺ (mg/L)', data: [92.8, 78.3, 70.8, 64.1] },
    { label: 'Zn²⁺ (mg/L)', data: [4.95, 3.92, 3.60, 3.05] }
  ]
},
options: {
  scales: { y: { title: { display: true, text: 'Cumulative release at day 7 (mg/L)' } } }
}
{{< /chart >}}

Healthy tissue sits at pH 7.4. Inflamed and infected tissue turns acidic — pH 5.5 is a realistic
figure for an infected surgical site. At that pH, cumulative zinc release at seven days is
**{{< fact key="paper_zn_ph_increase" >}}** relative to physiological pH, and calcium is
**{{< fact key="paper_ca_ph_increase" >}}**. Swing alkaline instead and both fall back — zinc by
{{< fact key="paper_zn_ph_alkaline" >}}.

Zinc is the antibacterial component. So the material releases more of its defence precisely under
the conditions that indicate it's needed, and less when it isn't. Nobody triggers it. There's no
threshold circuit and no timer. The chemistry of the wound is the input, and the dissolution rate
of a strained crystal lattice is the transfer function.

That's the closed loop, and it's genuinely elegant.

{{< alert icon="triangle-exclamation" >}}
**Now the caveat, and it's an important one.** What was actually measured is a *static, four-point
comparison*: four separate samples, each held at a fixed pH, sampled at days 1, 3 and 7. It
demonstrates that release rate is a function of ambient pH. It does **not** demonstrate a system
detecting a change and correcting it, and it does not show release returning to baseline once an
infection clears — that experiment wasn't run. "Closed-loop" is my framing for how the material
behaves; the paper claims pH-responsive release, which is the more careful statement and the one
the data supports.
{{< /alert >}}

## Matched to the phases of healing

Bone healing isn't one process, it's a sequence, and each stage needs something different. What
makes the release profile interesting is that the material's output happens to line up with that
sequence.

{{< timeline >}}
{{< timelineItem header="Inflammatory phase" subheader="Days to about a week — acidic, infection risk highest" md="true" >}}
The wound is acidic, and this is the window in which an implant is most likely to be colonised — infection is a leading cause of implant failure. It's also exactly when the material releases the most zinc: **{{< fact key="paper_zn_ph_increase" >}}** at pH 5.5 against physiological pH. Local defence, delivered when the risk peaks.
{{< /timelineItem >}}
{{< timelineItem header="Proliferative phase" subheader="Weeks — new tissue and blood vessels forming" md="true" >}}
pH climbs back toward normal and zinc release falls off. Magnesium and silicon are still coming out steadily through this window — magnesium supporting osteoblast adhesion and proliferation, silicon driving the angiogenesis and collagen synthesis that new tissue needs. The output shifts from defensive to constructive.
{{< /timelineItem >}}
{{< timelineItem header="Remodelling phase" subheader="Months — mineralisation and maturation" md="true" >}}
The slow second phase of the release curve. All four ions continue at low, sustained levels out to day {{< fact key="paper_release_days" >}}, supporting mineralisation as new bone matures and reorganises. This is the long tail that a burst-release material would not provide.
{{< /timelineItem >}}
{{< /timeline >}}

I want to be careful here too: the alignment between the release profile and the healing sequence
is an *interpretation* the paper offers in its discussion, supported by the release data and by
what's known about each ion. It is not an observation of the material behaving this way in a
healing bone, because no animal study was done.

## Did the doping actually work?

{{< accordion >}}
{{< accordionItem title="The chemistry, for readers who want it" >}}

The target composition:

$$Ca_{9.70}Mg_{0.20}Zn_{0.10}(SiO_4)_{0.20}(PO_4)_{5.80}(OH)_2$$

Read it as ordinary hydroxyapatite, Ca₁₀(PO₄)₆(OH)₂, with pieces swapped out: 0.20 magnesium and
0.10 zinc taking calcium sites, and 0.20 silicate taking phosphate sites.

Writing a formula down is easy. Proving the atoms went where you intended is the hard part, and
this is where X-ray diffraction earns its keep. If the dopants had merely coated the surface, or
formed separate compounds alongside the hydroxyapatite, XRD would show either an unchanged lattice
or extra peaks from the secondary phases. Instead:

- The pattern shows a **single pure hexagonal apatite phase**, space group P6₃/m, with no secondary
  phase at all — nothing else crystallised out.
- The lattice **contracted measurably**: *a* fell from {{< fact key="paper_lattice_a_pure" >}} Å in
  pure hydroxyapatite to {{< fact key="paper_lattice_a" >}} Å, and *c* from
  {{< fact key="paper_lattice_c_pure" >}} Å to {{< fact key="paper_lattice_c" >}} Å.

That contraction is the evidence. Substituting smaller ions (Mg²⁺ ≈ 0.72 Å, Zn²⁺ ≈ 0.74 Å) for
larger ones (Ca²⁺ ≈ 1.00 Å) compresses the unit cell, and the silicate-for-phosphate swap adds
further strain. A surface coating cannot shrink a lattice. The peak positions moved, so the atoms
went in.

Two consequences follow. Crystallite size came out at about
**{{< fact key="paper_crystallite_nm" >}} nm** — magnesium's growth inhibition doing its job —
giving high surface area, with AFM measuring surface roughness of
{{< fact key="paper_roughness_sa" >}} nm. And a strained, defect-rich lattice is a more soluble
lattice, which is precisely why this material responds to pH when pure hydroxyapatite largely
doesn't. The strain *is* the mechanism.

Full diffraction, spectroscopy and microscopy parameters are on the
[data sheet](/research/mg-si-zn-hap/).

{{< /accordionItem >}}
{{< /accordion >}}

## But is it safe?

This is the part that worries me most as an engineer, because it's where a multi-variable design
can fail quietly. Zinc is antibacterial *because* it's cytotoxic to bacteria. Push that too far and
it becomes cytotoxic to the cells you're trying to help, and you've built something that kills the
infection and the healing along with it.

So the material was tested on MG-63 cells — a human osteoblast line, the standard model for
anything intended to touch bone.

The results: diluted extracts at 25 % and 12.5 % v/v held cell viability **at or above 95 %**
across 24, 48 and 72 hours. Direct suspensions stayed **at or above 92 % up to 1 mg/mL**. Under
ISO 10993-5, which draws the non-toxic line at 80 % viability, both sit comfortably in
non-toxic territory. At the lowest concentration tested, viability actually exceeded 100 % —
the cells did marginally better with the material present than without it.

The comparison that matters is against undoped hydroxyapatite. The IC₅₀ — the concentration at
which viability halves — came out at **{{< fact key="paper_ic50" >}} mg/mL** for the triple-doped
material, against **{{< fact key="paper_ic50_pure" >}} mg/mL** for pure hydroxyapatite. Higher is
safer, so adding three dopants including a deliberately antibacterial one produced a material with
a *wider* safety margin than the undoped baseline.

That's counterintuitive, and it's the strongest evidence for the synergy argument: magnesium and
silicon appear to moderate zinc's release rather than simply coexisting with it. The full viability
curves for both are charted on the [data sheet](/research/mg-si-zn-hap/).

## The antibacterial result, stated honestly

| | *S. aureus* ATCC 6538 | *E. coli* ATCC 8739 |
| --- | --- | --- |
| Inhibition zone, material at 100 mg/mL | {{< fact key="paper_zoi_saureus" >}} mm | {{< fact key="paper_zoi_ecoli" >}} mm |
| Inhibition zone, gentamicin 30 µg | {{< fact key="paper_zoi_gent_saureus" >}} mm | {{< fact key="paper_zoi_gent_ecoli" >}} mm |
| MIC | {{< fact key="paper_mic_saureus" >}} mg/mL | {{< fact key="paper_mic_ecoli" >}} mg/mL |

It works, and it is roughly **half as effective as a real antibiotic** by zone diameter. I'd
rather state that flatly than dress it up. This is not an antibiotic replacement and nobody on the
team has claimed it is.

What it is: a structural implant that carries some intrinsic resistance to being colonised, in a
context where local concentration at the implant surface is far higher than anything achievable
systemically, and where the alternative is a scaffold with no defence at all. Implant infection is
a leading cause of failure. A material that makes colonisation somewhat harder, for free, as a side
effect of its own composition, is worth having even if it never replaces a prescription.

{{< alert icon="triangle-exclamation" >}}
**What this study does not show.** The closed-loop framing is a useful way to think about this
material. It is not a licence to claim more than was measured, so here is the boundary, drawn
explicitly.

Everything above is **in vitro**. There is no animal study — no bone formed in any living thing.
Biology was assessed on **one cell line**, with no test of osteogenic differentiation, so we know
the cells survive but not that they were driven to build bone. Ion release was measured in
**closed containers**, which cannot reproduce the fluid flow of a living body that continuously
carries released ions away. Mechanical testing was **static compression only** — no fatigue, no
cyclic loading. Antibacterial testing used **two standard laboratory strains**, no clinical or
resistant isolates. And there is no data at all on where the nanoparticles go in a body or what
they do over the long term.

The paper's own recommended next steps are in vivo animal models, biomechanical testing under
cyclic loading, growth-factor loading, and optimising the doping ratio. The
[full limitations list](/research/mg-si-zn-hap/) is on the data sheet.
{{< /alert >}}

## Frequently asked

{{< faq >}}

{{< faqitem question="What makes a bone scaffold 'smart'?" >}}
That its behaviour changes with conditions in the body instead of staying the same regardless. This material releases more antibacterial zinc when surrounding tissue turns acidic — which is what happens during inflammation and infection — and less when conditions are normal. There is no electronics, no power source and no sensor: the responsiveness comes from the fact that a strained, defect-rich crystal lattice dissolves faster in acid.
{{< /faqitem >}}

{{< faqitem question="How is this a closed-loop system?" >}}
It is an analogy I find useful, not a claim from the paper. Local pH acts as the sensor input, the doped crystal lattice acts as the controller determining how solubility responds to that input, and ion release is the actuation. What was actually measured is release rate at four fixed pH values — a static comparison showing output depends on input. It does not show the material tracking a changing environment or returning to a setpoint over time.
{{< /faqitem >}}

{{< faqitem question="Why use three dopants instead of one?" >}}
Because bone healing needs several things at once and no single ion supplies them all. Magnesium reduces crystal size and increases surface area, helping cells attach. Silicon drives blood vessel formation and collagen synthesis. Zinc provides antibacterial defence. More interestingly, the combination behaved better than the sum of its parts — the triple-doped material had a higher IC₅₀ ({{< fact key="paper_ic50" >}} mg/mL) than undoped hydroxyapatite ({{< fact key="paper_ic50_pure" >}} mg/mL), suggesting magnesium and silicon moderate zinc's release rather than simply sitting alongside it.
{{< /faqitem >}}

{{< faqitem question="Is zinc-doped hydroxyapatite safe for human cells?" >}}
At the levels used here, yes. On MG-63 human osteoblasts, viability stayed at or above 95 % for diluted extracts and at or above 92 % up to 1 mg/mL of direct suspension, comfortably above the 80 % non-toxic threshold in ISO 10993-5. Zinc content matters enormously though: this material uses {{< fact key="paper_zn_mol_pct" >}} mol%, and earlier published work found that higher zinc loading caused accumulation at the defect site that impeded bone healing rather than helping it.
{{< /faqitem >}}

{{< faqitem question="Could this replace antibiotics in bone implants?" >}}
No, and the study does not suggest it. The material's inhibition zones were {{< fact key="paper_zoi_saureus" >}} mm against *S. aureus* and {{< fact key="paper_zoi_ecoli" >}} mm against *E. coli*, versus {{< fact key="paper_zoi_gent_saureus" >}} mm and {{< fact key="paper_zoi_gent_ecoli" >}} mm for gentamicin — roughly half as effective. The value is that a structural scaffold carries some built-in resistance to colonisation as a property of its own composition, in a setting where implant infection is a common cause of failure.
{{< /faqitem >}}

{{< faqitem question="What does pH have to do with bone infection?" >}}
Inflamed and infected tissue becomes more acidic than healthy tissue — around pH 5.5 against a normal 7.4. That acidity is a reliable chemical signature of the exact situation in which you would want more antibacterial activity, which is what makes it useful as a trigger. This material released {{< fact key="paper_zn_ph_increase" >}} more zinc at pH 5.5 than at 7.4 over seven days.
{{< /faqitem >}}

{{< /faq >}}

---

We ended up engineering this because off-the-shelf approaches could not deliver what the chemistry
needed. If your research group is running into the limits of commercial equipment or standard
fabrication routes and needs custom mechatronics to get past it, that is the kind of problem I
like. [Get in touch](/work-with-me/).

Next in this series — how the material actually became a physical object, and why we printed a
mould instead of printing the part:

{{< article link="/research/printing-bone-scaffolds/" >}}
