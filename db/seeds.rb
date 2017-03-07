# frozen_string_literal: true
admin = User.create!(
    display_name: 'Admin',
    email: "admin@codersden.com",
    password: "123456",
    admin: true
)

messageboardgroup = Thredded::MessageboardGroup.create!(
    name: 'General',
)

messageboard = Thredded::Messageboard.create!(
    name: 'Discusión General',
    slug: 'general',
    description: 'Discusión general sobre la programación competitiva',
    group: messageboardgroup
)

Thredded::TopicForm.new(
    title: 'Example topic',
    content: <<-MARKDOWN,
Hello **world**! :smile: This first post shows some of the Thredded default post
formatting functionality.

### Quote

> There is nothing either good or bad, but thinking makes it so.

### Image

![lime-cat](https://cloud.githubusercontent.com/assets/216339/19857777/2be75b1e-9f3c-11e6-9845-f30ceb4308a9.jpg)

### Video

https://www.youtube.com/watch?v=dQw4w9WgXcQ

### Table

| x | y | x ⊕ y |
|---|---|:-----:|
| 1 | 1 |   0   |
| 1 | 0 |   1   |
| 0 | 1 |   1   |
| 0 | 0 |   0   |

### Code

```ruby
puts 'Hello world'
```

Code highlighting can be enabled by installing the
[Markdown Coderay plugin](https://github.com/thredded/thredded-markdown_coderay).

BBCode support (e.g. [b]bold[/b]) can be enabled by installing the
[BBCode plugin](https://github.com/thredded/thredded-bbcode).

TeX Math support (e.g. $$\phi$$) can be enabled by installing the
[KaTeX plugin](https://github.com/thredded/thredded-markdown_katex).
    MARKDOWN
    user: admin,
    messageboard: messageboard
).save

Thredded::Messageboard.create!(
    name: 'Problemas Competitivos',
    slug: 'problems',
    description: 'Lista de problemas competitivos',
    group: messageboardgroup
)


messageboardgroup = Thredded::MessageboardGroup.create!(
    name: 'Temas de Programación',
)

Thredded::Messageboard.create!(
    name: 'Algoritmos',
    slug: 'algorithms',
    description: 'Discusión sobre algoritmos',
    group: messageboardgroup
)

Thredded::Messageboard.create!(
    name: 'Estructuras de Datos',
    slug: 'data-structures',
    description: 'Discusión sobre estructuas de datos',
    group: messageboardgroup
)
