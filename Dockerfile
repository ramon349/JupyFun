FROM python:3




RUN python3 -m pip install jupyter

CMD ["/bin/bash"]