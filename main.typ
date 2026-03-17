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
#show: el.default-enum-list.with(fill: (enumColor, alertColor))

// Images
#let coin_toss = image("png/coin-toss.png")
#let heart6 = image("png/heart-6.png")
#let heart7 = image("png/heart-7.png")
#let spades6 = image("png/spades-6.png")
#let spades7 = image("png/spades-7.png")
#let notes = image("png/musical-notes.png")
#let model = image("png/rng_model.png")

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
  //#set list(marker: [])
  #show: el.default-enum-list.with(fill: (enumColor, enumColor))
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
    - jako narzędzie diagnostyczne rozwoju funkcji poznawczych (e.g., Peters et al., 2007);
    - w badaniach nad modelowaniem mechanizmów podejmowania decyzji (e.g., Spicer et al., 2026);
    - ... i~wielu innych miejscach, których potrzebne jest zadanie, które jest trudne do wykonania, ale "łatwe" do zrozumienia (por. Ayton et al., 1991).
]

#slide(title: [Luki metodologiczne (1/2)])[

  1. Istnieje wiele różnych paradygmatów badawczych, które są wykorzystywane do badania tworzenia ciągów losowych, ale nie jest jasne, czy mierzą one tę samą zmienną:
    - różna #highlight[liczba elementów,] które trzeba wygenerować (por. Brugger, 1997);
    - różne #highlight[instrukcje,] które nawiązują do znanych (np., rzut monetą) lub abstrakcyjnych (np., "wygeneruj ciąg losowy") procesów (Biesaga et al., 2021);
    - #highlight[informacja zwrotna] na temat generowane ciągu, np., gry o sumie zerowej (Rapoport & Budescu, 1992);
    - różne #highlight[modalności,] np., generowanie ciągów vs generowanie losowych interwałów czasowych między naciśnięciami klawiszy (Vandierendonck, 2000).
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
  2. Problem z #highlight[ugruntowaną w teorii i łatwo operacjonalizowalną] miarą losowości ciągów tworzony przez ludzi. Używane miary w większości opierają się na pojedynczych aspektach losowości (Angelike & Munsch, 2025):

    - miary oparte na częstości występowania elementów (np., liczba wystąpień pojednyczych, elementów, par, trójek, itp.);

    - miary oparte na autokorelacji;

    - miary oparte na entropii;

    - miary oparte o Ukryte Ciągi Markova.
]

#focus-slide(background: mainColor)[
  Większość używanych miar pozwala na pokazanie odstępstw od wyników procesu losowego. Jednak nie pozwalają na ocenę losowości tworzonego ciągu.

]

#slide(title: [Złożoność algorytmiczna])[
  - Algorytmiczna Teoria Informacji #highlight[utożsamia losowość ze złożonością algorytmiczną] (Li & Vitányi, 2008).
  
  - W ostatnich latach udało się eksperymentalnie wyznaczyć miarę, która nadawaje się dla krótkich ciągów (Soler-Toscano et al., 2014; Gauvrit et al., 2017)

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
  #v(5%)
  #grid(columns: (.6fr, .4fr),
  column-gutter: 1cm,
  [
    #model
  ],
  [
    - Oba komponenty pamięci roboczej zaangażowane w~proces tworzenia ciągów losowych (Biesaga & Nowak, 2024);
    - Generowanie ciągów losowych jest związane z~procesami monitorowania oraz hamowania (Miyake et al., 2000).
  ]
  
  )

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

  #v(15%)
  - Krzywa rozwojowa wyników złożoności algortymicznej jest podobna do większości zdolności poznowaczych (Gauvrit et al., 2017);

  - Badania pokazują stabilność odstępstw od typowych dla rozkładu losowego wskaźników (Boger et al., 2025);

  - #highlight[Pytanie:] Na ile stabilny w czasie jest rozkład wyników złożoności algorytmicznej?

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
  + Próba #highlight[usystematyzowania różnych paradygmatów badawczych] oraz metod badawczych w ramach algorytmicznej teorii informacji.

  + Dotychczasowe badania (np. Miyake et al., 2000; Cooper et al. 2012) starające się sprawdzić udział wyższych funkcji poznawczych na tworzenie ciągów losowych używały #highlight[miar, które nie mieżyły losowości.]

  + Stabilność w czasie do tej pory była mierzona jako stabilność w czasie odchyleń od typowych dla rozkładu losowego wskaźników (Boger et al., 2025), a nie losowości produkowanych ciągów.
]

#slide(title: [Koncepcja i plan badań])[
  #show: align.with(center)

  #grid(
    columns: (.5fr, 1fr, 1fr),
    column-gutter: 2cm,
    align: (left, center, center),
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
      #v(5%)

      #show: text.with(size: 12pt)
      #cetz.canvas({
        import cetz.draw: *
        circle((2.5,1), radius: (2,1), name: "updating")
        circle((2.5,-1.5), radius: (2,1), name: "shifting")
        circle((2.5,-4), radius: (2,1), name: "inhibition")
        circle((9,-1.5),radius: (2,1), name: "randomness")
        content("updating", [#smallcaps[Updating &\ Monitoring]], anchor: "center")
        content("shifting", [#smallcaps[Set-shifting]], anchor: "center")
        content("inhibition", [#smallcaps[Inhibition]], anchor: "center")
        content("randomness", [#show: align.with(center); #smallcaps[Random-like\ ability]], anchor: "center")
        line((4.5,1),(7,-1.4), mark: (end: ">"))
        line((4.5,-1.5),(7,-1.5), mark: (end: ">"))
        line((4.5,-4),(7,-1.6 ), mark: (end: ">"))
      })

    ],
    [
      #smallcaps[Badanie 3]\
      #v(15%)
      #show: text.with(size: 12pt)
      #cetz.canvas({
        import cetz.draw: *
        import cetz-plot: *
        set-style(axes: (stroke: .5pt, tick: (stroke: 0pt)))
        plot.plot(size: (9,4),
        x-label: "Złożoność algorytmiczna",
        x-label-size: 1pt,
        y-label: "",
        y-max: 12,
        x-max: 1,
        x-tick-step: .1,
        y-tick-step: none,
        {
          let mean = .4
          while mean < .6 {
            plot.add(
              domain: (0,1),
              fill: true,
              t => (1/.1) * calc.exp(- calc.pow(t - mean,2) / (2 * calc.pow(.1, 2)))
          )
          mean = mean + .04 
          }
        }
        )
      })
      
    ],
  )


]

#slide(title: [Badanie 1])[
  #grid(
    rows: (2cm, auto),
    columns: (27.5cm),
    row-gutter: 3cm,
    [
      #show: align.with(center)
      #cetz.canvas({
        import cetz.draw: *
        content((0, 0), [#box(width: 2cm)[#heart6]], anchor: "center")
        content((2, 0), [#box(width: 2cm)[#spades7]], anchor: "center")
        content((6,0), [#smallcaps[Mask]], anchor: "center")
        content((10,0), [#box(width: 2cm)[#coin_toss]], anchor: "center")
        content((14,0), [#smallcaps[Mask]], anchor: "center")
        content((19,0), [#box(width: 2cm)[#notes]], anchor: "center")
      })
    ],
    [
      - Schemat korelacyjny
      - Badanie w warunkach laboratoryjnych
      - 3 x 120 elementowe ciągi (ok. 40 minut)
      - Analiza:
        - analiza czynnikowa wyników zadań generowania losowości
        - SEM -- ile wariancji złożoności jest wyjaśniane przez klasyczne miary?
      - Realizacja celu 1 i 2

    ])

]

#slide(title: [Badanie 2])[
  #grid(
    rows: (.60fr,.40fr),
    row-gutter: 3cm,
    columns: (27.5cm),
    [
      #show: align.with(center)
      #show: text.with(size: 12pt)
      #cetz.canvas({
        import cetz.draw: *
        circle((2.5,1), radius: (2,1), name: "updating")
        circle((2.5,-1.5), radius: (2,1), name: "shifting")
        circle((2.5,-4), radius: (2,1), name: "inhibition")
        circle((9,-1.5),radius: (2,1), name: "randomness")
        rect((-3.2,1.1), (-1,2.1), name: "nback")
        rect((-3.2,-.1), (-1,.9), name: "updating2")
        rect((-3.2, -.4), (-1,-1.4), name: "shifting2")
        rect((-3.2,-1.7), (-1,-2.7), name: "number/letter")
        rect((-3.2, -3.9), (-1,-2.9), name: "stroop")
        rect((-3.2,-4.1), (-1,-5.1), name: "go/nogo")
        content("updating", [#smallcaps[Updating &\ Monitoring]], anchor: "center")
        content("shifting", [#smallcaps[Set-shifting]], anchor: "center")
        content("inhibition", [#smallcaps[Inhibition]], anchor: "center")
        content("randomness", [#smallcaps[Random-like\ series ability]], anchor: "center")
        content("nback", [#smallcaps[n-back]], anchor: "center")
        content("go/nogo", [#smallcaps[go/nogo]], anchor: "center")
        content("stroop", [#smallcaps[stroop]], anchor: "center")
        content("number/letter", [#smallcaps[number/\ letter]], anchor: "center")
        content("updating2", [#smallcaps[?]], anchor: "center")
        content("shifting2", [#smallcaps[?]], anchor: "center")
        content((11,-4.2), [#box(width: 2cm)[#coin_toss]], anchor: "center")
        content((6.5,-4.5), [#box(width: 1cm)[#spades6]], anchor: "center")
        content((7.5,-4.5), [#box(width: 1cm)[#heart7]], anchor: "center")
        content((9,-4.5), [#box(width: 1cm)[#notes]], anchor: "center")
        line((4.5,1),(7,-1.4), mark: (end: ">"))
        line((4.5,-1.5),(7,-1.5), mark: (end: ">"))
        line((4.5,-4),(7,-1.6 ), mark: (end: ">"))
        line((7,-4),(8.9,-2.5), mark: (end: ">"))
        line((11,-3.7),(9.1,-2.5), mark: (end: ">"))
        line((9,-3.9),(9,-2.5), mark: (end: ">"))
        line((0.5,1.1),(-1,1.6), mark: (end: ">"))
        line((0.5,.9),(-1,.4), mark: (end: ">"))
        line((0.5,-1.4),(-1,-.9), mark: (end: ">"))
        line((0.5,-1.6),(-1,-2.2), mark: (end: ">"))
        line((0.5,-4.1),(-1,-4.6), mark: (end: ">"))
        line((0.5,-3.9),(-1,-3.4), mark: (end: ">"))
      })
    ],
    [
      - Schemat korelacyjny
      - Badanie w warunkach laboratoryjnych
      - 3 x 120 elementowe ciągi (ok. 90 minut)
      - Realizacja celu 3
    ]
  )


]

#slide(title: [Badanie 3])[
  #grid(
    rows: (.60fr,.40fr),
    row-gutter: 3cm,
    columns: (27.5cm),
    [
      #show: align.with(center)
      #cetz.canvas({
        import cetz.draw: *
        content((0.25, 0), [#box(width: 1.5cm)[#heart6]], anchor: "center")
        content((1.75, 0), [#box(width: 1.5cm)[#spades7]], anchor: "center")
        content((4,0), [#smallcaps[mask]], anchor: "center")
        content((6.25, 0), [#box(width: 1.5cm)[#heart6]], anchor: "center")
        content((7.75, 0), [#box(width: 1.5cm)[#spades7]], anchor: "center")
        content((10,0), [#smallcaps[mask]], anchor: "center")
        content((12.25, 0), [#box(width: 1.5cm)[#heart6]], anchor: "center")
        content((13.75, 0), [#box(width: 1.5cm)[#spades7]], anchor: "center")
        content((16,0), [#smallcaps[...]], anchor: "center")
        content((18.25, 0), [#box(width: 1.5cm)[#heart6]], anchor: "center")
        content((19.75, 0), [#box(width: 1.5cm)[#spades7]], anchor: "center")

        content((1,-2), [#box(width: 1.5cm)[#coin_toss]], anchor: "center")
        content((4,-2), [#smallcaps[mask]], anchor: "center")
        content((7,-2), [#box(width: 1.5cm)[#coin_toss]], anchor: "center")
        content((10,-2), [#smallcaps[mask]], anchor: "center")
        content((13,-2), [#box(width: 1.5cm)[#coin_toss]], anchor: "center")
        content((16,-2), [#smallcaps[...]], anchor: "center")
        content((19,-2), [#box(width: 1.5cm)[#coin_toss]], anchor: "center")

        content((1,-4), [#box(width: 1.5cm)[#notes]], anchor: "center")
        content((4,-4), [#smallcaps[mask]], anchor: "center")
        content((7,-4), [#box(width: 1.5cm)[#notes]], anchor: "center")
        content((10,-4), [#smallcaps[mask]], anchor: "center")
        content((13,-4), [#box(width: 1.5cm)[#notes]], anchor: "center")
        content((16,-4), [#smallcaps[...]], anchor: "center")
        content((19,-4), [#box(width: 1.5cm)[#notes]], anchor: "center")
      })
    ],
    [
      - Badanie podłużne w schemacie eksperymentalnym (+ symulacja)
      - 128 ośmio-elementowych (64 siedmio-elementowych) ciągów (dwie sesje po ok. 40 minut)
      - Badanie w warunkach laboratoryjnych
      - Realizacja celu 4
    ]
  )

]

#focus-slide(background: mainColor)[
  #show: text.with(size: 34pt)
  #show: align.with(center)
  Dziękuję!
]
