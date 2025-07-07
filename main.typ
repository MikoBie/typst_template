// Import theme from the file.
#import "themes/iss.typ": *

// Define main colors of the theme.
#let mainColor = rgb(42,60,102)
#let enumColor = rgb(42,102,45)
#let alertColor = rgb(102,42,66)
#let otherColor = rgb(102,84,42)

// Option of the theme.
#show: iss-theme.with(
  left-footer: [Biesaga],
  short-title: lorem(5),
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
  authors: ([Mikołaj Biesaga]),
  title: lorem(8),
  subtitle: lorem(10),
  date: datetime.today().display("[day] [month repr:long] [year]"),
  funding: [#lorem(20)],
  secondlogo: none

)

// Regular slide.
#slide(title: lorem(5))[
  #lorem(20)
  + #lorem(10)
  + #lorem(10)
  + #highlight[#lorem(10)]
]

#focus-slide(background: mainColor)[
  #lorem(10)
]