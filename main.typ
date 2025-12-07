// Import theme from the file.
#import "themes/iss.typ": *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/cetz:0.4.2"
#import "@preview/itemize:0.2.0" as el

// Define main colors of the theme.
#let mainColor = rgb(10,20,86)
#let alertColor = rgb(230,135,67)
#let enumColor = rgb(124,36,43)
#let otherColor = rgb(194,213,238)
#let otherColor2 = rgb(253,242,212)

#let logo = image("png/efsta2.svg")
#let logo2 = image("png/efsta.svg", width: 4cm)
#let corruption1 = image("png/corruption_bmi.jpg", width: 100%, fit: "contain")
#let corruption = image("png/corruption_bmi.png", width: 100%, fit: "contain")
#let qr = image("png/qr.png")
#let theory = image("png/theory_formulation.png", width: 100%)
#let model = image("png/modeling.png", width: 100%)
#let observation = image("png/observation.png")
#let questionnaire = image("png/questionnaire.png")
#let research = cetz.canvas({
  import cetz.draw: *
  content((0,0), box(observation, width: 4cm), anchor: "center", name: "observation")
  content((6.5,0), box(theory, width: 4cm), anchor: "center", name: "theory")
  content((13,0), box(model, width: 4cm), anchor: "center", name: "model")
  content((19.5,0), box(questionnaire, width: 4cm), anchor: "center", name: "questionnaire")
  content((0,-5), [#smallcaps[Observation]], anchor: "center")
  content((6.5,-5), [#smallcaps[Theory Formulation]], anchor: "center")
  content((13,-5), [#smallcaps[Model Creation]], anchor: "center")
  content((19.5,-5), [#smallcaps[Resaerch]], anchor: "center")
})
#let email = image("png/email.png")
#let card = image("png/loyalty-card.png")
#let test = image("png/pregnancy-test.png")
#let phone = image("png/telephone.png")

#let maybe-image(path, ..args) = context {
  let path-label = label(path)
   let first-time = query((context {}).func()).len() == 0
   if first-time or query(path-label).len() > 0 {
    [#image(path, ..args)#path-label]
  } else {
  }
}

// Option of the theme.
#show: iss-theme.with(
  left-footer: [Mikołaj Biesaga],
  short-title: [What every psychologist should know about Computational Social Science?],
  color: mainColor,
  logo-header: logo,
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

// Title slide.
#title-slide(
  authors: [Mikołaj Biesaga],
  title: [What every psychologist should know about Computational Social Science?],
  subtitle: [],
  date: [8 December 2025],// datetime.today().display("[day] [month repr:long] [year]"),
  funding: [#link("mailto:m.biesaga@uw.edu.pl")[m.biesaga\@uw.edu.pl]],
  secondlogo: logo2

)

// Regular slide.
#slide(title: [Outlines])[
  #v(25%)
  + Does BMI predict political corruption?

  + Does Target know whether we are pregnant or not?

  + How to talk to parents efficiently?

  + Why do we need models?

  + Motivational examples 
]

#slide(title: [Before we start])[
  #figure(qr)
]

#new-section-slide("Does BMI predict political corruption?")

#slide(title: [Blavatskyy, 2021 -- IgNobel 2021])[
  #figure(
    block(height: 95%)[#corruption1],
    caption: [
      Scatterplot of median estimated ministers’ body-mass index against Transparency International Corruption Perceptions Index 2017 (with a linear trend), where lower values of CPI indicate greater corruption],
    )
]

#slide(title: [Blavatskyy, 2021 -- IgNobel 2021])[
  #figure(
    block(height: 100%)[#corruption],
    caption: [
      Median estimated ministers’ body-mass index and five conventional measures
      of corruption for 15 post-Soviet states
    ],
    kind: table
    )
]

#slide(title: [What is Computational Social Science?])[
  #v(25%)
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
    title: "Data Science",
    [
      It describes the theory and practice of extracting knowledge and
      insight from data.
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
    title: "Computational Social Science",
    [
      It is a data-driven approach that uses computational methods in studying
      social phenomena.
    ]
    )
  }
  )
]

#slide(title: [What is Computational Social Science?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 6cm)
  }
  #v(15%)
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: (dash: "dashed", paint: alertColor, thickness : 0pt))
    content((0, 0), research, name: "research", anchor: "center")
    on-layer(1, {
      circle((9.75,1.5), radius: 3)
    })
  })
  #footnote[All flat icons from #link("https://www.flaticon.com")[https://www.flaticon.com]]
]

#slide(title: [What is Computational Social Science?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 6cm)
  }
  #v(15%)
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: (dash: "dashed", paint: alertColor, thickness : 2pt))
    content((0, 0), research, name: "research", anchor: "center")
    on-layer(1, {
      circle((9.75,1.5), radius: 3)
    })
  })
  #footnote[All flat icons from #link("https://www.flaticon.com")[https://www.flaticon.com]]
]

#slide(title: [Computational methods])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list
  #v(15%)
  - [x] Extraction of unstructured data from external digital (i.e., web-based) sources

  - [/] Working with big datasets

  - [/] Computer simulations

  - [x] Analysis of textual data (Natural Language Processing -- NLP)
  
  - [ ] Designing experiments

  - [ ] Networks and relational data analysis

  - [ ]...
]

#new-section-slide("Does Target know whether we are pregnant?")

#slide(title: [Does Target know whether we are pregnant?])[
  #set align(center+horizon)
  #let target = image("png/targetlogo.jpeg")
  #figure(
    target,
    caption: [
      from #link("https://corporate.target.com/media/collection/b-roll-and-press-materials/target-logos")[www.corporate.target.com]
    ])
]

#slide(title: [Does Target know whether we are pregnant?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 4cm)
  }
  #v(20%)
  #cetz.canvas({
    import cetz.draw: *
    content((0,0), box(email, width: 3cm), anchor: "center", name: "email")
    content((6,0), box(width: 3cm), anchor: "center", name: "phone")
    content((12,0), box(width: 3cm), anchor: "center", name: "card")
    content((18,0), box(width: 4cm), anchor: "center", name: "test")
    content((0,-4), [#smallcaps[Congrats Email]], anchor: "center")
  })
  #footnote[All flat icons from #link("https://www.flaticon.com")[https://www.flaticon.com]]
]

#slide(title: [Does Target know whether we are pregnant?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 4cm)
  }
  #v(20%)
  #cetz.canvas({
    import cetz.draw: *
    content((0,0), box(email, width: 3cm), anchor: "center", name: "email")
    content((6,0), box(phone, width: 3cm), anchor: "center", name: "phone")
    content((12,0), box(width: 3cm), anchor: "center", name: "card")
    content((18,0), box(width: 4cm), anchor: "center", name: "test")
    content((0,-4), [#smallcaps[Congrats Email]], anchor: "center")
    content((6,-4), [#smallcaps[Angry Call]], anchor: "center")
  })
  #footnote[All flat icons from #link("https://www.flaticon.com")[https://www.flaticon.com]]
]

#slide(title: [Does Target know whether we are pregnant?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 4cm)
  }
  #v(20%)
  #cetz.canvas({
    import cetz.draw: *
    content((0,0), box(email, width: 3cm), anchor: "center", name: "email")
    content((6,0), box(phone, width: 3cm), anchor: "center", name: "phone")
    content((12,0), box(card, width: 3cm), anchor: "center", name: "card")
    content((18,0), box(width: 4cm), anchor: "center", name: "test")
    content((0,-4), [#smallcaps[Congrats Email]], anchor: "center")
    content((6,-4), [#smallcaps[Angry Call]], anchor: "center")
    content((12,-4), [#smallcaps[Loyalty Card]], anchor: "center")
  })
  #footnote[All flat icons from #link("https://www.flaticon.com")[https://www.flaticon.com]]
]

#slide(title: [Does Target know whether we are pregnant?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 4cm)
  }
  #v(20%)
  #cetz.canvas({
    import cetz.draw: *
    content((0,0), box(email, width: 3cm), anchor: "center", name: "email")
    content((6,0), box(phone, width: 3cm), anchor: "center", name: "phone")
    content((12,0), box(card, width: 3cm), anchor: "center", name: "card")
    content((18,0), box(test, width: 3cm), anchor: "center", name: "test")
    content((0,-4), [#smallcaps[Congrats Email]], anchor: "center")
    content((6,-4), [#smallcaps[Angry Call]], anchor: "center")
    content((12,-4), [#smallcaps[Loyalty Card]], anchor: "center")
    content((18,-4), [#smallcaps[Test]], anchor: "center")
  })
  #footnote[All flat icons from #link("https://www.flaticon.com")[https://www.flaticon.com]]
]

#slide(title: [Digital footprints])[
  #showybox(
    frame: (
      border-color: blue.darken(50%),
      title-color: blue.lighten(60%),
      body-color: otherColor.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "bold",
      align: left
    ),
    shadow: (
      offset: 3pt,
    ),
    title: "Digital footprints (or digital shadow)",
    [
      It is a unique traceable set of actions, contributions, or communications
      manifested on the Internet or digital devices.
    ],
    columns(2)[
      #showybox(
        title-style: (
          color: black,
          weight: "bold",
          align: center
        ),
        frame: (
          border-color: yellow.darken(50%),
          title-color: yellow.lighten(60%),
          body-color: otherColor2.lighten(80%)
        ),
        title: "Passive",
        [
          It is a trail of data you create #underline[unintentionally], i.e., IP address, device type, operating system, etc.         
        ]
      )
      #colbreak()
      #showybox(
        title-style: (
          color: black,
          weight: "bold",
          align: center
        ),
        frame: (
          border-color: red.darken(50%),
          title-color: red.lighten(60%),
          body-color: enumColor.lighten(900%)
        ),
        title: "Active",
        [
          Includes data that you #underline[intentionally] submit online, i.e., emails, TikTok dances, photos, etc.
        ],
      )
    ]
  )

]

#slide(title: [Data Sources])[
  #set align(center+horizon)
  #let target = image("png/data_everywhere.png")
  #figure(
    target,
    caption: [
      from #link("imgflip.com")[imgflip.com]
    ])
]

#slide(title: [Data Sources])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list
  #v(15%)
  - [ ] webpages
  
  - [x] social media
  
  - [ ] smart devices

  - [ ] digital behavioral data

  - [ ] mobile phone networks

  - [ ] government data

  - [ ] ...
]

#focus-slide(background: mainColor, [The fact that #highlight[you can] get the data #highlight[does not mean you should.]])

#new-section-slide("How to talk to parents efficiently?")

#slide(title: [Kosinski, Stillwell, & Graepel, 2013])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list
  #v(15%)
  - [ ] 2007 David Stillwell creates #highlight[myPersonality] Facebook App to share a personality questionnaire

  - [ ] by 2012, 6 million people completed the personality questionnaire

  - [ ] 40% of participants gave informed consent to share their Facebook data

  - [ ] Private traits and attributes are predictable from digital records of human behavior (Kosinski, Stillwell, & Graepel, 2013)
]

#slide(title: [Kosinski, Stillwell, & Graepel, 2013])[
  #let s1 = image("png/Kosinski_S1.jpg")
  #let s2 = image("png/Kosinski2_S1.jpg")
  #show figure.caption: set align(left)
  #grid(columns: (1fr, 1fr),
        column-gutter: 2em,
    {
      figure(
        s1,
        caption: [
          Prediction accuracy of classification for dichotomous/dichotomized attributes expressed by the AUC.
        ]
      )
    },
    {
      figure(
        s2,
        caption: [
          The prediction accuracy of regression for numeric attributes and traits is expressed by the Pearson correlation coefficient between predicted and actual attribute values. 
        ]
      )
    }
  )
]

#slide(title: [Micro-targeting])[
  #let micro = image("png/microtargeting.jpeg")
  #set align(center+horizon)
  #v(15%)
  #figure(
    micro,
    caption: [
      Design by Agata Biesaga
    ])
]

#focus-slide(background: mainColor, [Micro-targeting is sending a message to a highly specific portion of an audience based on particular information.])

#slide(title: [Matz et al., 2017])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list.with(fill: (enumColor))
  #v(15%)
  - [x] 2007 David Stillwell creates #highlight[myPersonality] Facebook App to share a personality questionnaire

  - [x] by 2012, 6 million people completed the personality questionnaire

  - [x] 40% of participants gave informed consent to share their Facebook data

  - [x] Private traits and attributes are predictable from digital records of human behavior (Kosinski, Stillwell, & Graepel, 2013)

  - [ ] Psychological targeting as an effective approach to digital mass persuasion (Matz et al., 2017)
]

#slide(title: [Matz et al., 2017])[
  #let s = image("png/Kosinski_S2.jpg", height: 100%)
  #figure(
    s,
    caption: [
      Examples of ads aimed at audiences characterized by high and low extraversion (A) as well as high and low openness (B).
    ]
  )
]

#slide(title: [Matz et al., 2017])[
  #let s = image("png/Kosinski2_S2.jpg", height: 90%)
  #figure(
    s,
    caption: [
      Interaction effects of audience and ad personality on conversion rates in study 1 (Left) and study 2 (Right).
    ]
  )
]

#slide(title: [Microtargeting])[
  #set align(center+horizon)
  #let target = image("png/zuck.jpg")
  #figure(
    target,
    caption: [
      from #link("imgflip.com")[imgflip.com]
    ])

]

#focus-slide(background: mainColor,
 [
    #set align(center)
    #smallcaps[However...]
  ])

#slide(title: [Discussion])[
  #v(15%)
  + Instead of testing whether ads performed #highlight[better when targeted than when untargeted] to the general population, Matz et al. (2017) used a weaker test in two of their three studies (Sharp, Danenberg, & Bellman, 2018).

  + Users are #highlight[not randomly assigned] to different ads, and individuals may even receive multiple ad types (Eckles, Gordon, & Johnson, 2018).

  + Ad platforms like Facebook optimize campaign performance by #highlight[showing ads to users whom the platform expects are more likely] to fulfill the campaign’s objective (Eckles, Gordon, & Johnson, 2018).
]

#slide(title: [Eckles, Gordon, & Johnson, 2018])[
  #let s = image("png/eckels.jpeg", height: 100%)
  #figure(
    s,
    caption: [
      Distribution of all reported user characteristics: age in study 1 (A), age (B), and gender (C) in study 2. 
    ]
  )
]

#new-section-slide("Why do we need models?")

#slide(title: [What is a model?])[
  #let vogue = image("png/vogue.jpg")
  #figure(
    vogue,
    caption: [
      from #link("https://archive.vogue.com/issue/18921224")[Vogue] (December 24, 1982)
    ]
  )
]

#focus-slide(background: mainColor,[In simple terms a model is a #highlight[simplified representation] of a system (reality) that
helps to understand how the system works/worked in the past/will work in the
future.])

#slide(title: [Why do we need models?])[
  #v(15%)
  + Formalizing a theory into a model allows the researcher to #highlight[describe their ideas in a precise], unambiguous way (Goldstone & Janssen, 2005; Epstein, 2008).

  + Models are conceptually precise, their #highlight[assumptions are clear]; they allow formal deduction and an easy way to verify their internal validity (Timpone & Taber, 1996).

  + Last but not least, they provide an #highlight[unambiguous way to communicate] within the scientific community (Nowak, Rychwalska, & Borkowski, 2015).
]

#slide(title: [Computer Simulations])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 6cm)
  }
  #let simulation = image("png/simulation.png")
  #v(10%)
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: (dash: "dashed", paint: alertColor, thickness : 2pt))
    content((0,0), box(observation, width: 4cm), anchor: "center", name: "observation")
    content((6.5,0), box(theory, width: 4cm), anchor: "center", name: "theory")
    content((13,0), box(model, width: 4cm), anchor: "center", name: "model")
    content((19.5,0), box(simulation, width: 4cm), anchor: "center", name: "simulation")
    content((0,-5), [#smallcaps[Observation]], anchor: "center")
    content((6.5,-5), [#smallcaps[Theory Formulation]], anchor: "center")
    content((13,-5), [#smallcaps[Model Creation]], anchor: "center")
    content((19.5,-5), [#smallcaps[Computer Simulation]], anchor: "center")
    circle("simulation", radius: 3cm)
  })
  #footnote[All flat icons from #link("https://www.flaticon.com")[https://www.flaticon.com]]
]

#slide(title: [Dynamic models of segregation])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list.with(fill: (enumColor))
  #v(15%)

  - [x] In 1965, the last of #link("https://en.wikipedia.org/wiki/Jim_Crow_laws")[Jim Crow’s] racial segregation laws were overturned.
  
  - [/] Despite much effort and investment, #highlight[segregation still remains a major issue] in the U.S. and elsewhere to this date (Massey, 2020).
  
  - [ ] "If an individual is surrounded by more individuals of different types than the number of individuals of their own type, then the individual moves from the current location to a random empty location." (Schelling, 1971)
]

#slide(title: [Schelling, 1971])[
  #let schelling = image("png/schelling1.png", height: 25.5%)
  #let schelling2 = image("png/schelling2.png", height: 50%)

  #figure(
    [#schelling #schelling2],
    caption: [
      Circles and pluses represent two distinct groups of people. Dots show who is unhappy with their surrounding.
    ])
]

#slide(title: [Schelling, 1971])[
  #let case = image("png/polygons.png")

  #figure(
    case,
    caption: [
      by Nicky Case from #link("https://ncase.me/polygons/")[https://ncase.me/polygons/].
    ])
]

#slide(title: [Why simulate?])[
  #v(25%)

  + To build intuition.

  + To test untestable otherwise scenarios (\#thereIsNoPlanetB).

  + To make predictions & what ifs.
]

#new-section-slide("Motivational examples")

#slide(title: [Natural Language Processing])[
  #let nlp = image("png/nlp.jpg")
  #set align(center+horizon)
  #v(15%)
  #figure(
    nlp,
    caption: [
      Design by Agata Biesaga
    ])
]

#focus-slide(background: mainColor, [
  Natural Language Processing (NLP) is an analytical approach that uses a set of
  (usually) computer-based methods to extract meaning, topics, or sentiment from
  natural language data (written or spoken). In other words, #highlight()[it is a
  set of computer algorithms that tries to synthesize human language.]
])

#slide(title: [Bajkowska & Biesaga, 2023])[
  #let poster = image("png/poster.png")
  #set align(center+horizon)
  #figure(
    poster,
    caption: [
      Design by Katarzyna Bajkowska #link("https://psych.pan.pl/pracownik/mgr-katarzyna-bajkowska/")[(Institute of Psychology Polish Academy of Sciences)]
    ])

]

#slide(title: [Roszczyńska-Kurasińska, Biesaga, & de Oliveira, 2025])[
  #let article = image("png/hicss.png")
  #set align(center+horizon)
  #figure(
    article,
    )
]

#slide(title: [Roszczyńska-Kurasińska, Biesaga, & de Oliveira, 2025])[
  #let model = image("png/piechart-1.png")
  #set align(center+horizon)
  #figure(
    model,
    caption: [
      Behavioral Change Model -- COM-B (Michie, Atkins, & West, 2014)
    ]
  )
]

#slide(title: [Roszczyńska-Kurasińska, Biesaga, & de Oliveira, 2025])[
  #let s = image("png/barplot.png")
  #set align(center+horizon)
  #figure(
    s,
    caption: [
      Distribution of the components of the COM-B Model by country
    ]
    )
]

#slide(title: [Przyłuska & Biesaga, 2025])[
  #let sofia = maybe-image("png/sofia.jpg", height: 90%)
  #let grid-list = el.default-list.with(
  body-indent: (0pt, auto),
  enum-spacing: (auto, 15pt),
  body-format: (
    whole: (
      stroke: (1pt, auto),
      radius: (10pt, auto),
      fill: (otherColor, auto),
      inset: ((bottom: 5pt), auto),
    ),
    outer: (
      stroke: it => {
        if it.level == 1 {
          if it.n >= 2 {
            (top: 1pt + gray)
          }
        } else {
          auto
        }
      },
      inset: ((bottom: 10pt, top: 10pt, rest: 10pt), auto),
    ),
    style: (
      size: (15pt, 12pt),
      weight: ("black", "bold")
    ),
  ),

  label-format: ([], auto),
  fill: enumColor
  )

  #grid(columns: (1fr, .5fr),
  [
  #grid-list[
  #set par(justify: true)
  - Who?
    - Sofia Przyłuska (MISMaP, University of Warsaw) 
  - What?
    - Employing Neo-Psychometric Natural Language Processing in Classification of Anti-Trans Social Media Posts

  - When?
    - 14.20, Tuesday (9th of December)

  - Where?
    - FGH Room
  ]],
  [
    #figure(sofia)
  ]
  )
]

#new-section-slide("Thank You!")

#slide(title: [Bibliography])[
  #set text(size: 11pt)
  #set par(hanging-indent: 2em, justify: true, spacing: 1em)
  Blavatskyy, P. (2021). Obesity of politicians and corruption in post‐Soviet countries. Economics of Transition and Institutional Change, #emph[29]\(2), 343–356. 

  Eckles, D., Gordon, B. R., & Johnson, G. A. (2018). Field studies of psychologically targeted ads face threats to internal validity. #emph[Proceedings of the National Academy of Sciences], #emph[115]\(23), E5254–E5255. 

  Epstein, J. M. (2008) ”Why Model?” #emph[Journal of Artificial Societies and Social Simulation], #emph[11]\(4), 12.

  Goldstone, R. L., & Janssen, M. A. (2005). Computational models of collective behavior. #emph[Trends in Cognitive Sciences], #emph[9]\(9), 424-430.

  #link("https://www.forbes.com/sites/kashmirhill/2012/02/16/how-target-figured-out-a-teen-girl-was-pregnant-before-her-father-did/?sh=1333c4646668")[How Target Figured Out A Teen Girl Was Pregnant Before Her Father Did.]

  Kosinski, M., Stillwell, D., & Graepel, T. (2013). Private traits and attributes are predictable from digital records of human behavior. #emph[Proceedings of the National Academy of Sciences], #emph[110]\(15), 5802–5805. 

  Matz, S. C., Kosinski, M., Nave, G., & Stillwell, D. J. (2017). Psychological targeting as an effective approach to digital mass persuasion. #emph[Proceedings of the National Academy of Sciences], #emph[114]\(48), 12714–12719. 

  Massey, D.S. (2020). Still the Linchpin: Segregation and Stratification in the USA. #emph[Race and Social Problems], #emph[12], 1–12. 

  Nowak, A., Rychwalska, A., & Borkowski, W. (2013). Why Simulate? To Develop a Mental Model. #emph[Journal of Artificial Societies and Social Simulation], #emph[16]\(3), 12.

  Roszczyńska-Kurasińska, M., Biesaga, M., & de Oliveira, C. A. (2025). A Comparative Analysis of Reddit Discussions on Meat Reduction in Portugal, Poland, and the United Kingdom. #emph[Proceedings of the 58th Hawaii International Conference on System Sciences], 2532-2541.

  Sharp, B., Danenberg, N., & Bellman, S. (2018). Psychological targeting. #emph[Proceedings of the National Academy of Sciences of the United States of America], #emph[115]\(34), E7890. 

  Schelling, T. C. (1971). DYNAMIC MODELS OF SEGREGATION. #emph[Journal of Mathematical Psychology], #emph[1], 143–186.

  Timpone, R. J., & Taber, C. S. (1996). #emph[Computational Modeling]. London: SAGE.
]