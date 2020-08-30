m4_divert(1)m4_dnl
<!doctype html>
m4_dnl  Prepare some default values. If we have not defined a __TITLE macro in
m4_dnl  the content, the page will be nabulator
m4_ifdef(`__TITLE',, `m4_define(`__TITLE', `nabulator')')
m4_ifdef(`__ROOT',, `m4_define(`__ROOT', `')')

<head>
    <meta charset="utf-8">

    <title>__TITLE</title>

    m4_dnl  Google will often use this as its description of your page/site. Make it good.
    <meta name="google-site-verification" content="">
    m4_dnl  Speaking of Google, don't forget to set your site up: http://google.com/webmasters

    <meta name="title" content="__TITLE">
    <meta name="description" content="I build garbage from garbage.">
    <meta name="keywords" content="EE, DIY, woodworking, hacking">
    <meta name="author" content="nabulator">
    <meta name="Copyright" content="CC-BY 4.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./lolstyle.css">
    
</head>

<body>
<div>
    <header>
        <h1>__TITLE</h1>
        </header>
    <article>
m4_dnl
m4_divert(3)m4_dnl  --- Content will be placed here ---
m4_dnl
    </article>
    <aside>
      <h5>Other Pages</h5>
      <ul> <li> <a href="openpad.html"> Stepmania Pad </a></li>
      <li><a href="beatmania.html"> BMS Controller </a> </li> </ul>

    </aside>
    <footer>
 <hr/>
        <a rel="license" href="http://creativecommons.org/licenses/by/4.0/"></a>All content on this domain (unless otherwise specified) is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">CC-BY 4.0</a> nabulator.com 2020
    </footer>
</div>

</body>
</html>
m4_dnl vim: ft=m4 :
