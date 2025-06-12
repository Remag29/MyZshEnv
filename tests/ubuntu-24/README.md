# Test the script

## 1. Build the image

```bash
docker build . -f ./tests/ubuntu-24/Dockerfile -t test-myzshenv:1.1.1
```

## 2. Run the container

```bash
docker container run -it --rm test-myzshenv:1.1.1
```

## 3. Start the script

```bash
./script.sh
```

