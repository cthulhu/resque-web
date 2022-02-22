# A simple frontend for resque background job

Resque-web is a simple docker container that allows you to manage jobs in [Resque](https://github.com/resque/resque).

## Installation

Local native development:

```bash
bundle install --path vendor/bundle
bundle exec rackup
```

Docker:

```bash
docker build . -t resque-web
docker run -it -p 9292:9292 -t resque-web
```

## Usage

Can be used in any container management system via docker.

## Contributing
Pull requests are welcome.

## License
[MIT](https://choosealicense.com/licenses/mit/)