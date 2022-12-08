#/bin/bash

# Invokes python script from https://github.com/c4software/python-sitemap

/home/taeda/tools/python-sitemap/main.py --domain http://davleop.com --images | xmllint --format - > /usr/share/nginx/html/static/sitemap.xml

