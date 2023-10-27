FROM pandoc/latex as builder

WORKDIR /data
COPY . .

RUN mkdir out/
RUN pandoc mvcc.tex -o out/mvcc.html -s -t html5
RUN pandoc interval-stack.tex -o out/interval-stack.html -s -t html5

FROM httpd:2.4

# RUN echo "AddDefaultCharset utf-8" >> /usr/local/apache2/htdocs/.htaccess

COPY --from=builder /data/out/*.html /usr/local/apache2/htdocs/
