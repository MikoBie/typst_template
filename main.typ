// Import theme from the file.
#import "themes/iss.typ": *
#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge
#import fletcher.shapes: pill
#import "@preview/shadowed:0.1.2": shadowed

// Define main colors of the theme.
#let mainColor = rgb(42,60,102)
#let alertColor = rgb(42,102,45)
#let enumColor = rgb(102,42,66)
#let otherColor = rgb(102,84,42)

// Option of the theme.
#show: iss-theme.with(
  left-footer: [Domaradzka et al.],
  short-title: [Challenges and Future Directions for Integrating Healthcare Wearable Sensoros into Smart Cities and Communities],
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

#let shadowed = shadowed.with(radius: 8pt, inset: 8pt, fill: mainColor.lighten(60%), blur: 30pt, color: gray)

#let underline = underline.with(stroke: alertColor, offset: 3pt)

#let cover = text.with(fill: gray.lighten(50%))

// Title slide.
#title-slide(
  authors: ([Anna Domaradzka, #underline[Mikołaj Biesaga], Magdalena Roszczyńska-Kurasińska, & Ewa Domaradzka]),
  title: [Challenges and Future Directions for Integrating Healthcare Wearable Sensors into Smart Cities and Communities],
  subtitle: none,
  date: [21 listopada 2024],
  funding: [euPolis has received funding from the European Union's Horizon 2020 program H2020-EU.3.5.2., under grant agreement No 869448. HEART has received funding from the European Union's Horizon 2020 Research and Innovation Program under grant agreement No 945105. The work of Anna Domaradzka was supported by the Polish National Science Centre under grant agreement no. 2018/30/E/HS6/00379. The work of Magdalena Roszczyńska-Kurasińska was supported by the European Union's Horizon 2020 research and innovation programme (grant agreement no. 960366).],
  secondlogo: none
)

// Regular slide.
#slide(title: [Plan prezentacji])[
  #v(25%)
  + Smart Cities

  + Prawo do zdrowego miasta

  + Ryzyka i wyzwania

  + Wnioski
]

#slide(title: [Smart Cities])[
#only(1)[- Ostatnie lata to skokowy wzrost wykorzystania różnego rodzaju sensorów w przestrzenii miejskiej -- #highlight[technologii smart cities.]]

#only((beginning: 2))[- Ostatnie lata to skokowy wzrost wykorzystania różnego rodzaju sensorów w przestrzenii miejskiej -- technologii smart cities.]

#only((1,3,4))[- "Wearables" mają dostarczać informacji na temat zdrowia mieszkanek oraz jakości przestrzeni miejskiej, a w konsekwencji umożliwiać podejmowania decyzji w oparciu o dane ilościowe.]

#only((2))[- "Wearables" mają dostarczać informacji na temat #highlight[zdrowia] mieszkanek oraz #highlight[jakości przestrzeni miejskiej,] a w konsekwencji umożliwiać #highlight[podejmowania decyzji w oparciu o dane ilościowe.]]

#only((3))[- Coraz popularniejsza staje się wizja przyszłości, w której #highlight[sieć czujnków pozwala na zdiagnozowanie miejsc, w których należy zwiększyć dostępność do poszczególnych usług medycznych.]]

#only((1,2,4))[- Coraz popularniejsza staje się wizja przyszłości, w której sieć czujnków pozwala na zdiagnozowanie miejsc, w których należy zwiększyć dostępność do poszczególnych usług medycznych.]

#only(4)[- Jednak, obecne zastosowania "wearables" są zbyt często oparte na #highlight[techno-optymiźmie i ignorują istotne ograniczenia tej technologii.]]

#only((until:3))[- Jednak, obecne zastosowania "wearables" są zbyt często oparte na techno-optymiźmie i ignorują istotne ograniczenia tej technologii.]
]

#slide(title: [Prawo do Zdrowego Miasta])[
#set text(size: 18pt)
#diagram(
  node-fill: gradient.radial(white, mainColor, radius:200%),
  node-stroke: mainColor,
  node = node.with(width: 21cm, height: 1.75cm, inset: 1em, shape: pill),
  debug: 0,
  (
    node((0,0), [#set align(left); "Prawo do Miasta" -- #highlight[zbiór praw, które gwarantują pełne wykorzystanie przestrzenii] (Henir Lefebvre);]),
    node((.1,.75), shape: pill, [#set align(left); prawo do "urban life, to renewed centrality, to places of encounter and exchange" może zdefiniować jako #highlight["livability";]]),
    node((.2,1.5), shape: pill, [#set align(left); #highlight[w decyzjach na temat kształtu środowiska] WSZYSTKIE mieszkanki i mieszkańcy powinni mieć #highlight[prawo głosu;]]),
    node((.3,2.25), shape: pill, [#set align(left); #highlight[prawo do zdrowia i dobrostanu] jest warunkiem wstępnym jakichkolwiek innych praw;]),
    node((.4,3), shape: pill, [#set align(left); #highlight[Prawo do Zdrowego Miasta] stanowi ramę do tworzenia miast o wysokim #highlight["livability".]]),
  )
)
]

#slide(title: [HEART i euPOLIS])[
  #set align(center)
  #image("png/mierzenie.png")
]

#slide(title: [Ryzyka i wyzwania])[
  #v(25%)
  + Prywatność oraz etyka przetwarzania danych wrażliwych

  + Zbieranie oraz przechowywanie danych

  + Jakość i trafność zbieranych danych

  + Komfort użytkowania
]

#slide(title: [Prywatność oraz etyka przetwarzania danych wrażliwych])[
  #only(1)[- Producenci, których model bizensowy oparty jest na zbieraniu jak największej ilości danych użytkowników, spełniają tylko #highlight[minimum prawnych wymagań] -- używając argumentu, że prawa użytkownika hamują innowacje.]

  #only((beginning:2))[- Producenci, których model bizensowy oparty jest na zbieraniu jak największej ilości danych użytkowników, spełniają tylko minimum prawnych wymagań -- używając argumentu, że prawa użytkownika hamują innowacje.]

  #only((1,3))[- Użytkowniczki są stawiane przed wyborem pomiędzy dzieleniem się danymi, a pełną funkcjonalnością sprzętu czy usługi (Li et al., 2015).]

  #only((2))[- Użytkowniczki są stawiane przed #highlight[wyborem pomiędzy dzieleniem się danymi, a pełną funkcjonalnością sprzętu czy usługi (Li et al., 2015).]]

  #only(3)[#shadowed[Osoby otrzymuące transfery socjalne wyrażały zaniepokojenie czy opaski z GPSem nie będą monitorować ich zachowań w celu sprawdzenia czy nadal spełniają odpowiednie kryteria.]]
]

#slide(title: [Ryzyka i wyzwania])[
  #v(25%)
  #cover[+ Prywatność oraz etyka przetwarzania danych wrażliwych]
  + Zbieranie oraz przechowywanie danych
  #cover[+ Jakość oraz trafność zbieranych danych]
  #cover[+ Komfort użytkowania]
]

#slide(title: [Zbieranie oraz przechowywanie danych])[
  #only((beginning:1))[- Analiza i zbieranie danych na bieżąco z różnych źródeł wymaga efektywnego i niezawodnego ssytemu zarządzania danymi.]

  #only((1,3))[- Jednak, integracja danych z różnych źródeł, zwłaszcza prywatnych, rodzi pytanie do kogo należą zbierane dane (Hummel et al., 2021).]

  #only((2))[- Jednak, integracja danych z różnych źródeł, zwłaszcza prywatnych, rodzi #highlight[pytanie do kogo należą zbierane dane (Hummel et al., 2021).]]
  
  #only(3)[#shadowed[W HEART intgracja danych z opasek z danymi zdrowotnymi przechowywanymi przez szpitale okazała się niemożliwa z powodów prawnych.]]

]

#slide(title: [Ryzyka i wyzwania])[
  #v(25%)
  #cover[+ Prywatność oraz etyka przetwarzania danych wrażliwych]
  #cover[+ Zbieranie oraz przechowywanie danych]
  + Jakość oraz trafność zbieranych danych
  #cover[+ Komfort użytkowania]
]

#slide(title: [Jakość oraz trafność zbieranch danych])[
  #v(20%)
  #only((beginning:2))[- Trafność i rzetelność pomiaru wielu obecnych na rynku produktów wielu obecnych na rynku produktów jest nieznana (Mills et al., 2016).]

  #only((1))[- #highlight[Trafność i rzetelność] pomiaru wielu obecnych na rynku produktów wielu obecnych na rynku produktów jest #highlight[nieznana] (Mills et al., 2016).]
  
  #only((beginning:1))[- Wiele dostępnych rozwiązań wymaga w zasadzie nieprzerwanego noszenia, żeby dostarczyć jakikolwiek feedback.]

  #only((until:1))[- Feedback oparty jest często na dość enigmatycznie opisanych algorytmach i nie zdefiniowanych normach.]

  #only((2))[- Feedback oparty jest często na dość #highlight[enigmatycznie opisanych algorytmach i nie zdefiniowanych normach.]]

]

#slide(title: [Ryzyka i wyzwania])[
  #v(25%)
  #cover[+ Prywatność oraz etyka przetwarzania danych]
  #cover[+ Zbieranie oraz przechowywanie danych]
  #cover[+ Jakość i trafność zbieranych danych]
  + Komfort użytkowania
]

#slide(title: [User acceptance and adoption])[
  #only(1)[- #highlight[32% osób przestaje używać "wearables" po 6 miesiącach], a 50% po roku (Piwek et al., 2016).]
  #only((beginning:2))[- 32% osób przestaje używać "wearables" po 6 miesiącach, a 50% po roku (Piwek et al., 2016).]
  #only(2)[- #highlight[Nierealistyczne cele] stawiane przez "wearables" mogą mieć przeciwny do zamierzonego efekt w postaci #highlight[zniechęcenia oraz obniżonego nastroju] (Fu et al., 2009; Etkin, 2016)]
  #only((1,3,4))[- Nierealistyczne cele stawiane przez "wearables" mogą mieć przeciwny do zamierzonego efekt w postaci zniechęcenia oraz obniżonego nastroju (Fu et al., 2009; Etkin, 2016)]
  #only(3)[- #highlight[Przyjazność interfejsu, ergonomia, wygląd czy też wygoda] użytkownika w wielu przypadkach pozostawia wiele do życzenia (Harrison et al., 2015)]
  #only((1,2,4))[- Przyjazność interfejsu, ergonomia, wygląd czy też wygoda użytkownika w wielu przypadkach pozostawia wiele do życzenia (Harrison et al., 2015)]
  #only(4)[#shadowed[Nawet użytkonicy i użytkowniczki rekrutowane z partnerów projektu narzekali na dezajn komfort użytkowania czy też brak motywacji do noszenia opasek.]]
]

#slide(title: [Wnioski])[
  #v(15%)
  - Przy adaptacji rozwiązań smart city w miastach potrzebny jest większy nacisk na #highlight[prawa i preferencje użytkowniczek i użytkowników.]

  - Kwestie prywatności powinny być uwzględniane etapie projektowania (Caboukian, 2009).

  - Osoby, które potencjalnie mogą najwięcej mogą zyskać na tego typu rozwiązaniach to osoby #highlight[starsze, mniej zamożne i należące do grup mniejszościowych (Patel et al., 2015).]
]

#slide(title: [Dziękuję!])[
  #grid(columns: (1fr, 1fr),
        column-gutter: 1em,
        align: (center, center),
        [
          #image("png/hicss.png", height: 120%)
        ],
        [
          #image("png/sus.png", height: 120%)
        ]
  )
]