# Reference Manual of pico-Céu

The Reference Manual of pico-Céu uses MkDocs:

[http://www.mkdocs.org/](http://www.mkdocs.org/)

## Installing Dependencies

```
sudo apt install python-pip
pip install mkdocs
pip install pandoc
pip install markdown-include
pip install mkdocs-pandoc
```

## Updating the Reference Manual

Every version of pico-Céu has its own reference manual, which is stored is a folder prefixed by "v". All content can be updated using the markdown files located at ```docs/manual/v[VERSION]/docs```.

The reference manual sections are defined in the file ```v[VERSION]/mkdocs.yml```, in which we can specify the name of the section ("Introduction", for example) and the file path of its content. Note that the ```docs``` folder should not be included in the file path.
```
pages:
    - Introduction:         'index.md'
    - Graphics:             'graphics/index.md'
``` 

The ```docs/manual/v[VERSION]/index.md``` should contain a list of the reference manuals versions available.

## Generating a new Release of Reference Manual
After updating the markdown files and sections, you can generate a new release of the reference manual in pdf, markdown and html formats simply navigating to ```docs/manual``` folder and doing a ```make``` (passing the pico-Céu version). Below, there is an example of generating the reference manual for pico-Céu 0.40:
```
make VERSION=v0.40
```

mkdocs and pandoc will create the finals pdf and markdown at ```docs/manual/v[VERSION]/```. The html will be created at ```docs/manual/out/v[VERSION]/```

## The docs/out folder

The ```docs/out folder``` should store all versions of the reference manual, and its content will be automatically displayed on the reference manual website
