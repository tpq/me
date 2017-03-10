system(paste("wget -O /home/thom/Dropbox/R/projects/tpq/me/feed-full.rss",
             "http://ftr.fivefilters.org/makefulltextfeed.php?url=http%3A%2F%2Ftpq.me%2Ffeed.rss&max=10")
)

rss <- readLines(con = "feed-full.rss")
search <- paste0("&lt;/p&gt;&lt;/div&gt;&lt;p&gt;&lt;strong&gt;&lt;a href=&quot;https://blockads.fivefilters.org&",
                 "quot;&gt;Let's block ads!&lt;/a&gt;&lt;/strong&gt; &lt;a href=&quot;https://blockads.fivefilters.",
                 "org/acceptable.html&quot;&gt;(Why?)&lt;/a&gt;&lt;/p&gt;")
rss.clean <- unlist(lapply(rss, function(x) gsub(search, "", x, fixed = TRUE)))
writeLines(rss.clean, con = "feed-full.rss")
