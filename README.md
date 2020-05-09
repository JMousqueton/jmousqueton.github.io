# CV de Julien Mousqueton

This web site published on [jmousqueton.gtihub.io](https://jmousqueton.github.io) is my resume. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisite

add the themes  

```
cd themes
$ git clone https://github.com/cowboysmall-tools/hugo-devresume-theme.git
```

### Installing

Configure config.toml

```
vi config.toml
```

And compile 

```
hugo
```


## Running the tests

You can test before generation the static site 

```
hugo server -D 
```


## Deployment

```
cd public 
git add .
git commit -m "update" 
git push
```

## Built With

* [Hugo](https://gohugo.io/) - The web framework used
* [DevResume](https://github.com/cowboysmall-tools/hugo-devresume-theme) - The Hugo template for my resume 


## Authors

* **Julien Mousqueton** - [Blog](https://www.julienmousqueton.fr)

See also the list of [contributors](https://github.com/JMousqueton/jmousqueton.github.io/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments
