# Use the barebones version of Ruby
FROM ruby:2.5

MAINTAINER Stanislav Pogrebnyak <stan@adcurve.com>

# Set an environment variable to store where the app is installed to inside
# of the Docker image.
ENV INSTALL_PATH /resque-web

# This sets the context of where commands will be ran in and is documented
# on Docker's website extensively.
WORKDIR $INSTALL_PATH

# Ensure gems are cached and only get updated when they change. This will
# drastically increase build times when your gems do not change.
COPY Gemfile* ./
RUN bundle

# Copy in the application code from your work station at the current directory
# over to the working directory.
COPY . $INSTALL_PATH

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0"]
