# Full tag list: https://hub.docker.com/r/library/kapacitor/tags/
FROM kapacitor:latest

# Install python
RUN apt-get -qq update && apt-get -qq install -y \
    python \
    python-pip

# Install python dependencies
RUN pip install \
	numpy \
	pandas \
	protobuf \
	scipy

# Install git
RUN apt-get -qq install -y git

# Install kapacitor agent
RUN git clone https://github.com/influxdata/kapacitor.git /tmp/kapacitor

# Start kapacitor service (log-level: debug | info | error)
CMD ["kapacitord","-log-file","/etc/kapacitor/kapacitor.log","-log-level","info"]

