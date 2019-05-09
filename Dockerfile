FROM ubuntu:rolling
RUN apt-get update
RUN apt install rubygems ruby-dev make gcc build-essential g++ thin -y
RUN rm -rf /var/lib/apt/lists/*
RUN gem install bundler
RUN gem install smashing
RUN mkdir -p /smashing/gems
RUN useradd -ms /bin/bash smashing
RUN chown smashing:smashing /smashing -Rc
USER smashing
WORKDIR /smashing
RUN smashing new smashing
WORKDIR /smashing/smashing
RUN echo "" >> Gemfile
RUN echo "gem 'tzinfo-data'" >> Gemfile
RUN echo "gem 'therubyracer'" >> Gemfile
RUN bundle --path /smashing/gems
EXPOSE 3030
CMD ["smashing", "start"]
