FROM pandoc/latex as builder

WORKDIR /data
COPY . .

RUN pandoc mvcc.tex -o mvcc.html

FROM httpd:2.4

COPY --from=builder /data/mvcc.html /usr/local/apache2/htdocs/mvcc.html
