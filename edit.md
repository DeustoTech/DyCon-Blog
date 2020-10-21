---
category: proyect
title: Edit steps
description:
layout: syntax
---



<div class="contanier">
<p>This is a page that gives the steps to follow to modify and add a post.</p>

<ol>
    <li><a href="#1">GitHub Account</a></li>
    <li><a href="#2">DyConBlog Repository</a></li>
    <li><a href="#3">Folder description</a></li>
    <li><a href="#4">Edit post</a></li>
    <li><a href="#5">Update post</a></li>
</ol>
</div>

<h2 id="1">1. GitHub Account and Deusto Organization</h2>

DyCon Blog is hosted on the GitHub web service (<a href="https://pages.github.com/">GitHub Pages</a>) for them you need to create a GitHub account associated with your @deusto email.

In addition, it is necessary to belong to the GitHub organization to add content to DyCon Blog for this, contact the following email: <a href="mailto:djoroya@deusto.es"> djoroya@deusto.es </a>

<h2 id="2">3. DyConBlog Repository</h2>

If you have your github account logged into your local computer you can clone the repository

```bash
$ git clone https://github.com/DeustoTech/DyCon-Blog.git
```


<h2 id="3">3. Folder description</h2>

This web page is made with <a href="https://jekyllrb.com/">jekyll</a> software, so it has a typical structure for these projects (see <a href="https://jekyllrb.com/docs/structure/">struture jekyll directory</a>).

Let's see the contents of the repository with the command <code> ls -l </code>

```shell
(base) djoroya@djoroya-MRC-WX0:~/DyCon-Blog$ tree -L 1
```
```shell
.
├── assets
├── colorscheme.scss
├── _config.yml
├── css
├── _data
├── docs
├── edit.md
├── favicon.png
├── feed.xml
├── Gruntfile.js
├── img
├── _includes
├── index.html
├── info.md
├── js
├── _layouts
├── lib
├── LICENSE.md
├── node_modules
├── package.json
├── package-lock.json
├── plugin
├── _posts
├── projects
├── README.md
├── search.json
├── stl
├── syntax_help.md
├── threejs
└── typo.md
```

This folder define the html structure of the project. 

There are two very important folders for modifying content on DyCon Blog. Is are

<ul>
<li> <b> Images </b>: The <code> assets </code> folder contains all the image files and codes for all the posts </li>
    <ul>
        <li><code>assets/imgs/OT01</code></li>
        <li><code>assets/imgs/DP00</code></li>
        <li><code>assets/imgs/WP01</code></li>
        <li><code>assets/imgs/WP02</code></li>
        <li><code>assets/imgs/WP03</code></li>
        <li><code>assets/imgs/WP04</code></li>
        <li><code>assets/imgs/WP05</code></li>
        <li><code>assets/imgs/WP06</code></li>
        <li><code>assets/imgs/WP99</code></li>
    </ul>
<li> <b> Content </b>: In the <code> _post / tutorials </code> folder you will find each of the blog posts distributed in the following folders </li>
    <ul>
        <li><code>_posts/tutorials/OT01</code></li>
        <li><code>_posts/tutorials/DP00</code></li>
        <li><code>_posts/tutorials/WP01</code></li>
        <li><code>_posts/tutorials/WP02</code></li>
        <li><code>_posts/tutorials/WP03</code></li>
        <li><code>_posts/tutorials/WP04</code></li>
        <li><code>_posts/tutorials/WP05</code></li>
        <li><code>_posts/tutorials/WP06</code></li>
        <li><code>_posts/tutorials/WP99</code></li>
    </ul>
</ul>

We can see all the content of blogs with the following command:

```bash
(base) djoroya@djoroya-MRC-WX0:~/DyCon-Blog/_posts/tutorials$ tree
```
```bash
.
├── OT01
│   ├── 2018-05-01-P0001.md
│   ├── 2018-06-29-P0002.md
│   ├── 2018-06-29-P0003.md
│   ├── 2018-06-30-P0004.md
│   ├── 2018-07-03-P0005.md
│   └── 2018-07-23-P0006.md
├── DP00
│   ├── 2017-09-18-P0001.md
│   ├── 2018-10-26-P0002.md
│   └── 2019-02-04-P0003.md
├── OT03
│   └── 0001-01-01-P0001.md
├── WP01
│   ├── 2017-03-01-P0001.md
│   ├── 2017-11-01-P0002.md
│   ├── 2017-11-28-P0003.md
│   ├── 2017-12-21-P0004.md
│   ├── 2018-03-12-P0005.md
│   ├── 2018-10-19-P0006.md
│   ├── 2018-11-15-P0007.md
│   ├── 2020-02-10-P0008.md
│   └── 2020-02-10-P0009.md
├── WP02
│   ├── 2017-05-04-P0001.md
│   ├── 2017-10-25-P0002.md
│   ├── 2019-04-21-P0003.md
│   └── 2019-07-08-P0004.md
├── WP03
│   ├── 2017-08-05-P0001.md
│   ├── 2018-03-05-P0002.md
│   ├── 2019-05-31-P0003.md
│   ├── 2019-07-08-P0004.md
│   ├── 2020-03-30-P0005.md
│   ├── 2020-03-31-P0006.md
│   ├── 2020-04-04-P0007.md
│   ├── 2020-04-04-P0008.md
│   └── 2020-04-04-P0009.md
├── WP04
│   ├── 2017-05-04-P0001.md
│   ├── 2017-06-05-P0002.md
│   ├── 2017-11-05-P0003.md
│   ├── 2019-05-25-P0004.md
│   ├── 2019-06-14-P0005.md
│   ├── 2019-12-20-P0006.md
│   ├── 2020-02-31-P0007.md
│   ├── 2020-02-31-P0008.md
│   ├── 2020-03-07-P0009.md
│   └── 2020-04-01-P0010.md
├── WP05
│   ├── 2017-12-05-P0001.md
│   ├── 2017-12-05-P0002.md
│   ├── 2018-10-28-P0003.md
│   ├── 2018-10-29-P0004.md
│   ├── 2018-10-29-P0005.md
│   ├── 2019-03-26-P0006.md
│   ├── 2019-04-03-P0007.md
│   ├── 2019-06-04-P0008.md
│   ├── 2019-06-07-P0009.md
│   ├── 2019-06-07-P0010.md
│   ├── 2019-10-30-P0011.md
│   ├── 2019-10-30-P0012.md
│   ├── 2019-12-17-P0013.md
│   └── 2020-04-01-P0014.md
├── WP06
│   ├── 2017-11-05-P0001.md
│   ├── 2017-11-05-P0002.md
│   ├── 2018-10-28-P0003.md
│   ├── 2018-10-29-P0004.md
│   ├── 2019-05-27-P0005.md
│   ├── 2019-11-01-P0006.md
│   ├── 2020-03-01-P0008.md
│   └── 2020-04-01-P0007.md
└── WP99
    ├── 2017-10-11-P0001.md
    ├── 2018-04-05-P0002.md
    ├── 2018-06-29-P0003.md
    ├── 2018-07-21-P0004.md
    ├── 2019-01-07-P0005.md
    ├── 2019-02-04-P0006.md
    ├── 2019-03-26-P0007.md
    ├── 2019-06-26-P0008.md
    ├── 2019-07-18-P0009.md
    ├── 2019-09-30-P0010.md
    └── 2019-12-01-P9999.md

10 directories, 75 files

```
<h2 id="4">4. Edit post</h2>

All the posts are written in the <code> markdown </code> (.md) format. You can find a syntax guide on the following page: <a href="https://www.markdownguide.org/basic-syntax/"> basis-syntax </a>

For the best edition of the post, it is necessary to use a text editor that supports markdown, such as the <a href="https://code.visualstudio.com/"> Visual Studio Code </a> program. Also in need to install a plugin that render markdown, like for example <a href="https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one"> Markdown All in One</a>

You can edit with this view:

<img width="100%" src="{{site.url}}{{site.baseurl}}/assets/example.png">

Each post has in its url it contains the address of the folder where it is located.

<h3> Example</h3>

```
https://deustotech.github.io/DyCon-Blog/tutorial/wp04/P0010
```

Se encuentra en: <code>_posts/tutorials/WP04/2020-04-01-P0010.md</code>

If we open the content

```markdown
---
title: Inverse problem for Hamilton-Jacobi equations
description: "In this tutorial we study the inverse design problem for time-evolution Hamilton-Jaco
bi equations. More precisely, for a given observation of the viscosity solution at time $T>0$, we c
onstruct all the possible initial data that could have led the solution to the observed state. We n
ote that these initial data are not in general unique. "
date: 2020-04-03
author: [CarlosE]
layout: tutorial
categories: [tutorial,WP04]
url_zip: assets/imgs/WP04/P0010/CodesHJ.rar
avatar: https://deustotech.github.io/DyCon-Blog/assets/imgs/WP04/P0010/ico.gif
code: MATLAB
equation: Hamilton-Jacobi
---

### Background and motivation

We consider the initial-value problem for a Hamilton-Jacobi equation of the form

$$
\tag{HJ}
\left\{ \begin{array}{ll}
\partial_t u + H(D_x u) = 0, & \text{in} \ [0,T]\times \mathbb{R}^n, \\
u(0,x) = u_0(x), & \text{in} \ \mathbb{R}^n,
\end{array}\right.
$$

where $u_0\in C^{0,1}(\mathbb{R}^n)$ and the Hamiltonian $H: \mathbb{R}^n\rightarrow\mathbb{R}$ is 
assumed to satisfy the following hypotheses:

$$
\tag{2}
H\in C^2(\mathbb{R}^n), \quad H_{pp}(p) >0, \ \forall p\in\mathbb{R}^n, \quad \text{and} \quad 
\lim_{|p|\to\infty} \dfrac{H(p)}{|p|} = +\infty.

$$
```

The images referring to this Blog are in

```bash
(base) djoroya@djoroya-MRC-WX0:~/DyCon-Blog$ tree assets/imgs/WP04/P0010/
```

```bash
assets/imgs/WP04/P0010/
├── 01_Fig11.png
├── 02_Vid11.gif
├── 02_Vid12.gif
├── 03_Fig12.png
├── 04_Fig13.png
├── 05_Vid2.gif
├── 06_Vid3.gif
├── 07_Fig21.png
├── 08_Vid41.gif
├── 08_Vid42.gif
├── 09_Fig22.png
├── 10_Fig23.png
├── 11_Fig31.png
├── 12_Vid5Gif.gif
├── 13_Vid6Gif.gif
├── 14_Fig41.png
├── 15_Vid7Gif.gif
├── 16_Vid8Gif.gif
├── 17_Vid9Gif.gif
├── CodesHJ.rar
└── ico.gif
```

o use them within the blog content, the following syntax is necessary:

```html
 <img src="{site.url}{site.baseurl}/assets/imgs/WP04/P0010/01_Fig11.png"> 
```

<h2 id="#5">Update Post</h2>

This whole project has been done with the help of the <a href="https://jekyllrb.com/"> jekyll </a> program. You must have <code> jekyll </code> installed to be able to upload content directly. Another option is to upload your changes using `Github`, and notify the administrator (<a href="mailto:djoroya@deusto.es"> djoroya@deusto.es </a>) to compile your changes.

If you have jekyll installed you can update the web directly being in the main project folder, using the following command

```
jekyll build 
```

To see a preview of the web you can use

```
jekyll server 
```
```
Configuration file: /DyCon-Blog/_config.yml
            Source: /DyCon-Blog
       Destination: /DyCon-Blog/docs
 Incremental build: disabled. Enable with --incremental
      Generating... 
                    done in 8.035 seconds.
 Auto-regeneration: enabled for '/DyCon-Blog'
    Server address: http://127.0.0.1:4000/DyCon-Blog/
  Server running... press ctrl-c to stop.

```

While this command is working you can access the web <a href="http://127.0.0.1:4000/DyCon-Blog/">http://127.0.0.1:4000/DyCon-Blog/</a>. This is a local version of the Dycon Web. All changes made will be seen on this local website


In summary, the steps to upload content are:
<ul>
    <li><code>jekyll build</code> <b>Very Important step</b></li>
    <li>Update the GitHub repository</li>
</ul>
