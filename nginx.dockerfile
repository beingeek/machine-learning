FROM ml-base

## local variables
ENV ROOT_PROJECT /var/machine-learning
ENV ENVIRONMENT docker
ENV ENVIRONMENT_DIR $ROOT_PROJECT/puppet/environment/$ENVIRONMENT

##
## environment variables: inline edits to '/etc/hosts' will be removed on
##                        subsequent container boot.
##
##     valid cases:
##
##     docker build --build-arg HOST_NAME=nginx-api
##     docker build --build-arg HOST_NAME=nginx-web
##
## @NGINX_NAME, build time argument, used to temporarily set the hostname, to
##     allow nginx to be installed, with respective host parameters.
##
RUN echo $(head -1 /etc/hosts | cut -f1) $HOST_NAME >> /etc/hosts

## provision with puppet
RUN /opt/puppetlabs/bin/puppet apply $ENVIRONMENT_DIR/modules/nginx/manifests/init.pp --modulepath=$ENVIRONMENT_DIR/modules_contrib:$ENVIRONMENT_DIR/modules --confdir=$ROOT_PROJECT

## start nginx
ENTRYPOINT ["nginx"]