FROM alpine:3.9

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

RUN ssh -V

CMD rm -rf /root/.ssh && mkdir /root/.ssh && cp -R /root/ssh/* /root/.ssh/ && chmod -R 600 /root/.ssh/* && \
    ssh -o StrictHostKeyChecking=no -N $TUNNEL -L *:$LOCAL_PORT:$DESTINATION:$REMOTE_PORT \
    && while true; do sleep 30; done;

EXPOSE 3330-3339
