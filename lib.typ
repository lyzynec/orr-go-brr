#let project(
    title: "",
    author: "",
    body) = {

    set document(author: author, title: title)
    set text(font: "Linux Libertine", lang: "en")
    set page(numbering: "1")


    set heading(numbering: "1.A.1")
    show heading.where(level: 1): it =>[
        #block(it.body)
    ]

    show heading.where(level: 2): it =>[
        #block(it.body)
    ]

    show heading.where(level: 4): it =>[
        #block(it.body + ":")
    ]

    set math.mat(delim: "[")
    set math.vec(delim: "[")

    align(center)[#block(text(weight: 700, 1.75em, title))]

    body
}

#let week(body) = {
    context heading(level: 1)[Week #{counter(heading).get().at(0) + 1}]
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
