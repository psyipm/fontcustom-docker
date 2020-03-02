# FontCustom Docker image

Icon font is generated using [`fontcustom`](https://github.com/FontCustom/fontcustom).

SVG sources is placed at `app/assets/icons` and CSS will be compiled based on naming,
eg. `star.svg` will be available as `.icon-star`.

# How to use it

To recompile the font file as well as SCSS-mixins, use `fontcustom`.

    cd yourproject
    docker run -v $(pwd):/home/app ipmdev/fontcustom-docker fontcustom compile
