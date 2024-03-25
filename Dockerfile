FROM joseluisq/static-web-server:2.28.0-alpine

COPY --from=builder /app/dist/ /public
COPY ./inject-env-vars.sh /inject-env-vars.sh
RUN chmod +x /inject-env-vars.sh

ENTRYPOINT ["/inject-env-vars.sh"]
CMD ["static-web-server"]