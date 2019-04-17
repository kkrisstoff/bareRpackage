FROM openanalytics/r-base

LABEL maintainer="" \
      app="r-base app"

ENV SHINY_HOME /home/shiny
ENV APP_DIR $SHINY_HOME/app_dir

# system libraries of general use
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.0.0 \
    libmpfr-dev \
    libxml2-dev \
    openjdk-8-jdk \
    libgdal-dev \
    libproj-dev \
    xclip

RUN R CMD javareconf

#Copy application files
RUN mkdir $SHINY_HOME
RUN mkdir $APP_DIR
COPY . $APP_DIR
WORKDIR $APP_DIR

#Build Step
RUN R CMD build .
RUN R -e "install.packages(c('shiny', 'ggplot2'), repos='https://cloud.r-project.org/', dependencies=TRUE)"
#RUN R -e "devtools::install_deps('.')"

#Install application
RUN R CMD INSTALL bareRpackage_*

#Run application
CMD ["R", "-e", "library(afVin); afVin::launch_application()"]
