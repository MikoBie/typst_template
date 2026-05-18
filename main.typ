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
//#show figure.caption: it => [
//  #if it == "Rysunek" [
//    Rycina #it.counter.display(). #it.body
//  ] else [
//    #it
//  ]
//]
#show figure.caption: set text(size: 12pt)
#show figure: set figure.caption(separator: ".")
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.where(kind: image): set figure(supplement: "Rycina")
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
  title: [Nauki społeczne, komputery i inne bajery],
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
      Opisuje teorię i praktykę pozyskiwania wartościowych informacji z danych.
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
      Podejście oparte na danych, które wykorzystuje metody obliczeniowe w badaniu zjawisk społecznych.
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

#slide(title: [Obliczeniowe nauki społeczne -- co to jest?])[
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
  - [x] Zbieranie danych z cyfrowych (n.p., internetowych) źródeł danych;

  - [/] Praca z dużymi zbiorami danych (big data);

  - [/] Symulacje komputerowe;

  - [x] Analiza Języka Naturalnego (Natural Language Processing -- NLP);
  
  - [ ] Projektowanie eksperymentów online;

  - [ ] Analiza sieci społecznych;

  - [ ]...
]

#new-section-slide("Co sklepy wiedzą o swoich klientach i klientkach?")

#slide(title: [Czy Target jest w stanie przewidzieć ciąże?])[
  #set align(center+horizon)
  #let target = image("png/targetlogo.jpeg")
  #figure(
    target,
    caption: [
      Za #link("https://corporate.target.com/media/collection/b-roll-and-press-materials/target-logos")[www.corporate.target.com].
    ])
]

#slide(title: [Czy Target jest w stanie przewidzieć ciąże?])[
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

#slide(title: [Czy Target jest w stanie przewidzieć ciąże?])[
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

#slide(title: [Czy Target jest w stanie przewidzieć ciąże?])[
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

#slide(title: [Czy Target jest w stanie przewidzieć ciąże?])[
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
      Jest to zbiór informacji pozostawianych przez użytkownika/użytkowniczkę w Internecie w wyniku aktywności online.
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

#slide(title: [Źródła danych])[
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
  - [ ] W 2007 David Stillwell stworzył facebookową aplikację #highlight[myPersonality,] która pozwalała na wypełnienie "kwestionariusza" osobowości.

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
  - [x] W 2007 David Stillwell stworzył facebookową aplikację #highlight[myPersonality,] która pozwalała na wypełnienie "kwestionariusza" osobowości.

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

#slide(title: [Komentarz])[
  #v(5%)
  + Zmiast sprawdzić czy reklamy #highlight[działały lepiej, gdy były targetowane niż gdy były nietargetowane] do ogólnej populacji, Matz et al. (2017) użyli słabszego testu (Shart, Danenberg, & Bellman, 2018).

  + Osoby badane #highlight[nie były przypisane losowo] do różnych typów reklam, a co więcej ta sama osoba mogła zobaczyć reklamę obu typów (Eckles, Gordon, & Johnson, 2018).

  + Algorytm Facebooka wyświetla reklamy użytkonikom i użytkoniczkom, które są bardziej skłonne do spełnienia celu kampanii, co może prowadzić do #highlight[niezamierzonego wzmocnienia efektu targetowania] (Eckles, Gordon, & Johnson, 2018).
]

#slide(title: [Eckles, Gordon, & Johnson, 2018])[
  #let eckels = image("png/eckels.png", height: 100%)
  #figure(
    eckels,
    caption: [
      Distribution of all reported user characteristics: age in study 1 (A), age (B), and gender (C) in study 2. 
    ]
  )
]

#slide(title: [Micro-targeting z AI])[
  #v(15%)

  + Chatboty oparte na dużych modelach językych potrafią być skuteczniejsze niż ludzie w przekonywaniu innych do zmiany swoich poglądów (Salvi et al., 2025).

  + Rozmowa z Chatbotem jest skutczeniejsza niż pojedyncze wiadomości tekstowe (Hackenburg et al., 2025).

  + Rozmowa z Chatbotem może skutcznie zmniejszyć wiarę w teorie spiskowe (Costello, Pennycook, & Rand, 2025).
]

#slide(title: [Lin et al., 2025])[
  #let trump = image("png/trump.jpg")
  #let harris = image("png/harris.jpg")
  #let note = image("png/note.png")
  #let ai = image("png/artificial-intelligence.png")
  #set align(center+horizon)
  #show smallcaps: it => {
    set align(center)
    set text(size: 19pt)
    box(it,width: 6cm)
  }
  #v(20%)
  #cetz.canvas({
  import cetz.draw: *
  content((-1,0), box(trump, width: 2.5cm), anchor: "center", name: "trump")
  content((2,0), box(harris, width: 2.5cm), anchor: "center", name: "harris")
  content((8,0), box(note, width: 3cm), anchor: "center", name: "note")
  content((13,0), box(ai, width: 4cm), anchor: "center", name: "ai")
  content((21.5,0), box(trump, width: 2.5cm), anchor: "center", name: "trump2")
  content((18.5,0), box(harris, width: 2.5cm), anchor: "center", name: "harris2")
  content((0.75,-4), [#smallcaps[Preferencje]], anchor: "center")
  content((8,-4), [#smallcaps[Pisemne Uzasadnienie]], anchor: "center")
  content((13,-4), [#smallcaps[Chat z AI]], anchor: "center")
  content((20.25,-4), [#smallcaps[Preferencje]], anchor: "center")
  line((3.5,0), (6.35,0), mark: (end: ">"), stroke:( thickness: 2pt), paint: enumColor)
  line("note", "ai", mark: (end: ">"), stroke:( thickness: 2pt), paint: enumColor)
  line((14.5,0), (17,0), mark: (end: ">"), stroke:( thickness: 2pt), paint: enumColor)
})
]

#slide(title: [Lin et al., 2025])[
  #let results = image("png/ai_presuasion.png")

  #figure(
    results,
    caption: [
      Results of the experiment by Lin et al. (2025).
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

#focus-slide(background: mainColor,[W najprostrzym ujęciu model jest to #highlight[uproszczona wersja] systemu (rzeczywistości), która pomaga lepiej zrozumieć jak dany system działa/działał/będzie działał.])

#slide(title: [Do czego potrzebujemy symulacji komputerowych?])[
  #v(15%)
  + Sformalizowanie teorii jako model pozwala #highlight[precyzyjnie i w sposób jednoznaczy opisać] swoje pomysły (Goldstone & Janssen, 2005; Epstein, 2008).

  + Zaletą dobrze sprecyzowanych modeli jest to, że pozwalają w #highlight[łatwy sposób weryfkować] swoją wewnętrzną spójność (Timpone & Taber, 1996).

  + Precyzyjnie sformułowane modele ułatwiają komunikację z innymi badaczami i badaczkami (Nowa, Rychwalska, & Borkowski, 2015).
]

#slide(title: [Symulacje komputerowe])[
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
    content((0,-5), [#smallcaps[Obserwacja]], anchor: "center")
    content((6.5,-5), [#smallcaps[Formułowanie Teorii]], anchor: "center")
    content((13,-5), [#smallcaps[Tworzenie Modelu]], anchor: "center")
    content((19.5,-5), [#smallcaps[Symulacje Komputerowe]], anchor: "center")
    circle("simulation", radius: 3cm)
  })
  #footnote[Wszystkie ikony pochodzą z #link("https://www.flaticon.com")[https://www.flaticon.com].]
]

#slide(title: [Dynamiczny model segregacji])[
  #show: el.config.checklist.with(
    baseline: "center",
    fill: enumColor,
  )
  #show: el.default-enum-list.with(fill: (enumColor))
  #v(15%)

  - [x] 6 sierpnia 1965 Prezydent USA Lydon B. Johnson podpisał tzw. #link("https://en.wikipedia.org/wiki/Voting_Rights_Act_of_1965")[Voting Rights Act], który miał za zadanie przeciwdziałać dyskryminacji ze względu na rasę.
  
  - [/] Mimo wielu wysiłków zarówno w USA jak i w innych miejscach na świecie #highlight[dyskryminacja ze względu na kolor skóry] dalej pozostaje dużym problemem (Massey, 2020).  

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
      Animacja stworzona przez Nicky Case #link("https://ncase.me/polygons/")[https://ncase.me/polygons/].
    ])
]

#slide(title: [Do czego potrzebujemy symulacji komputerowych?])[
  #v(25%)

  + Żeby budować intuicje na temat działania modeli.

  + Żeby testować scenariusze, które są niemożliwe do zbadania w inny sposób \#thereIsNoPlanetB.

  + Żeby przewidywać przyszłość.
]

#new-section-slide("Przykłady, przykłady, wszędzie przykłady!")

#slide(title: [Natural Language Processing])[
  #let nlp = image("png/nlp.jpg")
  #set align(center+horizon)
  #v(15%)
  #figure(
    nlp,
    caption: [
      Zprojektowane przez Agatę Biesagę.
    ])
]

#focus-slide(background: mainColor, [
  Analiza Języka Naturalnego (Natural Language Processing -- NLP) to podejście analityczne, które wykorzystuje zestaw (zazwyczaj) metod i narzędzi komputerowych do wydobywania znaczenia, tematów lub sentymentu z danych tekstowych lub mówionych. Innymi słowy, #highlight[jest to zbiór algorytmów komputerowych, które próbują syntetyzować język ludzki.]
])

#slide(title: [Bajkowska & Biesaga, 2023])[
  #let poster = image("png/poster.png")
  #set align(center+horizon)
  #figure(
    poster,
    caption: [
      Zaprojektowane przez Katarzynę Bajkowską #link("https://psych.pan.pl/pracownik/mgr-katarzyna-bajkowska/")[(Instytut Psychologii Polskiej Akademii Nauk)].
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

#slide(title: [Przyłuska & Biesaga, 2026])[
  #let article = image("png/iccss.png")
  #set align(center+horizon)
  #figure(
    article,
    )
]

#focus-slide(background: mainColor)[
  #show: text.with(size: 44pt)
  #show: align.with(center)
  Dziękuję!
]