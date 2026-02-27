// Import theme from the file.
#import "themes/iss.typ": *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/cetz:0.4.2"
#import "@preview/itemize:0.2.0" as el

// Define main colors of the theme.
#let mainColor = rgb(10,20,86)
#let enumColor = rgb(124,36,43)
#let alertColor = rgb(124,36,43)
#let enumColor = rgb(230,135,67)
#let otherColor = rgb(194,213,238)
#let otherColor2 = rgb(253,242,212)


// Option of the theme.
#show: iss-theme.with(
  left-footer: [Biesaga & Roszczyńska-Kurasińska],
  short-title: [Believing in fake news],
  color: mainColor,
)


// Global settings.
#set text(font: "New Computer Modern", weight: "semibold", size: 20pt, hyphenate: false)
#set strong(delta: 100)
#set par(justify: true)
#set enum(numbering: n => block(fill: enumColor, radius: 2pt, inset: .1em)[#text(fill: white, [#n.])])
#show highlight: set highlight(fill: alertColor)
#show highlight: it => [
  #set text(fill: white)
  #it
]
#show figure.caption: set text(size: 12pt)
#show figure: set figure.caption(separator: ".")
#show figure.where(kind: table): set figure.caption(position: top)
#show smallcaps: set text(font: "New Computer Modern")
#show link: it => {
  set text(blue.darken(20%))
  underline(it)
}
#show footnote: it =>{}
#set footnote(numbering: it => {})

//// Title slide.
//#title-slide(
//  authors: [Mikołaj Biesaga],
//  title: [What every psychologist should know about Computational Social Science?],
//  subtitle: [],
//  date: [8 December 2025],// datetime.today().display("[day] [month repr:long] [year]"),
//  funding: [#link("mailto:m.biesaga@uw.edu.pl")[m.biesaga\@uw.edu.pl]],
//  secondlogo: logo2
//
//)

#slide(title: [Dual process vs unimodel])[

Dual process theories of reasoning point to the existence of #highlight[two distinct cognitive systems that differ in their processing style, speed, and level of consciousness] (Evans & Stanovich, 2013):
  - central and the peripheral routee (_Elaboration Likelihood Model_, e.g., Petty & Cacioppo, 1986);
  - systematic and heuristic modes (_Heuristic-Systematic Model_, e.g., Eagly & Chaiken, 1993).
On the other hand, unimodel theories of reasoning suggest:
  - the existence of a single cognitive system that can operate in #highlight[different modes depending on the context and task demands] (Kruglanski & Thompson, 1999).
]
#slide(title: [Role of reflection in fake news])[
  #v(15%)
  #grid(columns: (1fr, 1fr),
        column-gutter: 1em,
  {
    showybox(
    frame: (
      border-color: yellow.darken(50%),
      title-color: yellow.lighten(60%),
      body-color: otherColor2.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "bold",
      align: center
    ),
    shadow: (
      offset: 3pt,
    ),
    title: "Motivational Reasoning",
    [
      An individual’s motivations or goals shape their reasoning and judgment processes (Kunda, 1990).
    ]
    )
  },
  {
    showybox(
    frame: (
      border-color: blue.darken(50%),
      title-color: blue.lighten(60%),
      body-color: otherColor.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "bold",
      align: center
    ),
    shadow: (
      offset: 3pt,
    ),
    title: "Reflective Reasoning",
    [
      Reflective thinking inhibits automatic heuristic responses and facilitates questioning endorsed beliefs by prompting deliberation (Evans & Stanovich, 2013; Pennycook & Rand, 2021).
    ]
    )
  }
  )
]

#slide(title: [Motivated reasoning and fake news])[
  - information processing is influenced by the motivation to confirm or support pre-existing beliefs (Faragó et al., 2020; Kahan, 2015).
  - individuals tend to protect their identity and are inclined to readily believe content that aligns with their perspectives while approaching content contradicting their views with a high degree of skepticism (Kahan, 2013).
  - selectively accepting evidence that confirms pre-existing beliefs while disregarding contradictory information (Kahan et al., 2007).

The MRA predicts that individuals who #highlight[identify with a particular political affiliation] will, through reflecting thinking, #highlight[become more attached to their beliefs, increase their tendency to believe fake news that supports their political identity,] and exhibit a strengthened tendency under conditions where political identity becomes more salient.
]

#slide(title: [Reflective reasoning and fake news])[
  - cognitive skills provided by reflection prompt individuals to adopt a critical perspective (Evans, 2008), even in their worldviews (Bago et al., 2020).
  - reflection enables individuals to scrutinize the available information, it facilitates a more accurate discernment of the truth (Pennycook & Rand, 2021; Pennycook, 2023).

The RRA predicts that #highlight[reflection induces cognitive decoupling, leading to enhanced discernment of truth and decreased belief in fake news, including content aligning with individuals’ political identities.]
]

#focus-slide(background: mainColor, [This is all good, but how can we make sure that people use reflection reasoning when they are exposed to fake news?])

#slide(title: [Solutions?])[
  #v(15%)
  - #highlight[Debiasing training] includes training to increase awareness of three commonly observed cognitive biases: the semantic illusion, the base rate fallacy, and the availability bias (Isler et al., 2020).
  - #highlight[Digital literacy interventions] includes enhancing the ability to distinguish between fake and true news by providing individuals with targeted applications specific to the context of fake news. These interventions can be divided into three categories: nudges, boosts, and refutation (Alon et al., 2024).
]

#slide(title: [Not really...])[
  #v(15%)
  - #highlight[Reflection reduced Democrats’ willingness to spread fake news, yet it did not affect Republicans.] These outcomes underscore the significant role of identity in the assessment of fake news and reveal that the mitigating effect of reflection is contingent upon an individual’s identity group (Bayrak, Boyacioglu, & Yilmaz, 2025).
  - While debunking is slightly more effective than prebunking, both approaches require constant updating to keep pace with the evolving nature of misinformation. #highlight[This might lead to people's cognitive overload and consequently backing off from the topic] (Sadura et al., 2026).
]

#slide(title: [Bibliography])[
  #set text(size: 11pt)
  #set par(hanging-indent: 2em, justify: true, spacing: 1em)
  Alon, A. T., Rahimi, I. D., & Tahar, H. (2024). Fighting fake news on social media: A comparative evaluation of digital literacy interventions. Current Psychology, 43(19), 17343–17361. https://doi.org/10.1007/s12144-024-05668-4
  
  Bago, B., Rand, D. G., & Pennycook, G. (2020). Fake news, fast and slow: Deliberation reduces belief in false (but not true) news headlines. Journal of Experimental Psychology: General, 149(8), 1608–1613. https://doi.org/10.1037/xge0000729
  
  Bayrak, F., Boyacioglu, I., & Yilmaz, O. (2025). Does reflection increase accuracy rather than bias in the assessments of political fake news? Current Psychology, 44(7), 5778–5795. https://doi.org/10.1007/s12144-025-07578-5
  
  Eagly, A. H., & Chaiken, S. (1993). The psychology of attitudes. The Psychology of Attitudes., xxii, 794–xxii, 794.
  
  Evans, J. St. B. T. (2008). Dual-Processing Accounts of Reasoning, Judgment, and Social Cognition. Annual Review of Psychology, 59(1), 255–278. https://doi.org/10.1146/annurev.psych.59.103006.093629
  
  Evans, J. St. B. T., & Stanovich, K. E. (2013). Dual-Process Theories of Higher Cognition: Advancing the Debate. Perspectives on Psychological Science, 8(3), 223–241. https://doi.org/10.1177/1745691612460685
  
  Faragó, L., Kende, A., & Krekó, P. (2020). We Only Believe in News That We Doctored Ourselves: The Connection Between Partisanship and Political Fake News. Social Psychology, 51(2), 77–90. https://doi.org/10.1027/1864-9335/a000391
  
  Isler, O., Yilmaz, O., & Dogruyol, B. (2020). Activating reflective thinking with decision justification and debiasing training. Judgment and Decision Making, 15(6), 926–938. https://doi.org/10.1017/S1930297500008147
  
  Kahan, D. M. (n.d.). The Politically Motivated Reasoning Paradigm.
  
  Kahan, D. M., Braman, D., Gastil, J., Slovic, P., & Mertz, C. K. (2007). Culture and Identity‐Protective Cognition: Explaining the White‐Male Effect in Risk Perception. Journal of Empirical Legal Studies, 4(3), 465–505. https://doi.org/10.1111/j.1740-1461.2007.00097.x
  
  Kruglanski, A. W., & Thompson, E. P. (1999). Persuasion by a Single Route: A View From the Unimodel. Psychological Inquiry, 10(2), 83–109. https://doi.org/10.1207/S15327965PL100201
  
  Kunda, Z. (1990). The Case for Motivated Reasoning. Psychological Bulletin, 108(3), 480–495.

  Pennycook, G. (2023). A framework for understanding reasoning errors: From fake news to climate change and beyond. Advances in Experimental Social Psychology, 67, 131–208. https://doi.org/10.1016/bs.aesp.2022.11.003
  
  Pennycook, G., & Rand, D. G. (2019). Lazy, not biased: Susceptibility to partisan fake news is better explained by lack of reasoning than by motivated reasoning. Cognition, 188, 39–50. https://doi.org/10.1016/j.cognition.2018.06.011
  
  Petty, R. E., & Cacioppo, J. T. (1986). THE ELABORATION LIKELIHOOD MODEL OF PERSUASION. Advances in Experimental Social Psychology, 19, 124–205.
  
  Sadura, P., Gliński, P., Matyja, B., Oleksy, T., Pruszyńska, A., & Wnuk, A. (2025). ‘Wiem, że to manipulacja, ale i tak się denerwuję’ Polacy w epoce dezinformacji. Fundacja Pole Dialogu.

]
