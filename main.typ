// Import theme from the file.
#import "themes/iss.typ": *
#import "@preview/showybox:2.0.4": showybox
#import "@preview/cetz:0.5.2"
#import "@preview/cetz-plot:0.1.4"
#import "@preview/itemize:0.2.0" as el

// Define main colors of the theme.
#let mainColor = rgb(10,20,86)
#let enumColor = rgb(124,36,43)
#let alertColor = rgb(124,36,43)
#let enumColor = rgb(230,135,67)
#let otherColor = rgb(194,213,238)
#let otherColor2 = rgb(253,242,212)
#let ukrainianBlue = rgb(0, 87, 183)
#let ukrainianYellow = rgb(255, 215, 0)
#let alertColor = rgb(255, 215, 0)
#let belarusianRed = rgb(210, 39, 48)
#let belarusianGreen = rgb(0,151,57)

// Option of the theme.
#show: iss-theme.with(
  left-footer: [Kozachenko & Biesaga],
  short-title: [What Drives Diasporic Online Mobilisation?],
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
#show figure: set figure.caption(separator: ". ")
#show figure.where(kind: table): set figure.caption(position: top)
#show figure.where(kind: image): set figure(supplement: "Figure")
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

// Graphics

// Title slide.
#title-slide(
  authors: [Ivan Kozachenko and Mikołaj Biesaga],
  title: [What Drives Diasporic Online Mobilisation?],
  subtitle: [Exploring Frames and Emotions on Telegram],
  date: [3 November 2026],// datetime.today().display("[day] [month repr:long] [year]"),
  funding: [The project is supported by the Polish National Science Centre (NCN Opus 27, DIAMOND,  nr: UMO-2024/53/B/HS5/01665)],
  secondlogo: [#image("png/logo_obm.png")]
)

// Regular slide.
#slide(title: [Outlines])[
  #v(15%)

  + Theoretical background

  + Research Question

  + Lexicon-based Analysis

  + Embeddings-based Analysis

  + Next Steps

]

#slide(title: [Theoretical background])[

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    column-gutter: .25em,
    [
      #showybox(
        frame: (
          border-color: white,
          title-color: ukrainianBlue.lighten(50%),
          body-color: white,
          body-inset: .5em,
          title-inset: .6em,
        ),
        title-style: (
          color: black,
          weight: "bold",
          align: center
        ),
        body-style: (
          color: black,
          align: left,
        ),
        title: [#set text(size: 18pt);#set par(justify: false); Diaspora as a stance],
        [
          #set text(size: 14pt, spacing: 75%)
          #set par(justify: false)
          Diaspora as a "category of practice, project, claim and stance, rather than as a bounded group" (Brubaker, 2005).
        ]
      )

    ],
    [
      #showybox(
        frame: (
          border-color: white,
          title-color: ukrainianYellow.lighten(50%),
          body-color: white,
          body-inset: .5em,
          title-inset: .6em,
        ),
        title-style: (
          color: black,
          weight: "bold",
          align: center
        ),
        body-style: (
          color: black,
          align: left,
        ),
        title: [#set text(size: 18pt);#set par(justify: false); Digital\ diasporas],
        [
          #set text(size: 14pt, spacing: 75%)
          #set par(justify: false)
          As online networks diasporic people use to reconstruct identities, exchange opportunities, influence policies (...), and discuss shared concerns through digital technologies (Alonso and Oiarzabal, 2010).
        ]
      )
    ],
    [
      #showybox(
        frame: (
          border-color: white,
          title-color: belarusianRed.lighten(50%),
          body-color: white,
          body-inset: .5em,
          title-inset: .6em,
        ),
        title-style: (
          color: black,
          weight: "bold",
          align: center
        ),
        body-style: (
          color: black,
          align: left,
        ),
        title: [#set text(size: 18pt); #set par(justify: false); Diaspora as a social movement],
        [
          #set text(size: 14pt, spacing: 75%)
          #set par(justify: false)
          Sökefeld (2006), proposes introducing elements of social movement studies into research on diasporas: opportunity structures, framing, mobilising structures, and organisations.
        ]
      )
    ],
    [
      #showybox(
        frame: (
          border-color: white,
          title-color: belarusianGreen.lighten(50%),
          body-color: white,
          body-inset: .5em,
          title-inset: .6em,
        ),
        title-style: (
          color: black,
          weight: "bold",
          align: center
        ),
        body-style: (
          color: black,
          align: left,
        ),
        title: [#set text(size: 18pt, spacing: 75%); #set par(justify: false); "Networks of outrage and hope"],
        [
          #set text(size: 14pt, spacing: 75%)
          #set par(justify: false)
          Digital communication networks enable people to share grievances, overcome fear, and transform outrage into collective action sustained by hope (Castells, 2012).
        ]
      )
    ]

  )

]

#focus-slide(background: mainColor)[
    How do #highlight[emotional reactions] in Ukrainian and Belarusian diaspora Telegram channels in Poland relate to #highlight[mobilisation,] and how do the two communities differ?

]

#slide(title: [Analytical Approach])[
  #set text(size: 16pt)
  #let logo = image("png/telegram.png")
  #let webscraping = image("png/webscraping.png")
  #let lexicon = image("png/lexicon-based.png")
  #let embeddings = image("png/embeddings.png")

  #box(height: 10cm)[#cetz.canvas( length: 1cm,{
      import cetz.draw: *
      import cetz-plot: *

      content((0,0), [#box(width: 2cm)[#logo]])
      content((0, -2), [#smallcaps[Channels\ Selection]])

      content((6,0), [#box(width: 2cm)[#webscraping]])
      content((6, -2), [#smallcaps[Web-scraping]])

      content((12,3), [#box(width: 2cm)[#lexicon]])
      content((12, 5), [#smallcaps[Lexicon-based\ Analysis]])

      content((21,3), [#box(width: 10cm)[- Sentiment analysis (time-series)]])

      content((12,-4), [#box(width: 2cm)[#embeddings]])
      content((12, -6), [#smallcaps[Embeddings-based\ Analysis]])

      content((21,-4), [#box(width: 10cm)[
        - Semantic spread
        - Similarity to definitions
        - Categorization of comments
      ]])

      line((1.25,0), (4.75,0), stroke: (paint: black, thickness: 2pt, dash: "dashed"), dash: true, mark: (end: ">"))
      line((7.25,0), (10.75,3), stroke: (paint: black, thickness: 2pt, dash: "dashed"), dash: true, mark: (end: ">"))
      line((7.25,0), (10.75,-4), stroke: (paint: black, thickness: 2pt, dash: "dashed"), dash: true, mark: (end: ">"))
  })]
  #footnote[All the flat icons by Eucalyp from #link("www.flaticon.com")]
]

#slide(title: [Collected data])[
  #show table.cell.where(y: 0): it => {
    set text(white, weight: "black")
    it
  }

  #v(5%)
  #table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr),
    align: (x,y) =>
      if y == 0 {center + horizon}
      else if x == 0 {left + horizon}
      else {center + horizon}, 
    inset: (x: .4em, y: .5em),
    fill: (x, y) => 
      if y > 0 and calc.rem-euclid(y, 2) == 0 {ukrainianBlue.lighten(50%)}
      else if y == 0 {mainColor}
      else {white},
    column-gutter: (.1em, 0em, 0em, 0em),
    row-gutter: (.1em, 0em, 0em, 0em),
    table.header([Channel],[Subscribers], [Messages], [Comments], [Reactions]),
    [Ukrainian in Poland],[36777],[3255],[25423],[172538],
    [UAinKrakow.pl],[13874],[6344],[2732],[265644],
    [Ukrainian House],[4352],[983],[461],[3252],
    [Belarusian protests in Warsaw],[873],[757],[1583],[10499],
    [Belarusians in Poland],[18226],[782],[10421],[29734],
    [Partyzanka],[9720],[561],[7178],[31827],
  )
]

#slide(title: [Lexicon-based Analysis])[
  #figure(
    image("png/fig-sentiment-analysis.png"),
    caption: [Sentiment analysis over time.]
  )
]

#slide(title: [Embeddings-based Analysis])[
  #grid(
    columns: (1fr, 1.2fr),
    column-gutter: 1em,
    [
      Embeddings were computed using a multilingual transformer model (Reimers and Gurevych, 2019) mapping text to 768-dimensional vector representations.

      #showybox(
        frame: (
          border-color: ukrainianYellow.lighten(50%),
          title-color: ukrainianYellow.lighten(50%),
          body-color: ukrainianYellow.lighten(80%),
          body-inset: .5em,
          title-inset: .6em,
        ),
        title-style: (
          color: black,
          weight: "bold",
          align: center
        ),
        body-style: (
          color: black,
          align: left,
        ),

        title: [Semantic Spread],
        [The euclidean distance between embedding and the centroid (mean embedding) of its group, computed per channel and per country.]
      )

    ],
    [
      #grid(
        rows: (1fr, 1fr),
        row-gutter: 2em,
        [
          #figure(
            image("png/semantic_spread_messages_euclidean.png"),
            caption: [Semantic spread for messages.]
          )
        ],
        [
          #figure(
            image("png/semantic_spread_comments_euclidean.png"),
            caption: [Semantic spread for comments.]
          )
        ]
      )
    ]

  )
]

#slide(title: [Definitions])[
  #set par(justify: false)
  #grid(
    rows: (1fr, 1fr),
    row-gutter: 2em,
    [
      #grid(columns: (1fr, 1fr, 1fr, 1fr),
      column-gutter: 1em,
      [
        #showybox(
          frame: (
            border-color: ukrainianYellow,
            title-color: ukrainianYellow.lighten(50%),
            body-color: white,
            body-inset: .5em,
            title-inset: .6em,
          ),
          title-style: (
            color: black,
            weight: "bold",
            align: center
          ),
          body-style: (
            color: black,
            align: left,
          ),
          title: [National solidarity],
          [
            Solidarity and pride of the nation.
          ]
        )
      ],
      [
        #showybox(
          frame: (
            border-color: belarusianRed,
            title-color: belarusianRed.lighten(50%),
            body-color: white,
            body-inset: .5em,
            title-inset: .6em,
          ),
          title-style: (
            color: black,
            weight: "bold",
            align: center
          ),
          body-style: (
            color: black,
            align: left,
          ),
          title: [Anger or outrage],
          [
            Expression of anger or outrage.
          ]
        )
      ],
      [
        #showybox(
          frame: (
            border-color: belarusianRed,
            title-color: belarusianRed.lighten(50%),
            body-color: white,
            body-inset: .5em,
            title-inset: .6em,
          ),
          title-style: (
            color: black,
            weight: "bold",
            align: center
          ),
          body-style: (
            color: black,
            align: left,
          ),
          title: [Fear or concern],
          [
            Expression of fear or\ concern.
          ]
        )
      ],
      [
        #showybox(
          frame: (
            border-color: ukrainianYellow,
            title-color: ukrainianYellow.lighten(50%),
            body-color: white,
            body-inset: .5em,
            title-inset: .6em,
          ),
          title-style: (
            color: black,
            weight: "bold",
            align: center
          ),
          body-style: (
            color: black,
            align: left,
          ),
          title: [Mobilisation for action],
          [
            Calls for mobilisation and action.
          ]
        )
      ],
      )
    ],
    [
      #grid(columns: (1fr, 1fr, 1fr),
      column-gutter: 1em,
      [
        #showybox(
          frame: (
            border-color: belarusianGreen,
            title-color: belarusianGreen.lighten(50%),
            body-color: white,
            body-inset: .5em,
            title-inset: .6em,
          ),
          title-style: (
            color: black,
            weight: "bold",
            align: center
          ),
          body-style: (
            color: black,
            align: left,
          ),
          title: [Hope],
          [
            Expression of hope for positive\ outcomes.
          ]
        )
      ],
      [
        #showybox(
          frame: (
            border-color: ukrainianYellow,
            title-color: ukrainianYellow.lighten(50%),
            body-color: white,
            body-inset: .5em,
            title-inset: .6em,
          ),
          title-style: (
            color: black,
            weight: "bold",
            align: center
          ),
          body-style: (
            color: black,
            align: left,
          ),
          title: [Appreciation],
          [
            Expression of appreciation or gratitude.
          ]
        )
      ],
      [
        #showybox(
          frame: (
            border-color: ukrainianBlue,
            title-color: ukrainianBlue.lighten(50%),
            body-color: white,
            body-inset: .5em,
            title-inset: .6em,
          ),
          title-style: (
            color: black,
            weight: "bold",
            align: center
          ),
          body-style: (
            color: black,
            align: left,
          ),
          title: [Neutral],
          [
            Neutral statements without strong emotional content.
          ]
        )
      ],
      )

    ]
  )
]

#slide(title: [Similarity to definitions])[
  #grid(
    rows: (1fr, 1fr),
    row-gutter: 2em,
    [
      #figure(
        image("png/comments_boxplot_country_Ukraine_kmeans_clusters.png"),
        caption: [Profiles of comments in Ukraine (based on kmeans clustering of cosine similarity to definitions).]
      )
    ],
    [
      #figure(
        image("png/comments_boxplot_country_Belarus_kmeans_clusters.png"),
        caption: [Profiles of comments in Belarus (based on kmeans clustering of cosine similarity to definitions).]
      )
    ]
  )
]

#slide(title: [Similarity to definitions])[
  #grid(
    rows: (1fr, 1fr),
    row-gutter: 2em,
    [
      #figure(
        image("png/comments_barplot_country_Ukraine_kmeans_clusters.png"),
        caption: [Profiles of comments in Ukraine as the most probable categories.]
      )
    ],
    [
      #figure(
        image("png/comments_barplot_country_Belarus_kmeans_clusters.png"),
        caption: [Profiles of comments in Belarus as the most probable categories.]
      )
    ]
  )
]

#slide(title: [Summary])[
  #v(15%)
  + The hope expressed in Ukrainian comments seem to fade away the longer the russian invasion continues.

  + We observe distinct profiles of comments in Ukraine and Belarus, with varying distributions across the defined categories:
    - Ukrainian comments express appreciation more frequently;

    - Belarusian comments fall into either fear or concern category or national solidarity category.
  
]


#slide(title: [Next Steps])[
  #v(15%)

  + Improve the definition of categories.

  + Perform topic modeling of messages to better understand the differences in semantic spread.

  + Explore the relationship between message popularity and profile of comments.
]

#slide(title: [Thank You!])[

  #set text(18pt)
  #set par(hanging-indent: 2em)

  Alonso, A., & Oiarzabal, P. (Eds.). (2010). _Diasporas in the new media age: Identity, politics, and community._ University of Nevada Press.

  Brubaker, R. (2005). The "diaspora" diaspora. _Ethnic and racial studies_, _28_(1), 1-19.

  Castells, M. (2013). _Networks of outrage and hope: Social movements in the Internet age_. John Wiley & Sons.

  Sökefeld, M. (2006). Mobilizing in transnational space: a social movement approach to the formation of diaspora. _Global networks_, _6_(3), 265-284.

  Reimers, N., & Gurevych, I. (2019, November). Sentence-bert: Sentence embeddings using siamese bert-networks. In _Proceedings of the 2019 conference on empirical methods in natural language processing and the 9th international joint conference on natural language processing (EMNLP-IJCNLP)_, 3982-3992.
]