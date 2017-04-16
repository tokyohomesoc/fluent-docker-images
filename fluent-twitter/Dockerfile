FROM fluent/fluentd:latest
MAINTAINER Tokyo HOME SOC <github@homesoc.tokyo>

ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

# Environment variable
ARG TIMEZONE=Asia/Tokyo

USER root
WORKDIR /home/fluent

RUN \
	   apk add --no-cache --virtual .build-tzdata \
	   		tzdata \
	&& cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
	&& apk del .build-tzdata \
	&& apk add --no-cache \
	   		curl \
			bash \
			g++ \
			openssl-dev \
	&& apk add --no-cache --virtual .build-gem \
			git \
			ruby-dev \
			build-base \
			libcurl \
	&& chown -R fluent:fluent /fluentd/etc/ \
	\
	&& gem install eventmachine --no-ri --no-rdoc \
	&& gem install fluent-plugin-twitter -v='0.5.4' --no-ri --no-rdoc \
	&& gem install fluent-plugin-filter-twitterurl --no-ri --no-rdoc \
	&& gem install fluent-plugin-s3 --no-ri --no-rdoc \
	&& gem install fluent-plugin-slack --no-ri --no-rdoc \
	&& gem install fluent-plugin-norikra --no-ri --no-rdoc \
	&& gem install fluent-plugin-suppress --no-ri --no-rdoc \
	&& gem uninstall json -v='2.0.3' \
	&& apk del .build-gem

COPY /conf.d /fluentd/etc/conf.d/
COPY /fluent.conf /fluentd/etc/

# USER fluent
CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT