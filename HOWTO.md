# How To Use rbrtweiler/hexo-setup

*Note: All of the following assumes `rbrtweiler/hexo-setup:20241124141913` as the Docker image to be used. Change accordingly, if you use some other image. Also, it is assumed that the actual data for the website is stored in a directory called `site-source` on the host running Docker. Change accordingly, if you use some other directory.*

Preparations:

1. Build the Docker image.
2. Run the image, with a local directory mapped to it.
3. Initialize Hexo and install the required plugins.

Actual usage:

1. Run the image, with a local directory mapped to it.
2. Use Hexo to build your site.

## Preparations

### Build the Image

For building the image, Docker needs unrestricted network access. Thus, use the following command to build a fresh image:

```shell
docker build --network=host -t rbrtweiler/hexo-setup:$(date +%Y%m%d%H%M%S) .
```

This will create an image named `rbrtweiler/hexo-setup` that is automatically tagged with the current timestamp.

If you want to optionally tag the image with a canonical version, e.g. `latest`, do so like this after the image has been built:

```shell
docker image tag rbrtweiler/hexo-setup:20241124141913 rbrtweiler/hexo-setup:latest
```

### Run the Image

For the initialization of Hexo and the installation of all required plugins Docker needs unrestricted network access again. Thus, the image needs to be started as such:

```shell
docker run --rm --network=host  -it -v ./site-source:/hexosite -w /hexosite rbrtweiler/hexo-setup:20241124141913
```

### Initialize Hexo

In the running Docker container execute the initialization script:

```shell
/root/hexosite-setup.sh
````

This will install the Hexo binaries globally and also install all required plugins under `/hexosite`.

## Using Hexo

Change to the directory that contains `site-source`.

Run the image as follows:

```shell
docker run --rm -it -v ./site-source:/hexosite -w /hexosite -p 127.0.0.1:4000:4000/tcp rbrtweiler/hexo-setup:20241124141913
````

This will run the Docker image with the local directory `site-source` mapped to the directory `/hexosite` in the Docker container. The command will also map port 4000/tcp from the container to the local address [http://127.0.0.1:4000/](http://127.0.0.1:4000/).

Please note that if the container needs network access, it may be necessary to add the parameter `--network=host` to the Docker command. While helpful, it disables port mapping.

Within the container, the following commands are commonly used:

- `hexo clean`  
  This will basically wipe clean the `public` directory, which would contain the website once it has been built.
- `hexo generate`  
  This will build the website from the data sitting in the `source` directory, based on the configuration in `_config.yml` and used theme.
- `hexo server`  
  This will fire up an development server listening on port 4000/tcp.

Once the site has been built successfully, the contents of the `public` directory can be transferred to a web host to make the site available to the public.
