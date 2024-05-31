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

#let fmat = (mat, entryHeight) => {
  // return if matrix is empty
  if mat.rows.len() == 0 or mat.rows.at(0).len() == 0 {return mat} 
  let firstEntry = mat.rows.at(0).at(0)
  // return if entries are already wrapped in blocks (using the first entry) to avoid infinite recursion
  if firstEntry.func() == block {return mat} 
  // wrap every entry in block with fixed height
  let entries = mat.rows.map(row => {
    row.map(entry => {
      block(entry, height: entryHeight)
    })
  })
  set align(horizon)
  let delim = if mat.has("delim") {mat.delim} else {"["}
  math.mat(..entries, delim: delim)
}
