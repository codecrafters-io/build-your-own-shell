FROM python:3.12-alpine

# We need to install Go to build the custom executable.
RUN apk add --no-cache "go>=1.20"

RUN pip install --no-cache-dir "pipenv>=2023.12.1"

COPY Pipfile /app/Pipfile
COPY Pipfile.lock /app/Pipfile.lock

WORKDIR /app

ENV WORKON_HOME=/venvs

RUN pipenv install

# Force environment creation
RUN pipenv run python3 -c "1+1"

ENV CODECRAFTERS_DEPENDENCY_FILE_PATHS="Pipfile,Pipfile.lock"