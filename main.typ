#set page(
  paper: "a4",
  margin: 2cm,
)

#set text(
  font: "Libertinus Serif",
  size: 11pt
)

#show link: underline

#show "GitHub": name => box[
  #box(image(
    "github.svg",
    height: 0.7em,
  ))
  #name
]

#show "LinkedIn": name => box[
  #box(image(
    "linkedin.svg",
    height: 0.7em,
  ))
  #name
]

#let accent = rgb("#2f6fb3")

#let section-title(title) = [
  #grid(
    columns: (3pt, 1fr),
    gutter: 8pt,
    align: (start, start),
    [
      #rect(width: 3pt, height: 1em, fill: accent)
    ],
    [
      #text(weight: "bold")[
        #upper[
          #title
        ]
      ]
    ],
  )
]

#let data = json("data-de.json")

#grid(
  columns: (26%, 74%),
  gutter: 24pt,
  [
        Platzhalter für Bild
  ],

  [
    #text(size: 28pt, weight: "bold")[
      #upper("Maximilian Hammerl")
    ]
    #text(size: 12pt, fill: accent, weight: "bold")[
      Senior Software Engineer
    ]
  ],

  [
    #section-title(data.social.title)

    *LinkedIn* \
    #link("https://www.linkedin.com/in/maximilian-hammerl-09aa69196/")[
      Maximilian Hammerl
    ]

    #v(8pt)

    *GitHub* \
    #link("https://github.com/maximilian-hammerl")[
      maximilian-hammerl
    ]

    #v(16pt)

    #section-title(data.contact.title)

    *#data.contact.email* \
    #link("mailto:maximilian@hammerl.dev")

    #v(8pt)

    *#data.contact.phone* \
    #link("tel:+49 151 41463744")

    #v(8pt)

    *#data.contact.address* \
    86438 Kissing

    #v(16pt)

    #section-title(data.language.title)

    #for language in data.language.languages [
      *#language.name*  - #language.proficiency \
    ]
  ],

  [
    #section-title("PROFIL")

    Platzhalter

    #v(26pt)

    #section-title(data.workExperience.title)

    #for company in data.workExperience.companies [
      *#company.name*

      #grid(
        columns: (25%, 75%),
        gutter: 10pt,
        ..company.positions.map(position => (
          position.from + [ \- ] + position.to,
          text(weight: "bold")[#position.title],
        )).flatten(),
      )

      Aufgaben
      #for task in company.tasks [
        - #task
      ]

      #v(8pt)
    ]

    #v(8pt)

    #section-title(data.education.title)

    #grid(
      columns: (25%, 75%),
      gutter: 10pt,
      ..data.education.steps.map(step => (
        step.from + [ \- ] + step.to,
        text(weight: "bold")[#step.title]
        + [ \ ]
        + step.institution,
      )).flatten(),
    )
  ]
)
