// Import theme from the file.
#import "themes/iss.typ": *

// Define main colors of the theme.
#let mainColor = rgb(42,60,102)
#let enumColor = rgb(42,102,45)
#let alertColor = rgb(102,42,66)
#let otherColor = rgb(102,84,42)
#let YellowColor = rgb("#E6B830")
#let BlueColor = rgb("#A5C9E6")
#let GreenColor = rgb("#73C0C1")
#let model1 = image("png/piechart-1.png")
#let model2 = image("png/piechart-2.png")
#let model3 = image("png/piechart-3.png")
#let post = image("png/post.png")
#let comments = image("png/comments.png")
#let barplot = image("png/barplot.png")
#let hicss = image("png/hicss.png")

#let motivations = (
    ("Morality","31%","52%","26%",),
    ("Environment","22%","27%","22%",),
    ("Health and Well-being","17%","27%","45%",),
    ("Responsability","20%","10%","2%",),
    ("Easiness","7%","0%","0%",),
    ("Personal Preferences","35%","13%","31%",),
)

#let capabilities = (
    ("Knowledge and skills","67%","0%","76%",),
    ("Health","43%","0%","24%",),
)

#let opportunities = (
    ("Accesaiblity","24%","10%","59%",),
    ("Affordability","33%","13%","16%",),
    ("Social environment","50%","90%","37%",),
    ("Tradition","7%","17%","2%",),
)

#let frame(stroke) = (x, y) => (
  left: if x < 1 { 0pt } else { stroke },
  right: if y < 1 and x < 4 {0pt} else {stroke},
  top: if y < 1 { 0pt } else { stroke },
  bottom: if x == 0 and y < 7 {0pt} else {stroke},
)

#let cell(country: str, color: white) = table.cell(
  country,
  fill: color.lighten(
          (25 - int(country.replace("%",""))) * 1%
  )
)

// Option of the theme.
#show: iss-theme.with(
  left-footer: [Roszczyńska-Kurasińska, Biesaga, & de Oliveira],
  short-title: [Reddit Discussion on Meat Redcution],
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

// Title slide.
#title-slide(
  authors: [Magdalena Roszczyńska-Kurasińska, Mikołaj Biesaga, & Carolina Alves de Oliveira],
  title: [A Comparative Analysis of Reddit Discussions on Meat Reduction in
  Portugal, Poland, and the United Kingdom],
  subtitle: [],
  date: datetime.today().display("[day] [month repr:long] [year]"),
  funding: [The research was supported by the European Union’s Horizon 2020
  research and innovation program (grant agreement no. 960366). The work of
  Mikołaj Biesaga was supported by the European Union’s Horizon 2020 research
  and innovation programme (grant agreement no. 952026).],
  secondlogo: none

)

// Regular slide.
#slide(title: [Outlines])[
  #v(25%)
  + Meat consumption reduction

  + COM-B model

  + Data source and analysis

  + Results for Portugal, Poland and the United Kingdom

  + Limitations and Advantages
]
#slide(title: [Introduction])[
  - Diets that #highlight[reduce or eliminate meat and animal-derived foods] have gained significant attention and popularity in the Western world.

  - #highlight[Negative health] effects of animal-based products and the #highlight[environmental impact] of animal farming (Willett et al., 2019).

  - However, for many reducing the meat intake remains the formidable challenge involoving bariers such as:
    + personal barriers and preferences;
    + practical constraints;
    + social acceptance issues;
    + financial concerns.
]

#slide(title: [COM-B (Michie, Atkins, & West, 2014)])[
  #grid(columns: (1fr,1fr),
  [
    #figure(model1)
  ],
  [
    - #highlight(fill: YellowColor)[Motivations] -- brain processes that stimulate and direct behavior, extending beyond mere goals and conscious choices.

    #text(fill: white)[Capabilities -- psychological and physical capacity to engage in the relevant activity, encompassing essential knowledge and skills.]

    #text(fill: white)[Opportunities -- external factors that exist beyond the individual, enabling or triggering the behavior.]
  ]
  )
]

#slide(title: [COM-B (Michie, Atkins, & West, 2014)])[
  #grid(columns: (1fr,1fr),
  [
    #figure(model2)
  ],
  [
    #text(fill: gray)[- Motivations -- brain processes that stimulate and direct behavior, extending beyond mere goals and conscious choices.]

    - #highlight(fill: BlueColor)[Capabilities] -- psychological and physical capacity to engage in the relevant activity, encompassing essential knowledge and skills.
    
    #text(fill:white)[Opportunities -- external factors that exist beyond the individual, enabling or triggering the behavior.]
  ]
  )
]

#slide(title: [COM-B (Michie, Atkins, & West, 2014)])[
  #grid(columns: (1fr,1fr),
  [
    #figure(model3)
  ],
  [
    #text(fill: gray)[- Motivations -- brain processes that stimulate and direct behavior, extending beyond mere goals and conscious choices.]

    #text(fill: gray)[- Capabilities -- psychological and physical capacity to engage in the relevant activity, encompassing essential knowledge and skills.]

    - #highlight(fill: GreenColor)[Opportunities] -- external factors that exist beyond the individual, enabling or triggering the behavior.
  ]
  )
]

#focus-slide(background: mainColor)[
  This study aims to use Reddit discussion data to explore the
  #highlight[motivations, opportunities, and capabilities] involved in changing
  one’s diet to plant-based, vegetarian, or reducing meat consumption.
]

#slide(title: [Data source and analysis])[
  #show link: set text(fill: blue)
  - Analyzed discussions from three Reddit threads (one per country) using keywords: #highlight[vegan, vegetarian, plant-based diet, meat reduction, flexitarian]
  
  - Data collected via Python Reddit API Wrapper (PRAW)#footnote[Reproducible code avaliable at #link("github.com/MikoBie/hicss-reddit")]

  - Thread selection criteria:
    + Prompt encouraging discussion of motivations and barriers "What is your diet? Share why you chose it." 
    + Relevance to meat consumption reduction
    + Initial question posted around 2021
    + High number of comments
]

#slide(title: [Reddit posts and comments])[
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 1em,

  [
    #grid(rows: (.5fr, 1fr),
    row-gutter: 1em,
    [
      - r/casualUK: 649
      - r/portugal: 253
      - r/Polska: 249
    ],
    [
      #figure(post)
    ],
    )
  ],
  [
    #figure(comments)
  ]
  )
]

#slide(title: [Coding framework])[

  #v(10%)
  Analysis focused on three dimensions derived from the COM-B model:
  #table(
    columns: (.35fr, .35fr, 1fr),
    rows: (auto, auto, auto),
    stroke: none,
    inset: 10pt,
    row-gutter: .5em,
    column-gutter: .1em,
    align: horizon,
    fill: (x,y) =>
    if x == 0 and y == 0 {YellowColor}
    else if x == 1 and y == 0 {YellowColor.lighten(20%)}
    else if x == 2 and y == 0 {YellowColor.lighten(20%)}
    else if x == 0 and y == 1 {BlueColor}
    else if x == 1 and y == 1 {BlueColor.lighten(20%)}
    else if x == 2 and y == 1 {BlueColor.lighten(20%)}
    else if x == 0 and y == 2 {GreenColor}
    else if x == 1 and y == 2 {GreenColor.lighten(20%)}
    else if x == 2 and y == 2 {GreenColor.lighten(20%)}
    else {white}, 
    [Motivations],
    [
      #grid(
        rows: (1cm, 1cm),
        row-gutter: 1em,
        [Automatic],
        [Reflective]
      )
    ],
    [
      #grid(
        rows: (1cm, 1cm),
        row-gutter: 1em,
        [Personal preferences],
        [Health, Moral, Environmental, Easiness, Responsability],
      )
    ],
    [Capabalities],
    [
      #grid(
        rows: (auto, auto),
        row-gutter: 1em,
        [Physical],
        [Psychological] 
      )
    ],
    [
      #grid(
        rows: (auto, auto),
        row-gutter: 1em,
        [Health],
        [Skills and knowledge] 
      )
    ],
    [Opportunities],
    [
      #grid(
        rows: (auto, auto),
        row-gutter: 1em,
        [Physical],
        [Social]
      )
    ],
    [
      #grid(
        rows: (auto, auto),
        row-gutter: 1em,
        [
          Accesibility, Affordability
        ],
        [
          Social environment, Tradition
        ]
      )
    ]
  )
]

#slide(title: [Results])[
  #figure(barplot)
]



#slide(title: [Motivations])[

#table(
  align: (x,y) => 
  if x > 0 {center + horizon}
  else {horizon},
  columns: (auto, 1fr, 1fr, 1fr),
  stroke: frame(black),
  rows: 1.5cm,
  table.header([], [*Poland*], [*Portugal*], [*United Kingdom*]),
  ..motivations
    .map(((n, poland, portugal, uk)) =>  {
      let cell = cell.with(color: YellowColor)
      (
        table.cell(n),
        cell(country: poland),
        cell(country:portugal),
        cell(country:uk)
      )
    })
    .flatten()
) 
]

#slide(title: [Opportunities])[

#v(2cm)
#table(
  align: (x,y) => 
  if x > 0 {center + horizon}
  else {horizon},
  columns: (auto, 1fr, 1fr, 1fr),
  rows: 1.5cm,
  stroke: frame(black),
  table.header([], [*Poland*], [*Portugal*], [*United Kingdom*]),
  ..opportunities
    .map(((n, poland, portugal, uk)) =>  {
      let cell = cell.with(color: GreenColor)
      (
        table.cell(n),
        cell(country: poland),
        cell(country:portugal),
        cell(country:uk)
      )
    })
    .flatten()
) 
]

#slide(title: [Capabalities])[

#v(2cm)
#table(
  align: (x,y) => 
  if x > 0 {center + horizon}
  else {horizon},
  columns: (auto, 1fr, 1fr, 1fr),
  rows: 1.5cm,
  stroke: frame(black),
  table.header([], [*Poland*], [*Portugal*], [*United Kingdom*]),
  ..capabilities
    .map(((n, poland, portugal, uk)) =>  {
      let cell = cell.with(color: BlueColor)
      (
        table.cell(n),
        cell(country: poland),
        cell(country:portugal),
        cell(country:uk)
      )
    })
    .flatten()
) 
]

#slide(title: [Limitations and Advantages])[
  #v(15%)
  #grid(
    columns: (1fr, 1fr),
    rows: (2cm, 1fr),
    column-gutter: 2em,
    [
      #set align(center)
      #smallcaps[Limitations]:
    ],
    [ 
    ],
    [
      + Reddit users are not representative for the general population.

      + Thread discussions are path-dependent and may not reveal all barriers.
    ],
    [
    ]


  )
]

#slide(title: [Limitations and Advantages])[
  #v(15%)
  #grid(
    columns: (1fr, 1fr),
    rows: (2cm, 1fr),
    column-gutter: 2em,
    [
      #set align(center)
      #smallcaps[Limitations]:
    ],
    [ #set align(center)
      #smallcaps[Advantages:]
    ],
    [
      #set text(fill: gray)
      + Reddit users are not representative for the general population.

      + Thread discussions are path-dependent and may not reveal all barriers.
    ],
    [
      + Provides insight into publicly debated barries and enablers.

      + Ecological validity.

      + Access to voices not typically included in traditional surveys or interviews.
    ]
  )
]

#slide(title: [Thank You!])[
  #figure(hicss)
]
