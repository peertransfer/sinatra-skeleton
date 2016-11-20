# Weather Sinatra Application

## Introduction

This is a application made with ruby and sinatra, which gets the temperature from specific locations

## Installation

Clone the repo:

```
$ git clone https://github.com/sanchezpaco/sinatra-skeleton
```

Run bundle to install gems and prepare puma server:

```
$ bundle install --path vendor/bundle -j 10
$ bundle binstubs puma
```

## Run

From the installation directory, launch:

```
$ bundle exec puma
```

After this you'll have a server serving on port `9292`

## Test

From the installation directory, launch:

```
$ bundle exec rspec
```

## Features:

- Access to `host:9292/` and the server will get your location from your ip (if you access with localhost then the application will get the temperature from the default City)
- You can send a parameter specifying your desired location and you'll get the temperature: `host:9292/Roma`
- With query parameters you can specify the metric system, the default it's the international system.
    - If you want to specify, you can send as query parameter `?metric_system=%METRIC_SYSTEM%`
        - `si` : international metric system
        - `us` : imperial metric system

## Authors

- Author: Paco Sanchez ([sanchezpaco3@gmail.com](mailto:sanchezpaco3@gmail.com))