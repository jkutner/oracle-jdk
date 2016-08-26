# Oracle JDK for Heroku

This repository prepares an Oracle JDK for running on Heroku. The Oracle JDK cannot
be installed by Heroku due to the license policy of the runtime.

## Usage

Install [Docker](https://www.docker.com) and then run this command:

```sh-session
./oracle-jdk-8u101.sh
```

On Heroku, the config variable `JDK_URL_1_8` will override the default JDK
location. Upload your custom built Oracle JDK, set it like this:

```sh-session
$ heroku config:set JDK_URL_1_8=https://...
```

## License

MIT
