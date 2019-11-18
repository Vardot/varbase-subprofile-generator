# Varbase Subprofile Generator

```
$ mkdir /var/www/html/products
$ cd /var/www/html/products
$ git clone git@github.com:Vardot/varbase-subprofile-generator.git
$ cd /var/www/html/products/varbase-subprofile-generator
$ bash generate-varbase-subprofile.sh "cv" "/var/www/html/products" -vvv
ll

```

Then you will see the following

```
$ cd /var/www/html/products 
$ ll
cv/
cv-project/
```

After that you will need to push the generated profile and project template to
https://github.com for example and submit them to https://packagist.org

or commit to a project in https://drupal.org

As we do have that at
* https://github.com/Vardot/cv
* https://github.com/Vardot/cv-project
And
* https://www.drupal.org/project/cv
