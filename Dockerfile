FROM ruby:2.6

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /finance_tracker_app
COPY Gemfile /finance_tracker_app/Gemfile
COPY Gemfile.lock /finance_tracker_app/Gemfile.lock 
RUN gem install bundler 
RUN bundle install
COPY . /finance_tracker_app

#RUN rails assets:precompile
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]