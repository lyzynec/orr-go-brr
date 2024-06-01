#let project(
  title: "",
  author: "",
  body) = {
  set heading(numbering: "1.A.1")
  show heading.where(level: 1): it =>[
    #let numbers = counter(heading).at(it.location())
    #block([#it.body #numbering(it.numbering, ..numbers)])
  ]

  show heading.where(level: 2): it =>[
    #block(it.body)
  ]

  show heading.where(level: 4): it =>[
    #block(it.body + ":")
  ]

  set document(author: author, title: title)
  set text(font: "Linux Libertine", lang: "en")

  align(center)[#block(text(weight: 700, 1.75em, title))]


  set math.mat(delim: "[")
  set math.vec(delim: "[")

  body
}

#let week(body) = {
  heading(level: 1)[Week]
  body
}

#let knowledge(body) = {
  heading(level: 2)[Knowledge (I remember and understand)]
  body
}

#let skills(body) = {
  heading(level: 2)[Skills (I can use the knowledge to solve a problem)]
  body
}

#let question(name: [], body) = {
  heading(level: 3)[#name]
  body
}

#let part(name: [], body) = {
  box(width: 100%, stroke: 1pt, inset: 7.5pt)[
    #heading(level: 4)[#name]
    #body
  ]
}
