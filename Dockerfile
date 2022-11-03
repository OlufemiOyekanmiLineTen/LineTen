FROM python:3.8

COPY . /app
WORKDIR /app
RUN pip install -r dependency_software.txt
EXPOSE 81

# command to run on container start
CMD [ "python", "app.py" ]
