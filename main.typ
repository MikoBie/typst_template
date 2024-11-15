// Import theme from the file.
#import "themes/iss.typ": *
#import "@preview/fletcher:0.5.2" as fletcher: diagram, node, edge
#import fletcher.shapes: pill
#import "@preview/shadowed:0.1.2": shadowed

// Define main colors of the theme.
#let mainColor = rgb(42,60,102)
#let enumColor = rgb(42,102,45)
#let alertColor = rgb(102,42,66)
#let otherColor = rgb(102,84,42)

// Option of the theme.
#show: iss-theme.with(
  left-footer: [Domaradzka et al.],
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

#let shadowed = shadowed.with(radius: 8pt, inset: 8pt, fill: mainColor.lighten(60%), blur: 10pt, color: gray)

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
  + Introduction
  + The Right to a Healthy City
  + Risks and Challenges
  + Lesson Learned
]

#slide(title: [Introduction])[
- Recent years saw a rapid acceleartion in cities' transition into #highlight[sensor-enhanced smart cities.]
- Cities managers aim to leverage #highlight[wearable sensors] to gather meaningful information about #highlight[people's health or the quality of urban environment,] and enhance personal capabilities, as well as facilitate #highlight[data-driven decision-making processes.]
- The smar health (s-health) vision gains in popularity as it aims to utilize #highlight[the context-aware network and sensing infrastructure of smart cities to provide advanced health services.]
- However, current applications of wearable technologies are too often based on #highlight[techno-optimism and tend to ingore important limitations.]
]

#slide(title: [The Right to a Healthy City])[
#set text(size: 18pt)
#diagram(
  node-fill: gradient.radial(white, mainColor, radius:200%),
  node-stroke: mainColor,
  node = node.with(width: 21cm, height: 1.75cm, inset: 1em, shape: pill),
  debug: 0,
  (
    node((0,0), [Henri Lefebvre's #highlight[right to the city] describes the "basket of rights" enabling #highlight[complete usage of places;]]),
    node((.1,.75), shape: pill, [right to "urban life, to renewed centrality, to places of encounter and exchange" can be defined in tersm of #highlight[livability;]]),
    node((.2,1.5), shape: pill, [#highlight[decision-making process] should give ALL urban dwellers a #highlight[right to participate] in decisions that shape their environment;]),
    node((.3,2.25), shape: pill, [#highlight[health] and #highlight[wellbeing] are prerequisites to exercising #highlight[civil, cultural, and economic rights] under the right to the city slogan;]),
    node((.4,3), shape: pill, [therefore, we define #highlight[the right to a healthy city] as a frame for creating more #highlight[livable] and democratic #highlight[cities.]]),
  )
)
]

#slide(title: [HEART and euPOLIS projects])[
  #set align(center)
  #image("png/mierzenie.png")
]

#slide(title: [Risks and Challenges])[
  #v(25%)
  + Privacy and ethics of sharing sensitive data
  + Data collection, storage, and ownership
  + Data quality/accuracy and interpretation
  + User accpetance and adoption
]

#slide(title: [Privacy and ethics of sharing sensitive data])[
  - Technology providers whose profit is  built around collecting data from users very often are trying to only meet the bare minimum of legal requirements -- using arguments about inhibiting the development of innovative technology.
  - The users see sharing data as a necessary tradeoff between potential benefits from the given services or device and negative consequences of the disclosure (Li et al., 2015).
  #pause
  #shadowed[Residents receiving welfare benefits expressed concerns that wearables can be a way to monitor their activities by the municipality and reevaluate their eligibility for such benefits.]

]

#slide(title: [Risks and Challenges])[
  #v(25%)
  #cover[+ Privacy and ethics of sharing sensitive data]
  + Data collection, storage, and ownership
  #cover[+ Data quality/accuracy and interpretation]
  #cover[+ User accpetance and adoption]
]

#slide(title: [Data collection, storage, and ownership])[
  - Effective data management strategies and analytical techniques are necessary to collect and handle the heterogenous and real-time data streams generated by werable sensors.
  - However, the integration of data from different sources (including wearables) especially conducted by the private sector raises the question of data ownership (Hummel et al., 2021).
  #pause
  #shadowed[The integration of our data system with existing hospital ones was impossible due to local regulations, i.e., in some countries the medical data can't be stored using third party cloud sevices.]

]

#slide(title: [Risks and Challenges])[
  #v(25%)
  #cover[+ Privacy and ethics of sharing sensitive data]
  #cover[+ Data collection, storage, and ownership]
  + Data quality/accuracy and interpretation
  #cover[+ User accpetance and adoption]
]

#slide(title: [Data quality/accuracy and interpretation])[
  - The accuracy values of many market-ready wearables remain undisclosed, lacking published validity and reliability data (Mills et al., 2016).
  - The entry barriers of obtaining reliable data from wearable sensors are still relatively high, requireing people to wear them for a minimum number of hours per day.
  - They seem to provide the feedback based on enigmatically described norms or algorithms that are carefully guarded company secrets.
]

#slide(title: [Risks and Challenges])[
  #v(25%)
  #cover[+ Privacy and ethics of sharing sensitive data]
  #cover[+ Data collection, storage, and ownership]
  #cover[+ Data quality/accuracy and interpretation]
  + User accpetance and adoption
]

#slide(title: [User acceptance and adoption])[
  - 32% of users abandon the device within the first 6 months of usage and 50% after one year (Piwek et al., 2016).
  - Wearing monitoring devices might have unfavorable effects on the people wellbeing, as unrealistic or unachievable external goals lead to discouragement rather than motivation (Fu et al., 2009; Etkin, 2016).
  - Challenges include the design of user-friendly intergaces, ensuring device comfort, easthetics, and ergonomics of wearable devices (Harrison et al., 2015).
  #pause
  #shadowed[Even project partners who volunteered to test the devices complained about their design and comfort, as well as, the motivation to wear them and interact every day.]
]

#slide(title: [Lessons Learned])[
  - To enable smart cities' involvement in promoting inclusivity for individuals with different health issues, more focus on users' rights and preferences is necessary.
  - Privacy consideration should be embeded in the design process of smart solutions rather than added as extra feature afterward (Cavoukian, 2009).
  - To maximize the benefits of wearable sensor data in for the NBSs impact assessme, more power and control should be given to users, to ensure they can truly control privacy levels without losing the functionality (Rychwalska et al., 2022).
  - The individuals who might have the most to gain from these devices are likely to be older, less affluent, and members of the minority groups (Patel et al., 2015).
]

#slide(title: [Thank You!])[
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