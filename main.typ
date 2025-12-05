// Import theme from the file.
#import "themes/iss.typ": *
#import "@preview/showybox:2.0.4": showybox

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

// Title slide.
#title-slide(
  authors: [Mikołaj Biesaga],
  title: [What every psychologist should know about Computational Social Science?],
  subtitle: [],
  date: datetime.today().display("[day] [month repr:long] [year]"),
  funding: [],
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
]