FROM httpd:latest

LABEL "author" "Basile Pracca"

COPY . /usr/local/apache2/htdocs/
