# docker-java8-mvn

**Deprecation notice: This repo is no longer maintained by ACP. Please refer to our docs for guidance on deploying to Artifactory with Maven. You’re welcome to fork this repo according to your own needs.**

Base Docker image with Java 8 and Maven.

Docker image with java8 and maven. Not intended to use as a base for Java projects, just for building.

## Usage

This image is to be used to build your app using Maven.

Contents of .drone.yml:
```
pipeline:
  build:
    commands:
      - "/root/entrypoint.sh 'mvn clean install'"
    secrets:
      - artifactory_username
      - artifactory_password
    image: quay.io/ukhomeofficedigital/java8-mvn:v3.6.0
    when:
      event:
        - push
        - pull_request

```

To deploy artifacts to Artifactory, please pass valid credentials via the ARTIFACTORY\_USERNAME and ARTIFACTORY\_PASSWORD environment variables.

You'll also need to include the following in your POM file:
```
<distributionManagement>
        <repository>
                <id>artifactory</id>
                <name>libs-release-local</name>
                <url>https://artifactory.digital.homeoffice.gov.uk/artifactory/libs-release-local</url>
        </repository>
        <snapshotRepository>
                <id>artifactory</id>
                <name>libs-snapshot-local</name>
                <url>https://artifactory.digital.homeoffice.gov.uk/artifactory/libs-snapshot-local</url>
        </snapshotRepository>
</distributionManagement>
```
Maven should then deploy to Artifactory during the "deploy" lifecycle phase.

## Contributing

Feel free to submit pull requests and issues. If it's a particularly large PR, you may wish to
discuss it in an issue first.

Please note that this project is released with a
[Contributor Code of Conduct](https://github.com/UKHomeOffice/docker-java8-mvn/blob/master/CONTRIBUTING.md).

By participating in this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.org/) for the version tags available See the tags on this repository.

## Built With

* java-1.8.0-openjdk-devel

See also the list of
[contributors](https://github.com/UKHomeOffice/docker-java8-mvn/graphs/contributors) who participated
in this project.

## License

This project is licensed under the GPL v2 License - see the
[LICENSE.md](https://github.com/UKHomeOffice/docker-java8-mvn/blob/master/LICENSE) file for details
