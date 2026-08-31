---
title: "Beyond the Mold: The Manufacturing Constraints of Bone Scaffolds"
slug: "printing-bone-scaffolds"
date: 2026-08-29
description: "How a 65% porous, 18 MPa bone scaffold was actually manufactured — indirect sacrificial PLA moulding, three-stage debinding and sintering — and what direct ceramic extrusion, SLA/DLP and electrospinning would each cost you. With corrected figures from the current literature."
summary: "The manufacturing route behind a published bone scaffold, and an honest comparison against direct ink writing, electrospinning and vat photopolymerisation."
keywords: ["indirect 3D printing ceramics", "sacrificial mold casting", "direct ink writing bioceramic", "robocasting bone scaffold", "sintering shrinkage", "bone scaffold manufacturing", "debinding sintering ceramic"]
tags: ["3D printing", "additive manufacturing", "bioceramics", "mechatronics"]
categories: ["Research"]
showTableOfContents: true
---

{{< lead >}}
I'm a mechatronics engineer. My colleagues in pharmacy, chemistry and biotechnology engineering
designed and synthesised the material in [our recent paper](/research/mg-si-zn-hap/); what pulled
me in was the part after the chemistry was finished — how you turn a jar of ceramic powder into a
physical object with a defined internal geometry, and why that turns out to be harder than
printing it.
{{< /lead >}}

## The problem, stated concretely

We needed a hollow structure that mimicked a bone-marrow canal: {{< fact key="paper_scaffold_od_mm" >}} mm
outer diameter, {{< fact key="paper_scaffold_id_mm" >}} mm inner, {{< fact key="paper_scaffold_len_mm" >}} mm
long. It had to end up around {{< fact key="paper_porosity" >}} % porous, with those pores
*interconnected* — isolated voids are useless, because cells and nutrients have to travel through
the structure, not sit in sealed pockets. And it had to survive being handled and loaded.

The obvious instinct for a 2020s engineer is to print it. You cannot, at least not easily. A
hydroxyapatite powder is not a thermoplastic; there is no filament to melt. To extrude it you must
first suspend it in something, and the moment you do that you are fighting two requirements that
pull in opposite directions: enough ceramic in the mix to survive firing without collapsing, and
enough fluidity to actually pass through a nozzle.

So the route we took avoids the problem entirely: **print the negative, not the part.**

## What we actually did

{{< mermaid >}}
flowchart TD
    A["CAD negative: hollow half-cylinder<br/>15 mm OD / 8 mm ID / 30 mm"] --> B["FDM-print PLA mould"]
    B --> C["Cast slurry:<br/>60% Mg/Si/Zn-HAp in PEG + PVA<br/>+ methylcellulose anti-settling"]
    C --> D["Dry 120 °C / 48 h"]
    D --> E["Burn out organics 600 °C<br/>PLA mould + binder removed"]
    E --> F["Sinter 1200 °C / 2 h<br/>ceramic densifies"]
    F --> G["Helium pycnometry<br/>65 ± 3% interconnected porosity"]
    F --> H["Uniaxial compression<br/>18 ± 2 MPa"]
{{< /mermaid >}}

A PLA mould is FDM-printed as the *inverse* of the part. It gets filled with a slurry that is
{{< fact key="paper_slurry_solids_pct" >}} % Mg/Si/Zn-HAp powder, suspended in polyethylene glycol
and polyvinyl alcohol with methylcellulose added to stop the ceramic settling out before it dries.
Then three thermal stages, and the distinction between them is the single most misread part of
this process:

| Stage | Temperature | What happens |
| --- | --- | --- |
| Drying | {{< fact key="paper_dry_c" >}} °C, 48 h | Water leaves. Slow, because fast drying cracks the green body. |
| Debinding / burnout | {{< fact key="paper_burnout_c" >}} °C | **The PLA mould and the polymer binder burn away.** What remains is a fragile ceramic skeleton. |
| Sintering | {{< fact key="paper_sinter_c" >}} °C, {{< fact key="paper_sinter_h" >}} h | Ceramic particles fuse. The part gains its strength here. |

Burnout and sintering are **not the same step**, and they do not happen at the same temperature.
I have seen this collapsed into a single "fired at 1200 °C" in more than one summary of our own
work, and it matters: everything organic must be gone *before* densification starts. If the binder
is still decomposing while the surface is closing up, the escaping gas has nowhere to go and the
part cracks from the inside. The 600 °C hold is what buys you a clean part; the 1200 °C hold is
what buys you strength. All the parameters are in the [data sheet](/research/mg-si-zn-hap/).

The result: {{< fact key="paper_porosity" >}} % interconnected porosity measured by helium
pycnometry, and {{< fact key="paper_compressive_mpa" >}} MPa in uniaxial compression.

## Why not just print the ceramic directly?

Because as of today, nothing in the published literature reaches {{< fact key="paper_compressive_mpa" >}} MPa
at {{< fact key="paper_porosity" >}} % porosity by direct extrusion. That is the honest answer, and
the table below is the evidence for it rather than a tour of other people's work.

For scale: human cancellous bone runs about {{< fact key="ref_cancellous_mpa" >}} MPa in compression
(Budharaju et al., 2023), and its Young's modulus spans {{< fact key="ref_cancellous_gpa" >}} GPa
(Wu et al., via Hassan et al., 2025).

| | **This work** — indirect sintered | **Si-doped BCP** — direct extrusion | **Sr/Zn-HAp/collagen/PLGA** — electrospun | **SLA / DLP** — vat photopolymerisation |
| --- | --- | --- | --- | --- |
| Method | CAD negative mould, slurry cast, sintered | Robocasting through a {{< fact key="ref_nozzle_um" >}} µm nozzle | High-voltage electrostatic spinning | Photocurable ceramic-loaded resin |
| Compressive strength | {{< fact key="paper_compressive_mpa" >}} MPa | >2 MPa at ≤4 mol% Si | Not evaluated in bulk | DLP-HAp {{< fact key="ref_dlp_hap_mpa" >}} MPa; DLP ZrO₂/HA {{< fact key="ref_dlp_zro2_mpa" >}} MPa; SLA resin {{< fact key="ref_sla_resin_mpa" >}} MPa |
| Young's modulus | **Not reported** | **Not reported** | {{< fact key="ref_electrospun_gpa" >}} GPa | — |
| Porosity | {{< fact key="paper_porosity" >}} %, interconnected | {{< fact key="ref_si_bcp_porosity" >}} % open | High, but pores 2.9 ± 0.76 µm | CAD-defined |
| Pore scale | Macro, interconnected | 400–500 µm square lattice | Sub-micron — below what cells need | 100–1000 µm |
| Source | This paper | Lu et al., 2024 | Hassan et al., 2025 | Budharaju et al., 2023 (review) |

Four things in that table are worth stating plainly, because summaries of this literature get them
wrong often enough that I want the corrected versions on the record:

**Neither this work nor Lu et al. measured Young's modulus.** Both report compressive strength.
Those are different quantities and a scaffold comparison that fills in a modulus column for
studies that never measured one is inventing data. Only the electrospun work has a real modulus,
and it was obtained by nanoindentation, not bulk compression — which is again a different thing.

**Lu et al.'s silicon threshold is ≤4 mol%, not >4 mol%.** Scaffolds doped at 4 mol% silicon or
below held 70–80 % open porosity *and* compressive strength above 2 MPa. It was the 8 and 10 mol%
formulations that dropped below 2 MPa. The doping level buys you biological activity and costs you
strength, and the interesting region is the boundary — not a blanket "more silicon is worse".

**Vat photopolymerisation covers a wide range, and quoting the top of it is misleading.** In
Budharaju et al.'s survey the actual reported numbers are DLP hydroxyapatite at {{< fact key="ref_dlp_hap_mpa" >}} MPa, a
DLP ZrO₂/HA composite at {{< fact key="ref_dlp_zro2_mpa" >}} MPa, and an SLA acrylic resin at {{< fact key="ref_sla_resin_mpa" >}} MPa. A separate
lithography-based route (LCM, alumina, 50 % porosity, 500–1000 µm pores, 48 h sinter) reached a
compression Young's modulus of {{< fact key="ref_lcm_gpa" >}} GPa with fractural strength of {{< fact key="ref_lcm_fract_mpa" >}} MPa.
That {{< fact key="ref_lcm_gpa" >}} GPa figure belongs to **LCM alumina specifically** — it is not a general property of SLA/DLP.

**Electrospinning's weakness is geometric, not mechanical.** Hassan et al. produced beautiful
{{< fact key="ref_electrospun_fibre_nm" >}} nm fibres, but the resulting pores were {{< fact key="ref_electrospun_pore_um" >}} µm. Their own paper points out
the problem: osteoblasts are 10–50 µm and need pores of {{< fact key="ref_pore_cell_um" >}} µm to migrate into a structure.
A mat with excellent stiffness that cells cannot enter is a surface, not a scaffold.

## The process engineering nobody puts in the abstract

Three things dominate whether a ceramic part comes out of the furnace usable, and none of them are
chemistry.

**Shrinkage is enormous and you must design for it.** Across the cases Budharaju et al. survey,
sintering shrinkage runs from about {{< fact key="ref_shrinkage_range" >}}. A 20 wt% HA/TCP ink shrank 45.25 %; raising the
ceramic loading to 40 wt% brought it down to 17.8 % at 1150 °C. Infill density does the same thing
from the other direction — 100 % infill gave 12 ± 3.7 % shrinkage, 75 % gave 28 ± 3.8 %, and 50 %
gave 42 ± 4.7 %. If your CAD model is the size you want the finished part to be, you have already
failed.

**And the shrinkage is not uniform.** Green bodies shrink more in Z than in XY. The mechanism is
weak binding between deposited layers and easier binder escape along that axis, compounded by
isotropic sintering stress — not, as I have seen claimed, gravity or settling. Which means the
compensation factor is anisotropic: you scale Z differently from XY, and you have to characterise
it empirically for your own slurry and furnace profile.

**Nozzle geometry sets your floor on pore size.** Lu et al. extruded through a 400 µm inner
diameter nozzle to produce a lattice with 400–500 µm square through-holes. That is comfortably
above the {{< fact key="ref_pore_cell_um" >}} µm cells need, and well past the >{{< fact key="ref_pore_vascular_um" >}} µm that Picado-Tejero et al. (2025)
associate with vascularisation and osteogenesis. Their review also finds that gyroid and diamond
TPMS geometries distribute compressive load better than square or star lattices — a genuinely
mechatronic result, since it says the *toolpath*, not just the material, determines the mechanics.

{{< alert icon="circle-info" >}}
**What we did not do.** We used none of this. Our scaffold was cast in a mould, so there was no
toolpath, no TPMS geometry, no shrinkage-compensated CAD model, no finite-element or fluid
simulation. Those techniques are the field's, cited above; the section that follows is where I
think our own next step should be. I'm keeping the three separate on purpose.
{{< /alert >}}

## Where I would take this next

This is my own view as the engineer on the team, not a claim from the paper, and I've ordered it
by distance from what we can actually do now.

**First, slurry rheology.** The reason we cast rather than printed is that we did not have a
formulation that could be extruded and still survive firing. That is a solvable, unglamorous
problem: raise the solid loading, get shear-thinning behaviour so the paste flows under the nozzle
and stops the moment it leaves, and pick binders that burn out cleanly. It is squarely a
mechatronics-and-process problem rather than a chemistry one, and it removes an entire
manufacturing stage — no mould to print, no mould to burn out.

**Then simulation before fabrication.** Finite-element analysis of the stress field and
computational fluid dynamics of nutrient perfusion through the pore network, run on the CAD model
before anything is fired. Firing a batch takes days; simulating a geometry takes minutes.

**Then higher resolution,** via SLA or DLP with ceramic-loaded resins, where the anatomical
geometries that matter clinically — cranial, maxillofacial — become reachable.

**Then multi-material,** a stiff ceramic lattice carrying load with a softer phase delivering
growth factors.

**And eventually, cell-laden bioprinting.** I want to be blunt that this is the horizon and not
the next step. Going from a sintered acellular ceramic to printing live cells is not one
increment; it is a different manufacturing paradigm, and anyone who presents it as the obvious
follow-on hasn't costed the intervening work.

Worth stating clearly: **the paper's own recommended next steps are different from mine.** It
calls for in vivo animal models, biomechanical evaluation under cyclic loading, growth-factor
loading, and optimisation of the doping ratio. Those are the priorities of the biologists and
chemists on the team, and they're right for the material. Mine are the priorities of the person
who had to make the object.

## What this study does not establish about manufacturing

Scoped deliberately to fabrication — the biological limits are covered in
[the closed-loop breakdown](/research/bone-scaffold-closed-loop/) and listed in full on the
[data sheet](/research/mg-si-zn-hap/).

- Mechanical evaluation was **static compression only**. No fatigue testing, no cyclic loading.
  A scaffold that survives one load is not a scaffold that survives a million, and human bone gets
  loaded on the order of a million times a year.
- The scaffold's properties are **partly an artefact of the indirect route itself**. A directly
  extruded part from the same powder would not necessarily behave the same way.
- One geometry, at one scale, from one furnace profile. Nothing here establishes how the process
  behaves across a size range or on a different machine.
- The paper limits its claim to **non-weight-bearing defects**, and so do I.

## Frequently asked

{{< faq >}}

{{< faqitem question="What is indirect 3D printing of ceramics?" >}}
Instead of printing the ceramic itself, you 3D-print a negative mould — usually in a polymer like PLA — then cast a ceramic slurry into it and fire the whole assembly. The polymer burns away and leaves the ceramic part behind. It is a way of getting a printed geometry out of a material that cannot be printed directly. It is also called sacrificial mould casting or the lost-mould technique.
{{< /faqitem >}}

{{< faqitem question="What is the difference between debinding and sintering?" >}}
They are two separate thermal stages at different temperatures. Debinding, or burnout, removes the organic material — the polymer mould and the binder holding the ceramic powder together. In this work that happened at {{< fact key="paper_burnout_c" >}} °C. Sintering then fuses the remaining ceramic particles into a solid, which happened at {{< fact key="paper_sinter_c" >}} °C for {{< fact key="paper_sinter_h" >}} hours. The order matters: if organics are still burning off once the surface has densified, trapped gas cracks the part.
{{< /faqitem >}}

{{< faqitem question="How much do ceramic parts shrink during sintering?" >}}
A great deal — roughly {{< fact key="ref_shrinkage_range" >}} depending on how much ceramic is in the mix and how densely the green body was packed. Higher ceramic loading means less shrinkage: 20 wt% ink shrank 45.25 %, while 40 wt% shrank 17.8 % at the same temperature. Shrinkage is also anisotropic, greater in the Z axis than in X and Y, so CAD models need direction-dependent scale compensation rather than a single oversize factor.
{{< /faqitem >}}

{{< faqitem question="Why not use direct ink writing instead of a mould?" >}}
Because getting a bioceramic paste that extrudes cleanly and still fires into a strong part is genuinely hard. You need high solid loading for strength after firing, but that fights the fluidity needed to pass a nozzle. The published direct-extrusion scaffolds reach above 2 MPa at 70–80 % porosity (Lu et al., 2024), which is respectable but below the {{< fact key="paper_compressive_mpa" >}} MPa this indirect route achieved. Solving the rheology is, in my view, the most valuable next step.
{{< /faqitem >}}

{{< faqitem question="What pore size does a bone scaffold need?" >}}
Osteoblasts are roughly 10–50 µm across and need pores of about {{< fact key="ref_pore_cell_um" >}} µm to migrate into a structure; pores above {{< fact key="ref_pore_vascular_um" >}} µm are associated with vascularisation and new bone formation. This is why electrospun mats, despite excellent stiffness, struggle as scaffolds — their pores sit around {{< fact key="ref_electrospun_pore_um" >}} µm, far below what cells can enter. Pores must also be interconnected; sealed voids contribute porosity on paper but nothing biologically.
{{< /faqitem >}}

{{< faqitem question="Was this scaffold tested in a living body?" >}}
No. All work was in vitro. There is no animal study, no fatigue or cyclic loading test, and no data on how the scaffold behaves under real physiological loading over time. It is a fabricated and characterised prototype, at the stage before preclinical testing begins.
{{< /faqitem >}}

{{< /faq >}}

---

My role on this project was systems translation — turning chemical requirements into something
that could actually be manufactured and measured. I'm actively looking for bioinformatics and
biomedical engineering collaborations where that's the missing piece: groups with strong chemistry
or biology who need CAD, systems architecture, process design and manufacturing execution to get
from a formulation to a physical object. If that's your lab,
[get in touch](/work-with-me/).
