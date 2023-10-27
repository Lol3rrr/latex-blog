FROM pandoc/latex as builder

WORKDIR /data
COPY . .

RUN pandoc mvcc.tex -o mvcc.html -s -t html5

FROM httpd:2.4

# RUN echo "AddDefaultCharset utf-8" >> /usr/local/apache2/htdocs/.htaccess

COPY --from=builder /data/mvcc.html /usr/local/apache2/htdocs/mvcc.html
