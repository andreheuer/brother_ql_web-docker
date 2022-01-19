FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Berlin

RUN apt-get update

RUN apt-get install -f -y git python3-pip fontconfig libdmtx0b

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN git clone --depth=1 https://github.com/mistressofjellyfish/brother_ql_web.git

WORKDIR ./brother_ql_web

RUN rm -r .git

RUN python3 -m pip install --no-cache-dir -r requirements.txt pylibdmtx python-barcode

EXPOSE 8013

CMD ["python3","-u","brother_ql_web.py", "--model", "QL-700", "tcp://192.168.2.123" ]
