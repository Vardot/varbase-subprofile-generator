# Varbase Subprofile Generator

Clone the repository:
```
$ git clone git@github.com:Vardot/varbase-subprofile-generator.git
```

Run the bash command:
```
$ bash generate-varbase-subprofile.sh "MY_SUB_PROFILE" "/var/www/html/MYPROFILE" -vvv
```

You should see the following directories as your newly created sub profile.

```
$ cd /var/www/html/MYPROFILE
$ ls -l

MYPROFILE/
 - MY_SUB_PROFILE/
 - MY_SUB_PROFILE-project/
```

After that you will need to push the generated profile and project template to
https://github.com for example and submit them to https://packagist.org

or commit to a project in https://drupal.org


A similar sub-profile generated using this command can be seen below:
* https://github.com/Vardot/cv
* https://github.com/Vardot/cv-project
* https://www.drupal.org/project/cv
