FROM python:3


COPY . /home/
WORKDIR /home/
RUN python3 -m pip install jupyter

CMD ["/bin/bash", "/home/run.sh"]