// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), logo: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(
    width: 4.9in,
    height: 6.8in,
    numbering: "1",
    number-align: center,
    margin: 0em,
  )
  set text(font: "Amiri", lang: "ar", size: 1.3em)
  show table: set align(center)

  // Set paragraph spacing.
  //show par: set block(above: 1.2em, below: 1.2em)

  //set par(leading: 0.75em)

  // Title page.
  // The page can contain a logo if you pass one with `logo: "logo.png"`.
  //v(0.6fr)
  //if logo != none {
  //  align(right, image(logo, width: 26%))
  //}
  //v(9.6fr)
//
  //text(2em, weight: 700, title)
//
  //// Author information.
  //pad(
  //  top: 0.7em,
  //  right: 20%,
  //  grid(
  //    columns: (1fr,) * calc.min(3, authors.len()),
  //    gutter: 1em,
  //    ..authors.map(author => align(start, strong(author))),
  //  ),
  //)

  //v(2.4fr)
  //pagebreak()


  // Table of contents.
  //outline(depth: 3, indent: true)
  //pagebreak()


  // Main body.
  //set par(justify: true)

  body
}
