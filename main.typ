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
  left-footer: [Biesaga],
  short-title: [Tworzenie ciągów pseudolosowych: zdolność czy kombinacja funkcji poznawczych?],
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
#show smallcaps: set text(font: "New Computer Modern")
#show link: it => {
  set text(blue.darken(20%))
  underline(it)
}
#show footnote: it =>{}
#set footnote(numbering: it => {})

// Images
#let coin_toss = image("png/coin-toss.png")
#let heart6 = image("png/heart-6.png")
#let heart7 = image("png/heart-7.png")
#let spades6 = image("png/spades-6.png")
#let spades7 = image("png/spades-7.png")
#let notes = image("png/musical-notes.png")

// Title slide.
#title-slide(
  authors: [Mikołaj Biesaga],
  title: [Tworzenie ciągów pseudolosowych:],
  subtitle: [zdolność czy kombinacja funkcji poznawczych?],
  date: [17 marca 2025],// datetime.today().display("[day] [month repr:long] [year]"),
  funding: [#link("mailto:m.biesaga@uw.edu.pl")[m.biesaga\@uw.edu.pl]],

)

#slide(title: [Zanim zaczniemy...])[
  #grid(columns: (.5fr, .4fr),
  column-gutter: .1fr,
  align: (auto, center),
  [
    #v(25%)
    #highlight[Zadanie 1.] Dla każdego przygotowałem małą kartkę i długopis. Proszę, żeby każdy zapisał na niej #highlight[wyniki 10 wyobrażonych rzutów monetą,] w której jest 50% szans na wypadnięcie orła i 50% szans na wypadnięcie reszki.
  ],
  [
    #box(width: 8cm)[#coin_toss]
  ])
]

#slide(title: [Zanim zaczniemy...])[
  #grid(rows: (1fr,2fr),
  column-gutter: .1fr,
  align: (auto, center),
  [
    #v(20%)
    #highlight[Zadanie 2.] Teraz w~parach prosiłbym, żebyście zagrali w~następującą grę. Każda osoba dostanie 2 karty: jednego pika i jedno karo. Na mój znak będziecie wykładać jedną z tych kart.
  ],
  [
    #v(15%)
    #grid(columns: (1fr, 1fr),
    align: (center, center),
    [
    #smallcaps[Starsi wygrywają]
      #cetz.canvas({
        import cetz.draw: *
        content((0, 0), [#box(width: 2cm)[#heart6]], anchor: "center")
        content((2, 0), [#box(width: 2cm)[#heart7]], anchor: "center")
        content((6, 0), [#box(width: 2cm)[#spades6]], anchor: "center")
        content((8, 0), [#box(width: 2cm)[#spades7]], anchor: "center")
      })
    ],
    [
      #smallcaps[Młodsi wygrywają]
      #cetz.canvas({
        import cetz.draw: *
        content((0, 0), [#box(width: 2cm)[#heart6]], anchor: "center")
        content((2, 0), [#box(width: 2cm)[#spades7]], anchor: "center")
        content((6, 0), [#box(width: 2cm)[#spades6]], anchor: "center")
        content((8, 0), [#box(width: 2cm)[#heart7]], anchor: "center")
      })
    ])

  ],
  )
]
#slide(title: [Plan prezentacji])[
  #v(15%)

  + Cel naukowy projektu;

  + Znaczenie projektu;

  + Koncepcja i plan badań;

  + Metodyka badań.

]

#focus-slide(background: mainColor)[
  Mówię o zdolności do #highlight[tworzenia ciągów pseudolosowych] bo nie ma przesłanek do tego by wierzyć, że jest jakiś proces prawdziwie losowy, który stoi za produkcją przez ludzi ciągów.
]

#slide(title: [Po co?])[
  #show quote: it => {
    set par(spacing: 0.65em,justify: false)
    [
      #set text(size: 16pt, style: "italic")
      #it.body
    ]
    v(1pt)
    [
      #set text(size: 16pt)
      #h(14cm)
      -- #it.attribution
    ]
  }
  #grid(
    columns: (8cm, auto),
    [],
    [
      #quote(block: true, attribution: [Włodi (1997)], quotes: false)[
        "Po pierwsze nie dla sławy, po drugie nie dla pieniędzy\
        Dobrze rapować można żyjąc nawet w nędzy"
        ]
    ])

  Tworzenie ciągów losowych jest powszechnie wykorzystywane:
    - jako drugie zadanie mające obciążyć funkcje poznawcze (e.g., Cooper et al., 2012);
    - jako narzędzie diagnostyczne rozwoju funkcji poznawczych (e.g., Gauvrit et al., 2017);
    - w badaniach nad modelowaniem mechanizmów podejmowania decyzji (e.g., Spicer et al., 2026);
    - ... i~wielu innych miejscach, których potrzebne jest zadanie, które jest trudne do wykonania, ale "łatwe" do zrozumienia (por. Ayton et al., 1991).
]

#slide(title: [Luki metodologiczne (1/2)])[

  1. Istnieje wiele różnych paradygmatów badawczych, które są wykorzystywane do badania tworzenia ciągów losowych, ale nie jest jasne, czy mierzą one tę samą zmienną:
    - różna liczba elementów, które trzeba wygenerować (por. Brugger, 1997);
    - różne instrukcje, które nawiązują do znanych (np., rzut monetą) lub abstrakcyjnych (np., "wygeneruj ciąg losowy") procesów (Biesaga et al., 2021);
    - informacja zwrotna na temat generowane ciągu, np., gry o sumie zerowej (Rapoport & Budescu, 1992);
    - różne modalności, np., generowanie ciągów vs generowanie losowych interwałów czasowych między naciśnięciami klawiszy (Vandierendonck, 2000).
]

#slide(title: [Cele naukowe projektu])[
  #v(5%)
  #showybox(
    frame: (
      border-color: blue.darken(50%),
      title-color: blue.lighten(60%),
      body-color: otherColor.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "bold",
    ),
    shadow: (
      offset: 2pt,
    ),
    [
      1. Zbadanie na ile różne paradygmaty badawcze wykorzystywane w~zadaniach generowania ciągów losowych mierzą tę samą zmienną.
    ],
    [
      #show: text.with(fill: otherColor.lighten(80%))
      2. Zbadanie ile wariancji złożoności algorytmicznej wyjaśniają powszechnie używane miary do tworzenia ciągów losowych.
    ],
    [
      #show: text.with(fill: otherColor.lighten(80%))
      3. Zbadanie, które wyższe funkcje poznawcze są zaangażowane w~tworzenie ciągów losowych.
    ],
    [
      #show: text.with(fill: otherColor.lighten(80%))
      4. Zbadanie stabilności w czasie wyników w zadaniach generowania ciągów losowych.
    ]
    )

]

#slide(title: [Luki metodologiczne (2/2)])[
  2. Problem z ugruntowaną i łatwo operacjonalizowalną miarą losowości ciągów tworzony przez ludzi. Używane miary w większości opierają się na pojedynczych aspektach losowości (Angelike & Munsch, 2025):

    - miary oparte na częstości występowania elementów (np., liczba wystąpień pojednyczych, elementów, par, trójek, itp.);

    - miary oparte na autokorelacji;

    - miary oparte na entropii;

    - miary oparte o Ukryte Ciągi Markova.
]

#focus-slide(background: mainColor)[
  Większość używanych miar pozwala na pokazanie odstępstw od wyników procesu losowego. Jednak nie pozwalają na ocenę losowości tworzonego ciągu.

]

#slide(title: [Złożoność algorytmiczna])[
  - Algorytmiczna Teoria Informacji utożsamia losowość ze złożonością algorytmiczną (Li & Vitányi, 2008).
  
  - W ostatnich latach udało się eksperymentalnie wyznaczyć taką miarę, która będzie się nadawała dla krótkich ciągów (Soler-Toscano et al., 2014; Gauvrit et al., 2017)

  - Miara złożoności algorytmicznej:
    - pozwala na wykrycie każdej nieregularności;
    - jest wystarczająca czuła by wykrywać różnice indywidualne (Biesaga et al., 2021);
    - znormalizowana przyjmuje wartości od 0 do 1 dzięki czemu pozwala na porównywanie ciągów o różnej długości.

]

#focus-slide(background: mainColor)[
  Algorytmiczna Teoria Informacji definiuje #highlight[ciąg losowy] jako taki ciąg, który #highlight[nie może być stworzony przy pomocy prostej reguły.] Oznacza to, że ciągu losowego nie da się w wydajny sposób skompresować.
]

#slide(title: [Cele naukowe projektu])[
  #v(5%)
  #showybox(
    frame: (
      border-color: blue.darken(50%),
      title-color: blue.lighten(60%),
      body-color: otherColor.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "bold",
    ),
    shadow: (
      offset: 2pt,
    ),
    [
      1. Zbadanie na ile różne paradygmaty badawcze wykorzystywane w~zadaniach generowania ciągów losowych mierzą tę samą zmienną.
    ],
    [
      2. Zbadanie ile wariancji złożoności algorytmicznej wyjaśniają powszechnie używane miary do tworzenia ciągów losowych.
    ],
    [
      #show: text.with(fill: otherColor.lighten(80%))
      3. Zbadanie, które wyższe funkcje poznawcze są zaangażowane w~tworzenie ciągów losowych.
    ],
    [
      #show: text.with(fill: otherColor.lighten(80%))
      4. Zbadanie stabilności w czasie wyników w zadaniach generowania ciągów losowych.
    ]
    )

]

#slide(title: [Luki empiryczne (1/2)])[

  Badanie empiryczne oraz symulacje komputerowe pokazują, że wyższe funkcje poznawcze biorą udział w tworzeniu ciągów pseudolosowych.

  - 

]

#slide(title: [Cele naukowe projektu])[
  #v(5%)
  #showybox(
    frame: (
      border-color: blue.darken(50%),
      title-color: blue.lighten(60%),
      body-color: otherColor.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "bold",
    ),
    shadow: (
      offset: 2pt,
    ),
    [
      1. Zbadanie na ile różne paradygmaty badawcze wykorzystywane w~zadaniach generowania ciągów losowych mierzą tę samą zmienną.
    ],
    [
      2. Zbadanie ile wariancji złożoności algorytmicznej wyjaśniają powszechnie używane miary do tworzenia ciągów losowych.
    ],
    [
      3. Zbadanie, które wyższe funkcje poznawcze są zaangażowane w~tworzenie ciągów losowych.
    ],
    [
      #show: text.with(fill: otherColor.lighten(80%))
      4. Zbadanie stabilności w czasie wyników w zadaniach generowania ciągów losowych.
    ]
    )
]

#slide(title: [Luki empiryczne (2/2)])[

  Badanie empiryczne oraz symulacje komputerowe pokazują, że wyższe funkcje poznawcze biorą udział w tworzeniu ciągów pseudolosowych.

  - 

]

#slide(title: [Cele naukowe projektu])[
  #v(5%)
  #showybox(
    frame: (
      border-color: blue.darken(50%),
      title-color: blue.lighten(60%),
      body-color: otherColor.lighten(80%)
    ),
    title-style: (
      color: black,
      weight: "bold",
    ),
    shadow: (
      offset: 2pt,
    ),
    [
      1. Zbadanie na ile różne paradygmaty badawcze wykorzystywane w~zadaniach generowania ciągów losowych mierzą tę samą zmienną.
    ],
    [
      2. Zbadanie ile wariancji złożoności algorytmicznej wyjaśniają powszechnie używane miary do tworzenia ciągów losowych.
    ],
    [
      3. Zbadanie, które wyższe funkcje poznawcze są zaangażowane w~tworzenie ciągów losowych.
    ],
    [
      4. Zbadanie stabilności w czasie wyników w zadaniach generowania ciągów losowych.
    ]
    )
]

#slide(title: [Znaczenie projektu])[
  #v(10%)
  + Próba usystematyzowania różnych paradygmatów badawczych oraz metod badawczych w ramach algorytmicznej teorii informacji.

  + Dotychczasowe badania (np. Miyake, 2000; Cooper et al. 2012) starające się sprawdzić udział wyższych funkcji poznawczych na tworzenie ciągów losowych używały miar, które nie mieżyły losowości.

  + Stabilność w czasie do tej pory była mierzona jako stabilność w czasie odchyleń od typowych dla rozkładu losowego wskaźników (Boger et al., 2025), a nie losowości produkowanych ciągów.
]

#slide(title: [Koncepcja i plan badań])[
  #show: align.with(center)

  #grid(
    columns: (1fr, 1fr, 1fr),
    [
      #smallcaps[Badanie 1]
      #cetz.canvas({
        import cetz.draw: *
        content((0, 0), [#box(width: 2cm)[#heart6]], anchor: "center")
        content((2, 0), [#box(width: 2cm)[#spades7]], anchor: "center")
        content((1,-3), [#box(width: 2cm)[#coin_toss]], anchor: "center")
        content((1,-6), [#box(width: 2cm)[#notes]], anchor: "center")
      })

    ],
    [
      #smallcaps[Badanie 2]\
      set-shifting, updating and monitoring, inhibition
      
    ],
    [
      #smallcaps[Badanie 3]

    ],
  )


]

#slide(title: [Metodyka badań])[
  - Badanie 1 i Badanie 2 -- schemat korelacyjny.
  - Badanie 2

]

#slide(title: [Dziękuję!])[

]
