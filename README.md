# EMR Serverless venv Creator
Build a venv for EMR Serverless with a configurable set of packages

## Sample Usage
```bash
docker run -it --rm -v "$PWD:/output" ghcr.io/ddrinka/emrserverlessvenv:latest pandas.tar.gz \
    pandas \
    pyarrow
```