ARG PYTHON_VERSION

FROM public.ecr.aws/lambda/python:${PYTHON_VERSION} AS build

ARG PYTHON_VERSION

COPY ./install.sh /opt/scripts/install.sh 
RUN /opt/scripts/install.sh "$PYTHON_VERSION"

CMD ["/bin/bash"]
