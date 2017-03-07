# Coder's Den
---
## Resources:
- Trello Board: https://trello.com/b/rMUIig9N
- SRS: http://bit.ly/2lqNQlJ

## Post formatting
Post formatting uses Markdown

Quick reference: https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

## System specifications:
---

System was developed using:

- Ruby version: **ruby 2.3.3p222**
- Ruby on Rails version: **v5.0.1**
- Devise version: **v4.2.0** for authentication
- Thredded version: **v0.9.4** as forums engine
- Sass for styling
- PostgreSQL database

### Development
When working with the *Thredded* engine, you may want to modify/override some thredded views or controllers. To override these files you must copy them from the gem engine project into the actual project. Using this command you can copy files to the necessary folder in the project.

Run inside project folder. Specify folder location and file name. In this example, we copy the _post.html.erb partial into the project.

```{r, engine='bash', count_lines}
mkdir -p app/views/thredded/users/ && cp "$(bundle show thredded)/$_/_post.html.erb" "$_"
```

You can view the thredded project directory at [GitHub](https://github.com/thredded/thredded). 

### Configuration
_Pending_

### Database creation
In a terminal, inside the project folder run:

```{r, engine='bash', count_lines}
rake db:create
```

### Database initialization
In a terminal, inside the project folder run:

```{r, engine='bash', count_lines}
rake db:migrate
```

### Deployment instructions
_Pending_
