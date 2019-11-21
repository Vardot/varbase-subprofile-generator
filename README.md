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

For more custom settings change source or target by editing the settings.yml file: 

### Source
```
source:
  profile:
    git_repository: git@github.com:Vardot/varbase_subprofile_basic.git
    dev_branch:
      name: 8.x-7.x
      alias: 8.7.x-dev
      label: 8.7.x
  project:
    git_repository: git@github.com:Vardot/varbase-subprofile-basic-project.git
    dev_branch:
      name: 8.x-7.x
      alias: 8.7.x-dev
      label: 8.7.x
```

### Target
```
target:
  profile:
    dev_branch:
      name: 8.x-1.x
      alias: 8.x-1.x
      label: 8.1.x
  project:
    dev_branch:
      name: 8.x-1.x
      alias: 8.1.x-dev
      label: 8.1.x
```

You may add more file renames or string replace items.


After that you will need to push the generated profile and project template to
https://github.com for example and submit them to https://packagist.org

or commit to a project in https://drupal.org


A similar sub-profile generated using this command can be seen below:
* https://github.com/Vardot/cv
* https://github.com/Vardot/cv-project
* https://www.drupal.org/project/cv
