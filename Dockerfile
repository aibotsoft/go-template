FROM scratch

COPY dist/ go/run

CMD ["/go/run"]