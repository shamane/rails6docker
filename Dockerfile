FROM ruby:2.7.3

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn

ENV APP_HOME /app

# Create a folder called app to host the codebase.
RUN mkdir $APP_HOME

# Set the working directory to app folder
WORKDIR $APP_HOME

# Copy the files to the working directory
# COPY Gemfile Gemfile.lock ./

RUN gem install bundler:2.1.2 --no-document
ADD Gemfile* $APP_HOME/
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

ADD . $APP_HOME
RUN yarn install --check-files

# Set the start command
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
