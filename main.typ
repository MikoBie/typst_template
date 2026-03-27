// Import theme from the file.
#import "themes/iss.typ": *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/cetz:0.4.2"
#import "@preview/cetz-plot:0.1.3"
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
  left-footer: [Biesaga],
  short-title: [Tworzenie ciągów pseudolosowych: zdolność czy kombinacja funkcji poznawczych?],
  color: mainColor,
)


// Global settings.
#set text(font: "New Computer Modern", weight: "semibold", size: 20pt, hyphenate: false, lang: "eng")
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
#show smallcaps: it =>{
  set text(font: "New Computer Modern")
  set align(center)
  it
}
#show link: it => {
  set text(blue.darken(20%))
  underline(it)
}
#show footnote: it =>{}
#set footnote(numbering: it => {})
#show: el.default-enum-list.with(fill: (enumColor, alertColor))

// Images

// Title slide.
#title-slide(
  authors: [Mikołaj Biesaga],
  title: [],
  subtitle: [],
  date: datetime.today().display("[day] [month repr:long] [year]"),
  funding: [#link("mailto:m.biesaga@uw.edu.pl")[m.biesaga\@uw.edu.pl]],
  secondlogo: image("png/mitemi_logo.jpg")
)

#slide(title: [Outlines])[
  #v(20%)
  1. Narratives

  2. Methods

  3. Examples

]

#slide(title: [Narratives])[
  - People are "storytelling animals" (Gottshall, 2012). People are not computers and they think with stories not with data (Robinson & Hawpe, 1986).

  - People create subjectively consistent story in which they are the main hero (McAdams, 1986).

  - Whenever they find themselves in a new situation or face a decision, people use narratives to understand the circumstances and compare potential scenarios (Beach, 2021).

  - #highlight[Thus, stories are the primary tool by which people experience the world. They provide meaning to reality (Popova, 2015).]

]

#slide(title: [What are narratives?])[
  #v(20%)
  #grid(columns: (1fr, 1fr,),
  column-gutter: 40pt,
  align: (center, center),
  [
    #showybox(
      frame: (
        border-color: blue.darken(50%),
        title-color: blue.lighten(60%),
        body-color: blue.lighten(80%)
      ),
      title-style: (
        color: black,
        weight: "extrabold",
        align: center
      ),
      title: [Narratives tell us:],
      [
        - What is this?
        - How is the situation chaning?
        - Who are the actors?
      ]
    )
  ],
  [
    #showybox(
      frame: (
        border-color: yellow.darken(50%),
        title-color: yellow.lighten(60%),
        body-color: yellow.lighten(80%)
      ),
      title-style: (
        color: black,
        weight: "extrabold",
        align: center
      ),
      title: [Narratvies perform 3 functions:],
      [
        - Organize our perception
        - Guide our actions
        - Synchronize collective actions
      ]
    )
  ])

]

#slide(title:[Narrative types])[
  #show: align.with(center)
  #show: text.with(size:18pt)
  #grid(columns: 5,
  column-gutter: 30pt,
  [
    #cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *
      set-style(axes: (stroke: 2pt),
       stroke: (thickness: 3pt),
       )
      plot.plot(size: (4,4),
      y-label: "",
      name: "plot",
      x-label: "",
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "left",
      {
        plot.add(((.1,.1),(1,1)), style: (stroke: none))
        plot.add-anchor("start", (0.2, 0.2))
        plot.add-anchor("stop", (0.9, 0.9))
      }
      )
      line("plot.start","plot.stop", name: "line", stroke: (paint:red), mark: (end: ">", fill: red))
      content("plot.south", [#smallcaps[Progress]], padding: (bottom: -1cm))
      content(("plot.south", 50%, (2.5,-3.5)), box(width: 5cm)[#show: text.with(size:16pt);Historically, the world has been getting better with each decade.], anchor: "north")
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *
      set-style(axes: (stroke: 2pt),
       stroke: (thickness: 3pt),
       )
      plot.plot(size: (4,4),
      y-label: "",
      name: "plot",
      x-label: "",
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "left",
      {
        plot.add(((.1,.1),(1,1)), style: (stroke: none))
        plot.add-anchor("start", (0.2, 0.9))
        plot.add-anchor("stop", (0.9, 0.2))
      }
      )
      line("plot.start","plot.stop", name: "line", stroke: (paint:red), mark: (end: ">", fill: red))
      content("plot.south", [#smallcaps[Degradation]], padding: (bottom:-1cm))
      content(("plot.south", 50%,(2.5,-3.5)), box(width: 5cm)[#show: text.with(size:16pt);Our world is generally worse than the one of our parents and grandparents.], anchor: "north")
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *
      set-style(axes: (stroke: 2pt),
       stroke: (thickness: 3pt),
       )
      plot.plot(size: (4,4),
      y-label: "",
      name: "plot",
      x-label: "",
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "left",
      {
        plot.add(((.1,.1),(1,1)), style: (stroke: none))
        plot.add-anchor("start", (0.2, 0.55))
        plot.add-anchor("stop", (0.9, 0.55))
      }
      )
      line("plot.start","plot.stop", name: "line", stroke: (paint:red), mark: (end: ">", fill: red))
      content("plot.south", [#smallcaps[Balance]], padding: (bottom:-1cm))
      content(("plot.south", 50%, (2.5,-3.5)), box(width: 5cm)[#show: text.with(size:16pt);The world doesn't change fundamentally. The cost of progress cancels out most benefits.], anchor: "north")
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *
      set-style(axes: (stroke: 2pt),
       stroke: (thickness: 3pt),
       )
      plot.plot(size: (4,4),
      y-label: "",
      name: "plot",
      x-label: "",
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "left",
      {
        plot.add(((.1,.1),(1,1)), style: (stroke: none))
        plot.add-anchor("start", (0.2, 0.2))
        plot.add-anchor("middle", (0.55, 0.55))
        plot.add-anchor("stop", (0.9, 0.2))
      }
      )
      line("plot.start", "plot.middle","plot.stop", name: "line", stroke: (paint:red), mark: (end: ">", fill: red))
      content("plot.south", [#smallcaps[Rise and fall]], padding: (bottom:-1cm))
      content(("plot.south",50%,(2.5,-3.5)), box(width: 5cm)[#show: text.with(size:16pt);The world used to get better, but now it is getting worse.], anchor: "north")
    })
  ],
  [
    #cetz.canvas({
      import cetz.draw: *
      import cetz-plot: *
      set-style(axes: (stroke: 2pt),
       stroke: (thickness: 3pt),
       )
      plot.plot(size: (4,4),
      y-label: "",
      name: "plot",
      x-label: "",
      x-tick-step: none,
      y-tick-step: none,
      axis-style: "left",
      {
        plot.add(((.1,.1),(1,1)), style: (stroke: none))
        plot.add-anchor("start", (0.2, 0.9))
        plot.add-anchor("middle", (0.55, 0.55))
        plot.add-anchor("stop", (0.9, 0.9))
      }
      )
      line("plot.start", "plot.middle","plot.stop", name: "line", stroke: (paint:red), mark: (end: ">", fill: red))
      content("plot.south", [#smallcaps[Crisis]], padding: (bottom:-1cm))
      content(("plot.south", 50%, (2.5,-3.5)), box(width: 5cm)[#show: text.with(size:16pt);We are facing a major global crisis but things will get better again.], anchor: "north")
    })
  ]
  )
]

#slide(title: [Methodology])[
  #show: align.with(center)
  #show: text.with(size:18pt)

  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: (thickness: 2pt, dash: "dashed"), mark: (transform-shape: true, fill: black, scale: 2, anchor: "center"))
    content((2.5,3), [#smallcaps[Data\ collection]], anchor: "center")
    content((9.5, 3), [#smallcaps[NLP]], anchor: "center")
    content((16.5, 3), [#smallcaps[Qualitative\ analysis]], anchor: "center")
    content((23.5,3), [#smallcaps[Quantitative\ analysis]], anchor: "center")
    content((2.5,9), [#box(width: 3cm)[#image("png/data_collection.png")]], anchor: "center")
    content((9.5,9), [#box(width: 3cm)[#image("png/nlp.png")]], anchor: "center")
    content((16.5,9), [#box(width: 3cm)[#image("png/qualitative.png")]], anchor: "center")
    content((23.5,9), [#box(width: 3cm)[#image("png/quantitative.png")]], anchor: "center")
    line((4.1,9),(7.6,9), mark: (end: ">"))
    line((18.1,9),(21.6,9), mark: (end: ">"))
    bezier((9.5,7),(16.5, 7),(13,3), mark: (start: ">"))
    bezier((9.5,11),(16.5, 11),(13,15), mark: (end: ">"))
  })

]

#focus-slide(background: mainColor)[
  #show: text.with(size: 44pt)
  #show: align.with(center)
  Thank You!
]