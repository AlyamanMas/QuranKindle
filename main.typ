#import "template.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Quran",
  authors: (
    "Alyaman Massarani",
  ),
)

#show heading: set text(0pt)
#set heading(numbering: "1.")

#let data = toml("data.toml")
#let chapters = json("chapters.json")
#let debug = white

#let surah_starting_pages = chapters.chapters.map(sura => sura.pages.at(0))
//#repr(surah_starting_pages)

#let get_juz(page) = {
  for index in range(29, -1, step: -1) {
    let juz_page = data.page_for_juz.at(index)
    if page >= juz_page {
      return index + 1
    }
  }
}

#let numpad(x) = {
  if x < 10 {
    return "00" + str(x)
  } else if x < 100 {
    return "0" + str(x)
  } else if x < 1000 {
    return str(x)
  }
}

#let arabicnum(x) = {
  let num = x // if string
  if type(x) == int {
    num = str(x)
  }

  return num
    .replace("0", "٠")
    .replace("1", "١")
    .replace("2", "٢")
    .replace("3", "٣")
    .replace("4", "٤")
    .replace("5", "٥")
    .replace("6", "٦")
    .replace("7", "٧")
    .replace("8", "٨")
    .replace("9", "٩")
}

#let get_surah(page) = {
  let page = page - 1
  let surah_number = data.surah_for_page.at(page)
  return chapters.chapters.at(surah_number - 1).name_arabic 
}

#for i in range(1, 605) {
  if i in surah_starting_pages {
    let surah_index = surah_starting_pages.position(x => x == i)
    [ // Using content here because label can only attach inside a content block as of current version of Typst
      #heading(
        chapters.chapters.at(surah_index).name_arabic
      )
      #label(
        str(surah_index)
      )
    ]
  }
  [
    #place(
        top + right,
        dy: -0em,
        [
          #block(
            stroke: debug,
            clip: true,
            width: 84%,
            height: 100%,
          )[
          #table(
            inset: 0em,
            column-gutter: 0em,
            //fill: black,
            row-gutter: 0em,
            rows: (auto, 1fr, auto),
            stroke: debug,
            [
              #table(
                columns: (1fr, 0.33fr, 1fr),
                stroke: debug,
                [سورة #get_surah(i)], [#arabicnum(i)], [الجزء #arabicnum(get_juz(i))]
              )
            ],
            [
              #align(center + horizon)[
                #block(inset: 0.5em)[
                  #image("cropped/" + numpad(i) +"___Hafs39__DM.ai.svg")
                ]
              ]
            ],
          )
          ]
          
        ]
    )
  #pagebreak()
  ]
}

#{ // table of contents
  let generate_surah_ref(surah_index) = {
    link(
      (
        page: surah_starting_pages.at(surah_index),
        x: 0pt,
        y: 0pt,
      ),
      block(
        text(
          //baseline: -0.4em,
          chapters.chapters.at(surah_index).name_arabic,
        ),
        width: 100%,
        height: 100%,
        fill: rgb("#eee"),
        radius: 0.5em,
      )
    )
  }
  pad(
    x: 1em,
    top: 0.65em,
    [
      #heading("الفهرس")
      #label("الفهرس")
      #align(
        center,
        text(
          top-edge: 1em,
          weight: "bold",
          size: 2em,
          "الفهرس"
        )
      )
      #table(
        columns: (1fr, 1fr, 1fr),
        rows: (3em),
        align: center + horizon,
        stroke: white,
        ..range(0, 114).map(s => generate_surah_ref(s))
      )
    ]
  )
}

// TODO: Add Tafseer section and link it to ayah's on the left margin of the text
