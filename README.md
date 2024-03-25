
# env-driven-static-server

## Introduction

`env-driven-static-server` is a flexible solution that enhances the deployment process of frontend applications by dynamically assigning environment-specific variables. With this, you can create a single, reusable container build for different environments, each with their own configurations. Instead of hard-coding variables into your build, this tool allows them to be assigned at the container start, making your deployment process much more flexible

## Usage

To use `env-driven-static-server`, start the container with the necessary environment variables prefixed with `VITE_`. For example:

```sh
docker run -e VITE_API_BASE_URL=http://api.example.com env-driven-static-server
```

This will inject the environment variables into the frontend application, making them accessible as follows:

```javascript
export const Config = {
  API_BASE_URL: import.meta.env.VITE_API_BASE_URL || window._env_.VITE_API_BASE_URL,
};
```

## Features

- **Dynamic Environment Variables**: Injects environment variables directly into the frontend application at runtime.
- **Single Build for Multiple Environments**: Eliminates the need for multiple builds for different environments, streamlining the deployment process.
- **Easy Configuration**: Simple and intuitive setup process, requiring minimal changes to existing projects.

## License

Project is released under the MIT License. See the [LICENSE](LICENSE) file for more details.