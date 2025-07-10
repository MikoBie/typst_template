#import "@preview/cetz:0.4.0"
#import "@preview/cetz-plot:0.1.2": chart

#set page(width: auto, height: auto, margin: 0pt)
#let  YellowColor = rgb("#E6B830")
#let BlueColor = rgb("#A5C9E6")
#let GreenColor = rgb("#73C0C1")
#set text(font: "New Computer Modern", weight: "semibold", size: 14pt, hyphenate: false)

#let model = cetz.canvas({
  import cetz.draw: *
  let arctext(
    start-angle:0deg,
    stop-angle:90deg,
    color:black,
    inner-radius:1,
    outter-radius:2,
    angle-line:45deg,
    angle-text: 135deg,
    text:[Example],
    procent: 65%,
    text-size: 9pt
    ) = {
    merge-path(fill: color, close: true, stroke: white,{
      arc((0,0), start: start-angle,stop: stop-angle, radius: inner-radius, anchor: "origin")
      arc((0,0), start: stop-angle, stop: start-angle, radius: outter-radius, anchor: "origin", name: "outter")
    })
    line((0,0), (angle: angle-line, radius: outter-radius), stroke: none, name: "text")
    content(("text.start", procent, "text.end"), [#smallcaps[#text]], angle:angle-text)

  }


  // MOTIVATION
  arctext(
  start-angle: 30deg,
  stop-angle: 150deg,
  color: YellowColor,
  inner-radius:  2,
  outter-radius:  4,
  angle-line:  90deg,
  angle-text:  0deg,
  text: [Motivations],
  procent: 65%
  )
  arctext(
  start-angle: 30deg,
  stop-angle:90deg,
  color: YellowColor.lighten(20%),
  inner-radius:  4,
  outter-radius:  6,
  angle-line:  60deg,
  angle-text: -30deg,
  text: [Reflective],
  procent:  80%
  )
  arctext(
  start-angle: 90deg,
  stop-angle: 150deg,
  color: YellowColor.lighten(20%),
  inner-radius:4,
  outter-radius:6,
  angle-line: 120deg,
  angle-text: 30deg,
  text: [Automatic],
  procent: 80%
  )
  arctext(
  start-angle: 150deg,
  stop-angle:  270deg,
  color:  BlueColor,
  inner-radius: 2,
  outter-radius: 4,
  angle-line:  210deg,
  angle-text:  120deg,
  text: [Capabilities],
  procent: 65%
  )
  arctext(
  start-angle: 150deg,
  stop-angle:  210deg,
  color:  BlueColor.lighten((20%)),
  inner-radius: 4,
  outter-radius: 6,
  angle-line:  180deg,
  angle-text:  90deg,
  text: [Psychological],
  procent:  80%
  )
  arctext(
  start-angle: 210deg,
  stop-angle:  270deg,
  color:  BlueColor.lighten((20%)),
  inner-radius:  4,
  outter-radius:  6,
  angle-line:  240deg,
  angle-text:  150deg,
  text: [Physical],
  procent:  80%
  )
  arctext(
  start-angle: 270deg,
  stop-angle:  390deg,
  color:  GreenColor,
  inner-radius:  2,
  outter-radius: 4,
  angle-line:  330deg,
  angle-text: 240deg,
  text: [Opportunities],
  procent:  65%
  )
  arctext(
  start-angle: 270deg,
  stop-angle:  330deg,
  color:  GreenColor.lighten(20%),
  inner-radius:  4,
  outter-radius:  6,
  angle-line:  300deg,
  angle-text:  210deg,
  text: [Social],
  procent:  80%
  )
  arctext(
  start-angle: 330deg,
  stop-angle: 390deg,
  color:  GreenColor.lighten(20%),
  inner-radius: 4,
  outter-radius: 6,
  angle-line:360deg,
  angle-text: 270deg,
  text:[Physical],
  procent: 80%
  )
})

#figure(rotate(2400deg, origin: horizon, reflow: false)[#box[#model]])
