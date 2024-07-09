FROM ssangyongsports/chdjjdjdkklslaaa:develop-ce


COPY --chmod=755 start.sh ./

ENTRYPOINT ["/bin/sh"]

CMD ["start.sh"]
