# foxboxFedoraDocker

A container for the [foxbox deamon](https://github.com/fxbox/foxbox)

## Usage

```bash
# clone repository
git clone https://github.com/AmarOk1412/foxboxFedoraDocker.git && cd foxboxFedoraDocker
# build image
docker build -t foxbox .
# run your image
docker run -it --rm -p 4000:4000 -p 4242:4242 foxbox
```
