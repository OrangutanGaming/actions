# docker-upload
Allows twine to be used in a GitHub action. This is a fork of [pangzineng's Github-Action-One-Click-Docker](https://github.com/pangzineng/Github-Action-One-Click-Docker).

This Github Action does a fixed list of actions:

1. (Optional) Filter the branch for action
2. Login to your Docker Registry
3. Build your docker image
4. Tag the image with `latest`, (Optional) `sha` of the commit, (Optional) `ref` of the commit, or your own tag
5. Push all tags of the image to your registry

Such that you don't have to run 5 different actions, which require the same environment setup (basically Docker) to be repeated again and again.


## Usage

**Arguments** passed to the action will be passed to the docker build process. If the argument is left empty, then the docker build process run with the default mode

Below are the required Secrets / Env:

* `DOCKER_USERNAME` - the username used to log in to your Docker registry.
* `DOCKER_PASSWORD` - the password used to log in to your Docker registry.

Below are the optional Secrets / Env:

* `BRANCH_FILTER` - the branch to allow the action, default to allow all branches
* `DOCKER_REGISTRY_URL` - the registry to login & push image to, default to be Docker Hub
* `DOCKER_NAMESPACE` - the namespace on the registry, default to be your Github username
* `DOCKER_IMAGE_NAME` - the name of the docker image to be built, default to be the namge of the Github repository
* `DOCKER_IMAGE_TAG` - the tag of the docker image to be pushed, default to be 3 tags (`latest`, `sha` of the commit, `ref` of the commit)
* `DOCKER_IMAGE_TAG_SHA` - if `false`, does not push a tag with the commit hash
* `DOCKER_IMAGE_TAG_REF` - if `false`, does not push a tag with the commit ref

Below are some additional optional env:

* `DOCKER_TAG_APPEND` - if this value is set, the default `ref` tag will be appended with this value (e.g. `DOCKER_TAG_APPEND=asia-business` for a git master branch push will produce this docker image tag: `master_asia-business`)


## Example

* simple use case: build image with default tags and push to Docker Hub, where your account name is the same as Github

```
action "build-and-push-to-docker-hub" {
  uses = "pangzineng/Github-Action-One-Click-Docker@master"
  secrets = [
    "DOCKER_USERNAME", 
    "DOCKER_PASSWORD"
  ]
}
```

* advance use case: custom build path, custom tag and custom private registry with custom namespace

```
action "build-and-push-to-my-registry" {
  uses = "pangzineng/Github-Action-One-Click-Docker@master"
  args = "-f my.Dockerfile ./my/custom/folder/"
  secrets = [
    "DOCKER_USERNAME", 
    "DOCKER_PASSWORD", 
    "DOCKER_REGISTRY_URL", 
    "DOCKER_NAMESPACE"
  ]
  env = {
    BRANCH_FILTER = "prod/release"
    DOCKER_IMAGE_NAME = "my-image-name"
    DOCKER_IMAGE_TAG = "my-image-tag"
  }
}
```
