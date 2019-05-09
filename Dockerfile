FROM ubuntu:rolling
RUN apt-get update
RUN apt install rubygems ruby-dev make gcc build-essential g++ thin -y
RUN rm -rf /var/lib/apt/lists/*
RUN gem install bundler
RUN gem install smashing
RUN gem install tzinfo-data
RUN mkdir /smashing
WORKDIR /smashing
RUN smashing new smashing
WORKDIR /smashing/smashing
RUN echo "" >> Gemfile
RUN echo "gem 'tzinfo-data'" >> Gemfile
RUN echo "gem 'therubyracer'" >> Gemfile
RUN bundle
CMD ["smashing", "start"]
