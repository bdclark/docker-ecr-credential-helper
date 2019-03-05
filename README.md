# ecr-credential-helper Docker Image

Dockerized version of AWS [amazon-ecr-credential-helper][1].

To use this image, you'll need a helper script somewhere on your path to run
the container. It should be named `docker-credential-ecr-login`. An example is
included in this repo.

Then, follow the instructions in the [AWS readme][2]. In a nutshell, add one
of the following snippets to `~/.docker/config.json`:

Use helper with specific AWS account registry(s):
```json
{
	"credHelpers": {
		"<AWS_ACCT_ID>.dkr.ecr.<REGION_ID>.amazonaws.com": "ecr-login"
	}
}
```

Use helper w/ all AWS private registries:
```json
{
	"credsStore": "ecr-login"
}
```

[1]: https://github.com/awslabs/amazon-ecr-credential-helper
[2]: https://github.com/awslabs/amazon-ecr-credential-helper/blob/master/README.md
