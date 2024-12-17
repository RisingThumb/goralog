# Goralog

Goralog is a pretty basic Werc(https://werc.cat-v.org) app that allows me to add new blog posts or just generically new posts for anything.

This is what I use for my site https://risingthumb.xyz, under the blackwindbooks, updates and writing/blogs sections.

## Features

- Adds a button to the sidebar for making a blog post.
- When posting a blog post, there is 4 fields. One for the title, one for a short description of the blog post, one for the date of the blog post, and one for the text of the blog post.
- Automatic RSS generation.
- Can be enabled in multiple folders for multiple blogs side by side. Useful for a site update log, project-specific update logs and more.
- Blogs are listed by date on the page. In the sidebar they are listed chronologically by file name.

## Roadmap

- Ideally there should be some categorisation/tagging tool. This would ideally be done by folder, so on the sidebar you see all the categories/tags, can click into them and see "sub blogs" on those. Ideally these would also generate unique RSS feeds for those too.
- Preview functionality would be nice

## Installation and usage
- git clone this repository to your werc apps folder
- In your site, under the folder you want to make into a blog, add `conf_enable_goralog` into your `_werc/config` file.
- You may additionally add a `conf_blog_title='RisingThumb''s blog'` in your `_werc/config` file. This lets you define a name for the blog.
- This doesn't override the default header functionality. If you would like a little text before the blog post listing, you may additionally make a `_header.md` file.
- In order to create a blog post, once you're in the blog folder and logged in as a user, you can make a new blog post

Note, it's recommended to use this alongside dirdir so you can edit blog posts. Additionally descriptions and dates are saved in the same blog folder as nameOfFile.md.meta. If you change a blog post's file name, you will also need to change it's associated metadata filename.

## License
Licensed under MIT License. Additionally dedicated to public domain.

