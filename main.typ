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
  content((0,-5), [#smallcaps[Obserwacja]], anchor: "center")
  content((6.5,-5), [#smallcaps[Formułowanie Teorii]], anchor: "center")
  content((13,-5), [#smallcaps[Tworzenie Modelu]], anchor: "center")
  content((19.5,-5), [#smallcaps[Badania]], anchor: "center")
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
  short-title: [Nauki społeczne, komputery i inne bajery],
  color: mainColor,
)


// Global settings.
#set text(font: "New Computer Modern", weight: "semibold", size: 20pt, hyphenate: false, lang: "pl")
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
#let topic_modeling = image("png/topic_modeling.png")
// Title slide.
#title-slide(
  authors: [Mikołaj Biesaga],
  title: [Nauki społeczne, komputer i inne bajery],
  subtitle: [],
  date: [15 maja 2026],// datetime.today().display("[day] [month repr:long] [year]"),
  funding: [#link("mailto:m.biesaga@uw.edu.pl")[m.biesaga\@uw.edu.pl]],
)

// Regular slide.
#slide(title: [Plan prezentacji])[
  #v(25%)
  + Czy BMI wyjaśnia korupcję?

  + Co sklepy wiedzą o swoich klientach i klientkach?

  + Jak rozmawiać ze swoimi rodzicami?

  + Dlaczego potrzebujemy modeli?

  + Przykłady, przykłady, wszędzie przykłady!
]

#slide(title: [Zanim zaczniemy])[
  #figure(qr)
]

#new-section-slide("Czy BMI wyjaśnia korupcję?")

#slide(title: [Blavatskyy, 2021 -- IgNobel 2021])[
  #figure(
    block(height: 95%)[#corruption1],
    caption: [
      Scatterplot of median estimated ministers’ body-mass index against Transparency International Corruption Perceptions Index 2017 (with a linear trend), where lower values of CPI indicate greater corruption.],
    )
]

#slide(title: [Blavatskyy, 2021 -- IgNobel 2021])[
  #figure(
    block(height: 100%)[#corruption],
    caption: [
      Median estimated ministers’ body-mass index and five conventional measures
      of corruption for 15 post-Soviet states.
    ],
    kind: table
    )
]

#slide(title: [Obliczeniowe nauki społeczne -- co to jest?])[
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
    title: "Obliczeniowe Nauki Społeczne",
    [
      It is a data-driven approach that uses computational methods in studying
      social phenomena.
    ]
    )
  }
  )
]

#slide(title: [Obliczeniowe nauki społeczne -- co to jest?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 6cm)
  }
  #v(15%)
  #cetz.canvas({
    import cetz.draw: *
    set-style(stroke: (dash: "dashed", paint: enumColor, thickness : 0pt))
    content((0, 0), research, name: "research", anchor: "center")
    on-layer(1, {
      circle((9.75,1.5), radius: 3)
    })
  })
  #footnote[Wszystkie ikony pochodzą z #link("https://www.flaticon.com")[https://www.flaticon.com].]
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
    set-style(stroke: (dash: "dashed", paint: enumColor, thickness : 2pt))
    content((0, 0), research, name: "research", anchor: "center")
    on-layer(1, {
      circle((9.75,1.5), radius: 3)
    })
  })
  #footnote[Wszystkie ikony pochodzą z #link("https://www.flaticon.com")[https://www.flaticon.com].]
]

#slide(title: [Metody obliczeniowe])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list
  #v(15%)
  - [x] Zbieranie danych z cyfrowych (i.e., internetowych) źródeł danych;

  - [/] Praca z dużymi zbiorami danych (big data);

  - [/] Symulacje komputerowe;

  - [x] Analiza Języka Naturalnego (Natural Language Processing -- NLP);
  
  - [ ] Projektowanie eksperymentów online;

  - [ ] Analiza sieci społecznych;

  - [ ]...
]

#new-section-slide("Co sklepy wiedzą o swoich klientach i klientkach?")

#slide(title: [Does Target know whether we are pregnant?])[
  #set align(center+horizon)
  #let target = image("png/targetlogo.jpeg")
  #figure(
    target,
    caption: [
      Za #link("https://corporate.target.com/media/collection/b-roll-and-press-materials/target-logos")[www.corporate.target.com].
    ])
]

#slide(title: [Co sklepy wiedzą o swoich klientach i klientkach?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 6cm)
  }
  #v(20%)
  #cetz.canvas({
    import cetz.draw: *
    content((0,0), box(email, width: 3cm), anchor: "center", name: "email")
    content((6,0), box(width: 3cm), anchor: "center", name: "phone")
    content((12,0), box(width: 3cm), anchor: "center", name: "card")
    content((18,0), box(width: 4cm), anchor: "center", name: "test")
    content((0,-4), [#smallcaps[Email]], anchor: "center")
  })
  #footnote[Wszystkie ikony pochodzą z #link("https://www.flaticon.com")[https://www.flaticon.com].]
]

#slide(title: [Co sklepy wiedzą o swoich klientach i klientkach?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 6cm)
  }
  #v(20%)
  #cetz.canvas({
    import cetz.draw: *
    content((0,0), box(email, width: 3cm), anchor: "center", name: "email")
    content((6,0), box(phone, width: 3cm), anchor: "center", name: "phone")
    content((12,0), box(width: 3cm), anchor: "center", name: "card")
    content((18,0), box(width: 4cm), anchor: "center", name: "test")
    content((0,-4), [#smallcaps[Email]], anchor: "center")
    content((6,-4), [#smallcaps[Pretensje]], anchor: "center")
  })
  #footnote[Wszystkie ikony pochodzą z #link("https://www.flaticon.com")[https://www.flaticon.com].]
]

#slide(title: [Co sklepy wiedzą o swoich klientach i klientkach?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 6cm)
  }
  #v(20%)
  #cetz.canvas({
    import cetz.draw: *
    content((0,0), box(email, width: 3cm), anchor: "center", name: "email")
    content((6,0), box(phone, width: 3cm), anchor: "center", name: "phone")
    content((12,0), box(card, width: 3cm), anchor: "center", name: "card")
    content((18,0), box(width: 4cm), anchor: "center", name: "test")
    content((0,-4), [#smallcaps[Email]], anchor: "center")
    content((6,-4), [#smallcaps[Pretensje]], anchor: "center")
    content((12,-4), [#smallcaps[Karta Lojalnościowa]], anchor: "center")
  })
  #footnote[Wszystkie ikony pochodzą z #link("https://www.flaticon.com")[https://www.flaticon.com].]
]

#slide(title: [Co sklepy wiedzą o swoich klientach i klientkach?])[
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    box(it,width: 6cm)
  }
  #v(20%)
  #cetz.canvas({
    import cetz.draw: *
    content((0,0), box(email, width: 3cm), anchor: "center", name: "email")
    content((6,0), box(phone, width: 3cm), anchor: "center", name: "phone")
    content((12,0), box(card, width: 3cm), anchor: "center", name: "card")
    content((18,0), box(test, width: 3cm), anchor: "center", name: "test")
    content((0,-4), [#smallcaps[Email]], anchor: "center")
    content((6,-4), [#smallcaps[Pretensje]], anchor: "center")
    content((12,-4), [#smallcaps[Karta Lojalnościowa]], anchor: "center")
    content((18,-4), [#smallcaps[Test ciążowy]], anchor: "center")
  })
  #footnote[Wszystkie ikony pochodzą z #link("https://www.flaticon.com")[https://www.flaticon.com].]
]

#slide(title: [Ślad cyfrowy])[
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
    title: "Ślad cyfrowy",
    [
      Jest to zbiór informacji pozostawianych przez użytkownika/użytkowniczkę w internecie w wyniku aktywności online.
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
        title: "Pasywny",
        [
          Dotyczy danych, które #underline[nieintencjonalnie] umieszcza się online, np. adres IP, używany system operacyjny, itp.        ]
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
        title: "Aktywny",
        [
          Dotyczy danych, które #underline[intencjonalnie] umieszcza się online, np. e-maile, zdjęcia, TikTok dances, itp.
        ],
      )
    ]
  )

]

#slide(title: [Źródła danych])[
  #set align(center+horizon)
  #let target = image("png/data_everywhere.png")
  #figure(
    target,
    caption: [
      Z #link("imgflip.com")[imgflip.com].
    ])
]

#slide(title: [Data Sources])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list
  #v(15%)
  - [ ] strony internetowe;
  
  - [x] media społecznościowe;
  
  - [ ] smartfony i inne urządzenia mobilne;

  - [ ] ślady cyfrowe;

  - [ ] dane sieci komórkowych;

  - [ ] dane rządowe;

  - [ ] ...
]

#focus-slide(background: mainColor, [To że jakieś dane są dostępne nie oznacza, że należy z nich korzystać.])

#new-section-slide("Jak rozmawiać ze swoimi rodzicami?")

#slide(title: [Kosinski, Stillwell, & Graepel, 2013])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list
  #v(15%)
  - [ ] W 2007 David Stillwell stworzył facebokową aplikację #highlight[myPersonality,] która pozwalała na wypełnienie "kwestionariusza" osobowości.

  - [ ] Do 2012, #highlight[6 milionów] ludzi skorzystało z tej aplikacji.

  - [ ] #highlight[40%] użytkowników i użytkowniczek dało aplikacji dostęp do swoich profili na Facebooku.

  - [ ] Private traits and attributes are predictable from digital records of human behavior (Kosinski, Stillwell, & Graepel, 2013).
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
      Zaprojektowane przez Agatę Biesagę
    ])
]

#focus-slide(background: mainColor, [Micro-targeting jest to dostosowanie przekazu do wąskiej grupy odbiorców, na podstawie posiadanych o nich informacji.])

#slide(title: [Matz et al., 2017])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list.with(fill: (enumColor))
  #v(15%)
  - [x] W 2007 David Stillwell stworzył facebokową aplikację #highlight[myPersonality,] która pozwalała na wypełnienie "kwestionariusza" osobowości.

  - [x] Do 2012, #highlight[6 milionów] ludzi skorzystało z tej aplikacji.

  - [x] #highlight[40%] użytkowników i użytkowniczek dało aplikacji dostęp do swoich profili na Facebooku.

  - [x] Private traits and attributes are predictable from digital records of human behavior (Kosinski, Stillwell, & Graepel, 2013).

  - [ ] Psychological targeting as an effective approach to digital mass persuasion (Matz et al., 2017).
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

#slide(title: [Micro-targeting])[
  #set align(center+horizon)
  #let target = image("png/zuck.jpg")
  #figure(
    target,
    caption: [
      From #link("imgflip.com")[imgflip.com].
    ])

]

#focus-slide(background: mainColor,
 [
    #set align(center)
    #smallcaps[Jednakże...]
  ])

#slide(title: [Discussion])[
  #v(15%)
  + Zmiast sprawdzić czy reklamy #highlight[działały lepiej, gdy były targetowane niż gdy były nietargetowane] do ogólnej populacji, Matz et al. (2017) użyli słabszego testu (Shart, Danenberg, & Bellman, 2018).

  + Osoby badane #highlight[nie były przypisane losowo] do różnych typów reklam, a co więcej ta sama osoba mogła zobaczyć reklamę obu typów (Eckles, Gordon, & Johnson, 2018).

  + Algorytm Facebooka wyświetla reklamy użytkonikom i użytkoniczkom, które są bardziej skłonne do spełnienia celu kampanii, co może prowadzić do #highlight[niezamierzonego wzmocnienia efektu targetowania] (Eckles, Gordon, & Johnson, 2018).
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

#new-section-slide("Dlaczego potrzebujemy modeli?")

#slide(title: [Co to jest model?])[
  #let vogue = image("png/vogue.jpg")
  #figure(
    vogue,
    caption: [
      Z #link("https://archive.vogue.com/issue/18921224")[Vogue] (24 grudnia 1892).
    ]
  )
]

#focus-slide(background: mainColor,[In simple terms a model is a #highlight[simplified representation] of a system (reality) that
helps to understand how the system works/worked in the past/will work in the
future.])

#slide(title: [Why do we need models?])[
  #v(15%)
  + Formalizing a theory into a model allows the researcher to #highlight[describe their ideas in a precise,] unambiguous way (Goldstone & Janssen, 2005; Epstein, 2008).

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
    set-style(stroke: (dash: "dashed", paint: enumColor, thickness : 2pt))
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
  #footnote[All flat icons from #link("https://www.flaticon.com")[https://www.flaticon.com].]
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
  
  - [ ] "If an individual is surrounded by more individuals of different types than the number of individuals of their own type, then the individual moves from the current location to a random empty location." (Schelling, 1971).
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
      By Nicky Case from #link("https://ncase.me/polygons/")[https://ncase.me/polygons/].
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
      Design by Agata Biesaga.
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
      Design by Katarzyna Bajkowska #link("https://psych.pan.pl/pracownik/mgr-katarzyna-bajkowska/")[(Institute of Psychology Polish Academy of Sciences)].
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
      Behavioral Change Model -- COM-B (Michie, Atkins, & West, 2014).
    ]
  )
]

#slide(title: [Roszczyńska-Kurasińska, Biesaga, & de Oliveira, 2025])[
  #let s = image("png/barplot.png")
  #set align(center+horizon)
  #figure(
    s,
    caption: [
      Distribution of the components of the COM-B Model by country.
    ]
    )
]

#slide(title: [Remember the name!])[
  #let sofia = maybe-image("png/sofia.jpg", height: 90%)
  #let grid-list = el.default-list.with(
  body-indent: (0pt, auto),
  enum-spacing: (auto, 15pt),
  body-format: (
    whole: (
      stroke: (1pt, auto),
      radius: (10pt, auto),
      fill: (otherColor, auto),
      inset: ((bottom: 5pt, top: 5pt), auto),
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
      inset: ((bottom: 5pt, top: 5pt, rest: 15pt), auto),
    ),
    style: (
      size: (22pt, 19pt),
      weight: ("black", "bold")
    ),
  ),

  label-format: ([], auto),
  fill: enumColor
  )

  #grid(columns: (1fr, .5fr),
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
      content(("plot.south", 50%, (2.5,-3.5)), box(width: 5cm)[#show: text.with(size:15pt);Historically, the world has been getting better with each decade.], anchor: "north")
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
      content(("plot.south", 50%,(2.5,-3.5)), box(width: 5cm)[#show: text.with(size:15pt);Our world is generally worse than the one of our parents and grandparents.], anchor: "north")
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
      content(("plot.south", 50%, (2.5,-3.5)), box(width: 5cm)[#show: text.with(size:15pt);The world does not change fundamentally. The cost of progress cancels out most benefits.], anchor: "north")
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
      content(("plot.south",50%,(2.5,-3.5)), box(width: 5cm)[#show: text.with(size:15pt);The world used to get better, but now it is getting worse.], anchor: "north")
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
      content(("plot.south", 50%, (2.5,-3.5)), box(width: 5cm)[#show: text.with(size:15pt);We are facing a~major global crisis but things will get better again.], anchor: "north")
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

#let page-box(fill_c: red, lines: true) = {
  cetz.canvas({
    import cetz.draw: *
    rect((0,0),(2,2.5), fill: fill_c)
    if lines {
      rect((.2,1.6),(1.8,2.3), stroke: (thickness: .5pt, paint: black))
      for y in (.2, .4, .6, .8, 1, 1.2, 1.4) {
        line((.15,y), (1.85,y), stroke: (thickness: .5pt, paint: black))

    }
    }
  })
}

#slide(title: [Tools])[
  #show: align.with(center)
  #cetz.canvas({
    import cetz.draw: *
    content((0,0),[#page-box(fill_c: blue.lighten(20%))])
    content((2.5,0),[#page-box(fill_c: red.lighten(20%))])
    content((5,0),[#page-box(fill_c: blue.lighten(20%))])
    content((7.5,0),[#page-box(fill_c: green.lighten(20%))])
    content((10,0),[#page-box(fill_c: red.lighten(20%))])
    content((12.5,0),[#page-box(fill_c: blue.lighten(20%))])

    content((4,-5), [#page-box(fill_c: red.lighten(20%))])
    content((4,-5.3), [#page-box(fill_c: red.lighten(20%))])
    content((6.5,-5), [#page-box(fill_c: green.lighten(20%))])
    content((9,-5), [#page-box(fill_c: blue.lighten(20%))])
    content((9,-5.3), [#page-box(fill_c: blue.lighten(20%))])
    content((9,-5.6), [#page-box(fill_c: blue.lighten(20%))])

    content((4,-10), [#page-box(fill_c: red.lighten(20%), lines: false)])
    content((9,-10), [#page-box(fill_c: blue.lighten(20%), lines: false)])

    line((0,-1.25), (9,-3.75), mark: (end: ">",), stroke: (thickness: 1pt, dash: "dashed", paint: blue.lighten(20%)))
    line((5,-1.25), (9,-3.75), mark: (end: ">",), stroke: (thickness: 1pt, dash: "dashed", paint: blue.lighten(20%)))
    line((12.5,-1.25), (9,-3.75), mark: (end: ">",), stroke: (thickness: 1pt, dash: "dashed", paint: blue.lighten(20%)))

    line((2.5,-1.25), (4,-3.75), mark: (end: ">",), stroke: (thickness: 1pt, dash: "dashed", paint: red.lighten(20%)))
    line((10,-1.25), (4,-3.75), mark: (end: ">",), stroke: (thickness: 1pt, dash: "dashed", paint: red.lighten(20%)))

    line((7.5,-1.25), (6.5,-3.75), mark: (end: ">",), stroke: (thickness: 1pt, dash: "dashed", paint: green.lighten(20%)))


    line((4,-7), (4,-8.5), stroke: (thickness: 1pt, dash: "dashed", paint: red.lighten(20%)))
    line((9,-7), (9,-8.5), stroke: (thickness: 1pt, dash: "dashed", paint: blue.lighten(20%)))

    content((20,0), [#smallcaps[Corpus]])

    content((20,-5), [#smallcaps[Separated Topics]])

    content((20,-10), [#smallcaps[Identified Narratives]])
  })

]

#slide(title: [Example])[
  #grid(columns: (1fr, 1fr, 1fr),
  column-gutter: 30pt,
  [
    #image("png/urban.png")
  ],
  [
    #image("png/transgenic.png")
  ],
  [
    #image("png/hicss.png")
  ],
  )
  
]


#focus-slide(background: mainColor)[
  #show: text.with(size: 44pt)
  #show: align.with(center)
  Thank You!
]