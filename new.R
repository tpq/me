insert <- function(file, after, what){
  
  # Read lines from connection
  con <- file(file)
  lines <- readLines(con)
  
  # Find where to insert the new line
  i <- which(grepl(after, lines))[1]
  
  # Insert the new line
  if(i == length(lines)){
    
    new <- c(lines[1:i], as.character(what))
    
  }else{
    new <- c(lines[1:i], as.character(what), lines[(i+1):length(lines)])
  }
  
  # Write lines to connection
  writeLines(new, con = con)
  close(con)
}

newMusings <- function(blog.title = "New Title", after = "### 2016"){
  
  # Write custom blog template to new file
  blog.name <- gsub("\\s", "-", stringr::str_to_lower(blog.title))
  blog.file <- paste0(getwd(), "/", blog.name, ".Rmd")
  blog.new <- file(blog.file)
  
  blog.template <-
    paste0("---
title: \"", blog.title, "\"
---

```{r setup, include = FALSE}
knitr::opts_chunk$set(cache = TRUE)
```

### Placeholder

Placeholder
"
           )
  
  writeLines(blog.template, con = blog.new)
  close(blog.new)
  
  # Add blog index to musings.html
  insert("musings.Rmd", after = after, what = "")
  blog.link <- paste0("##### [**", blog.title, "**](", blog.name, ".html)")
  insert("musings.Rmd", after = after, what = blog.link)
  insert("musings.Rmd", after = after, what = "")
  
  # Add blog index to feed.rss
  rss.loc <- "<description>Personal website of Thom Quinn</description>"
  insert("feed.rss", after = rss.loc, what = "  </index>")
  insert("feed.rss", after = rss.loc, what = "    <description>[PLACEHOLDER]</description>")
  warning("Make sure to edit the RSS feed (feed.rss) with a proper description!")
  rss.link <- paste0("    <link>http://www.http://tpq.me/", blog.name, ".html</link>")
  insert("feed.rss", after = rss.loc, what = rss.link)
  rss.title <- paste0("    <title>", blog.title, "</title>")
  insert("feed.rss", after = rss.loc, what = rss.title)
  insert("feed.rss", after = rss.loc, what = "  <index>")
}

newFiction <- function(blog.title = "New Title", after = "### Poetry"){
  
  # Write custom blog template to new file
  blog.name <- gsub("\\s", "-", stringr::str_to_lower(blog.title))
  blog.file <- paste0(getwd(), "/", blog.name, ".Rmd")
  blog.new <- file(blog.file)
  
  blog.template <-
    paste0("---
title: \"", blog.title, "\"
---

### Placeholder

Placeholder
"
    )
  
  writeLines(blog.template, con = blog.new)
  close(blog.new)
  
  # Add blog index to musings.html
  insert("fiction.Rmd", after = after, what = "")
  blog.link <- paste0("##### [**", blog.title, "**](", blog.name, ".html)")
  insert("fiction.Rmd", after = after, what = blog.link)
  insert("fiction.Rmd", after = after, what = "")
}
