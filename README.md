### bareRpackage



## Create a New Packge
```R
devtools::create("PkgName")
```

## Сreate The Documentation
```R
devtools::document()
```

### Development

## Update Docs
```R
devtools::document()
```

## Run App
```R
devtools::load_all()
bareRpackage::launch_application()
```


## Prod
```
R CMD build .
```
```
R CMD INSTALL bareRpackage_*
```

## build docler
```
docker build -t bare_r_package .
```

