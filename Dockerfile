# syntax=docker/dockerfile:1
FROM ruby:3.1.2
# Intall nodejs and postgresql-client
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# Add Yarn repository and install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -y && apt-get install yarn -y

WORKDIR /dripart
COPY Gemfile /dripart/Gemfile
COPY Gemfile.lock /dripart/Gemfile.lock

# Install & run bundler
RUN gem install bundler:'~> 2.1.4'
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD rails server -b 0.0.0.0
# CMD ["rails", "server", "-b", "0.0.0.0"]