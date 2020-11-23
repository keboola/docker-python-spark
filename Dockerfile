FROM gcr.io/datamechanics/spark-py-kernel:3.0.0-dm4
ENV PYTHONIOENCODING utf-8

WORKDIR /home

RUN apt-get update && apt-get install -y --no-install-recommends \
        libgeos-c1v5 \
        python-numpy \
        python-scipy \
        python-matplotlib \
        ipython \
        python-pandas \
        python-sympy \
        python-nose \
        g++ \
        libsasl2-dev \
        libatlas-base-dev \
        libicu-dev \
        python3-icu \
        wget \
        git \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip
RUN pip3 install --use-feature=2020-resolver --no-cache-dir \
        pyspark \
        pandas \
        plotly \
        scikit-learn \
        xgboost \
        nltk \
        seaborn \
        snowflake-connector-python \
        git+git://github.com/keboola/python-docker-application.git@2.1.1 \
    && mkdir -p /root/.cache/snowflake/

COPY ./launch_ipykernel.py /opt/spark/work-dir/launch_ipykernel.py
