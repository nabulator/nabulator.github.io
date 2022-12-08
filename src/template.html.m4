m4_divert(1)m4_dnl
<!doctype html>
m4_dnl  Prepare some default values. If we have not defined a __TITLE macro in
m4_dnl  the content, the page will be davleop
m4_ifdef(`__TITLE',, `m4_define(`__TITLE', `davleop')')
m4_ifdef(`__ROOT',, `m4_define(`__ROOT', `')')
m4_ifdef(`__DESCRIPTION',, `m4_define(`__DESCRIPTION', `I build garbage from garbage.')')
m4_ifdef(`__ICON',, `m4_define(`__ICON', `favicon.png')')

<head>
    <meta charset="utf-8">

    <title>__TITLE</title>

    m4_dnl  Google will often use this as its description of your page/site. Make it good.
    <meta name="google-site-verification" content="designing arcade style controllers and other random tech stuff">
    m4_dnl  Speaking of Google, don't forget to set your site up: http://google.com/webmasters

    <meta name="title" content="__TITLE">
    <meta name="description" content="__DESCRIPTION">
    <meta name="keywords" content="EE, DIY, woodworking, hacking, bemani, arcade">
    <meta name="author" content="davleop">
    <meta name="Copyright" content="CC-BY 4.0">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta property="og:title" content="__TITLE" />
    <meta property="og:description" content="__DESCRIPTION" />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://davleop.com/__PAGEURL" />
    <meta property="og:image" content="https://davleop.com/img/__ICON" />

    <link rel="stylesheet" href="./lolstyle.css">
    
</head>

<body>
<div>
    <header>
        </header>
    <article>
m4_dnl
m4_divert(3)m4_dnl  --- Content will be placed here ---
m4_dnl
    </article>
    <aside>
<!--      <h3>Other Pages</center>
      <ul> <li> <a href="openpad.html"> Stepmania Pad </a></li>
      <li><a href="beatmania.html"> BMS Controller </a> </li> </ul>
-->
    </aside> 
    <footer>
    <hr/>
        <a rel="license" href="http://creativecommons.org/licenses/by/4.0/"></a>All content on this domain (unless otherwise specified) is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">CC-BY 4.0</a> davleop.com 2021
    <br>
    <p>Last modified: m4_esyscmd(`date +%F') </p>
    </footer>
</div>

</body>
</html>
m4_dnl vim: ft=m4 :
