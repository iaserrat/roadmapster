[![Build Status](https://travis-ci.org/iaserrat/roadmapster.svg?branch=master)](https://travis-ci.org/iaserrat/roadmapster) [![Code Climate](https://codeclimate.com/github/iaserrat/roadmapster/badges/gpa.svg)](https://codeclimate.com/github/iaserrat/roadmapster)

# Roadmapster

## Motivation

[Wizeline Roadmap](https://www.wizelineroadmap.com) is an excellent SaSS for fast, free (at the moment) and agile way to create beautiful roadmaps. This project is aimed to extend it's functionality by providing a way to create roadmap items based on any Github issue.

## Disclaimer

This project is developed outside of Wizeline Inc. by using publicly accessible API's. There's no employment connection in any form by the supporters of the project and Wizeline Inc.

## Installation

For now the easiest way to install is to `git clone git@github.com:iaserrat/roadmapster.git`

## Usage

- First clone and install the required dependencies:

```
$ git clone git@github.com:iaserrat/roadmapster.git
$ cd roadmapster && bundle install
```

- Login to [Wizeline Roadmap](https://www.wizelineroadmap.com) and create a regular user with a strong password. At this time Wizeline Roadmap doesn't support integration tokens, so you'll need to use a regular account to authenticate API requests. Create an user just for this.

- Once you have your user, deploy roadmapster to your favourite cloud and create the following environment variables:

```
WIZELINE_EMAIL='themailyoucreatedtheaccountwith@example.com
WIZELINE_PASSWORD='asupersecurepassword'
```

- Run roadmapster with `rake`

- Create a Webhook in your Github repository that sends **only** issues events pointing to your roadmapster server.

- Start tracking issues!

### How to track an issue on Wizeline?

Create an issue and put somewhere on the description the following tracker string:

`[ROADMAP/<your_organization_name>/<roadmap_name>]`

Replace the values accordingly. Make sure the organization and roadmap name exist and they're typed correctly.

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iaserrat/roadmapster. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Roadmapster project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/iaserrat/roadmapster/blob/master/CODE_OF_CONDUCT.md).
