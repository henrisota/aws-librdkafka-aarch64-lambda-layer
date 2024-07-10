# aws-librdkafka-aarch64-lambda-layer

`librdkafka` is not supported out of the box for `aarch64` (`arm64`) architecture AWS Lambdas. Building the librdfkafka project requires a consistent environment with matching GLIBC support, so it must be done in an environment identical to the Lambda runtime.

## Overview

This project utilizes GitHub Actions to automate the build process of `librdkafka` in an environment that matches the AWS Lambda runtime for `aarch64`.

After the workflows have successfully run, the `librdkafka` library will be available as artifacts of the GitHub Actions run. These artifacts can be zipped and uploaded as Lambda Layers.

**_NOTE:_** The currently supported builds are based off of the runtime packaged in the [lambda/python](https://gallery.ecr.aws/lambda/python) Docker images. Therefore, the built libraries may not be supported on other runtimes.

## Contributing

Contributors are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT license. See the LICENSE file for details.
