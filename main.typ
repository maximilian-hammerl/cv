#let json-file = sys.inputs.at("jsonFile", default: "translations/german.json")
#let data = json(json-file)
#let release-version = sys.inputs.at("releaseVersion", default: "dev")

#set page(
  paper: "a4",
  margin: 1.2cm,
  footer: [
    #text(fill: gray)[
      #release-version,
      #datetime.today().display()
    ]
    #h(1fr)
    #text(fill: gray)[
      #link("https://github.com/maximilian-hammerl/cv/releases")[
        #data.downloadCv GitHub
      ]
    ]
  ]
)

#set par(
  justify: true,
)

#set text(
  font: "Libertinus Serif",
  size: 10pt
)

#show link: underline

#show "GitHub": name => box[
  #box(image(
    "icons/github.svg",
    height: 0.7em,
  ))
  #name
]

#show "LinkedIn": name => box[
  #box(image(
    "icons/linkedin.svg",
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
      #align(horizon)[
        #text(weight: "bold", size: 12pt)[
          #smallcaps[
            #title
          ]
      ]
      ]
    ],
  )
]

#let section-subtitle(title) = [
  #grid(
    columns: (2pt, 1fr),
    gutter: 4pt,
    align: (start, start),
    [
      #rect(width: 2pt, height: 1em, fill: accent)
    ],
    [
      #align(horizon)[
        #text(weight: "bold")[
          #title
        ]
      ]
    ],
  )
]

#grid(
  columns: (22%, 75%),
  gutter: 3%,
  [
        Platzhalter für Bild
  ],

  [
    #text(size: 28pt, weight: "bold")[
      #smallcaps("Maximilian Hammerl")
    ] \
    #text(size: 12pt, fill: accent, weight: "bold")[
      #smallcaps("Senior Software Engineer")
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

    #v(16pt)

    #section-title(data.language.title)

    #for language in data.language.languages [
      *#language.name* \
      #language.proficiency

      #v(4pt)
    ]
  ],

  [
    #section-title(data.profile.title)

    #data.profile.text

    #v(8pt)

    #section-title(data.workExperience.title)

    #for company in data.workExperience.companies [
      #section-subtitle(company.name)

      #grid(
        columns: (25%, 75%),
        gutter: 10pt,
        ..company.positions.map(position => (
          if position.to != "" [
            #position.from \- #position.to
          ] else [
            #position.from
          ],
          text(weight: "bold")[#position.title],
        )).flatten(),
      )

      #text(weight: "bold")[
        #data.tasks:
      ]
      #for task in company.tasks [
        - #task
      ]

      #text(weight: "bold")[
        #data.technologies:
      ]
      #company.technologies.join(", ")

      #v(8pt)
    ]

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
