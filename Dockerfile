# This Dockerfile constructs a docker image that contains an installation
# of the Neuropythy library along with some sample FreeSurfer data.
#
# Example build:
#   docker build --no-cache --tag nben/neuropythy-tutorials `pwd`
#
#   (but really, use docker-compose up instead).
#

# Start with neuropythy (no need to reinvent anything).
FROM nben/neuropythy:0.12.3

# Note the Maintainer.
MAINTAINER Noah C. Benson <nben@uw.edu>

# We want to download the FreeSurfer sample subject data.
RUN mkdir /data/freesurfer_subjects
RUN curl -o /data/freesurfer_subjects/fsaverage.tar.gz https://surfer.nmr.mgh.harvard.edu/pub/data/archive/fsaverage.tar.gz \
 && cd /data/freesurfer_subjects \
 && tar zxf fsaverage.tar.gz \
 && rm fsaverage.tar.gz
RUN curl -o /data/freesurfer_subjects/bert.tar.gz https://surfer.nmr.mgh.harvard.edu/pub/data/archive/bert.recon.tgz \
 && cd /data/freesurfer_subjects \
 && tar zxf bert.tar.gz \
 && rm bert.tar.gz
ENV SUBJECTS_DIR="/data/freesurfer_subjects"
