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

<br>
"
           )
  
  writeLines(blog.template, con = blog.new)
  close(blog.new)
  
  # Add blog index to musings.html
  blog.link <- paste0("##### [**", blog.title, "**](", blog.name, ".html)")
  miSciTools::insert("musings.Rmd", after = after, what = blog.link)
  miSciTools::insert("musings.Rmd", after = after, what = "")
  
  # Add blog index to feed.rss
  rss.loc <- "<description>Personal website of Thom Quinn</description>"
  miSciTools::insert("feed.rss", after = rss.loc, what = "  </item>")
  miSciTools::insert("feed.rss", after = rss.loc, what = "    <description>[PLACEHOLDER]</description>")
  warning("Make sure to edit the RSS feed (feed.rss) with a proper description!")
  rss.link <- paste0("    <link>http://www.tpq.me/", blog.name, ".html</link>")
  miSciTools::insert("feed.rss", after = rss.loc, what = rss.link)
  rss.title <- paste0("    <title>", blog.title, "</title>")
  miSciTools::insert("feed.rss", after = rss.loc, what = rss.title)
  miSciTools::insert("feed.rss", after = rss.loc, what = "  <item>")
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

<br>
"
    )
  
  writeLines(blog.template, con = blog.new)
  close(blog.new)
  
  # Add blog index to musings.html
  blog.link <- paste0("##### [**", blog.title, "**](", blog.name, ".html)")
  miSciTools::insert("fiction.Rmd", after = after, what = blog.link)
  miSciTools::insert("fiction.Rmd", after = after, what = "")
}
