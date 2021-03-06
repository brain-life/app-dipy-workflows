FROM ubuntu:18.04
MAINTAINER Soichi Hayashi <hayashis@iu.edu>


RUN apt-get update && apt-get install -y python-pip git
RUN pip install numpy cython scipy matplotlib==2.2.3 h5py nibabel nipype
RUN pip install cvxpy scikit-learn

#RUN git clone https://github.com/nipy/dipy.git && cd dipy && pip install .
ENV DEBIAN_FRONTEND=noninteractive
RUN pip install dipy==0.16.0 joblib

#move this up?
RUN apt-get update && apt-get install -y python-tk

#make it work under singularity
RUN ldconfig && mkdir -p /N/u /N/home /N/dc2 /N/soft

#https://wiki.ubuntu.com/DashAsBinSh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV PYTHONNOUSERSITE=true

