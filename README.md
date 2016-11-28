# docker-java8-mvn

Docker image with java8 and maven. Not intended to use as a base for java projects, just for building.

## Usage

This image is to be used to build your app using maven. Below in an example of how you would do this in drone with caching enabled.

Contents of .drone.yml:
```
pipeline:
  drone_s3_cache_pull:
     image: quay.io/ukhomeofficedigital/drone-s3cache:v0.1.0
     drone_s3_cache_mode: "pull"

  build:
    commands:
       - "/root/entrypoint.sh 'mvn clean package'"
    image: quay.io/ukhomeofficedigital/java8-mvn:v3.3.9
    when:
      event:
        - push
        - pull_request

  drone_s3_cache_push:
    image: quay.io/ukhomeofficedigital/drone-s3cache:v0.1.0
    drone_s3_cache_folders:
      - .m2
    drone_s3_cache_mode: "push"
```

## Contributing

Feel free to submit pull requests and issues. If it's a particularly large PR, you may wish to
discuss it in an issue first.

Please note that this project is released with a
[Contributor Code of Conduct](https://github.com/UKHomeOffice/docker-java8-mvn/blob/master/CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.org/) for the version tags available See the tags on this repository.

## Build With

* java-1.8.0-openjdk-devel

See also the list of
[contributors](https://github.com/UKHomeOffice/java-1.8.0-openjdk-deve/graphs/contributors) who participated
in this project.

## License

This project is licensed under the GPL v2 License - see the
[LICENSE.md](https://github.com/UKHomeOffice/java-1.8.0-openjdk-deve/blob/master/LICENSE.md) file for details
