FROM python:3.7

WORKDIR /home
ADD requirements.txt /home
RUN pip install --no-cache -r /home/requirements.txt

ADD *.py /home/
EXPOSE 8050
CMD ["python","main.py"]
