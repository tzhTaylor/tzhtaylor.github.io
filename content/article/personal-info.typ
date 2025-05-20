#import "/typ/templates/blog.typ": main
#show: main.with(
  title: "Personal Information",
  desc: [This is a test post.],
  date: "2025-04-25",
)

= Personal Information

- Name：Taylor Swift
- Birthday：12.13
- Year：36

= About Me

#include "/content/other/about.typ"
