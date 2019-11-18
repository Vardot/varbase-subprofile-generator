#!/bin/usr/env bash

current_path=$(pwd);
target_path="${current_path}";
user_name="$USER";

subprofile_name="profilly"

# Grape the profile name argument.
if [ ! -z "$1" ]; then
  arg1="$1";
  if [[ $arg1 =~ ^[A-Za-z][A-Za-z0-9_]*$ ]]; then
    subprofile_name="$arg1";
  else
    echo "---------------------------------------------------------------------------";
    echo "   Profile name is not a valid profile name!                               ";
    echo "---------------------------------------------------------------------------";
    exit 1;
  fi
else
  echo "---------------------------------------------------------------------------";
  echo "   Please add the name of the profile!                                   ";
  echo "---------------------------------------------------------------------------";
  exit 1;
fi

# Grape the target path argument.
if [ ! -z "$2" ]; then
  arg2="$2";
  if [[ -d "${arg2}" ]]; then
    target_path="$arg2";
  else
    echo "---------------------------------------------------------------------------";
    echo "   Target directory is not valid or you do not have permission!            ";
    echo "   Please, create the target directory, and provide the full target path   ";
    echo "   For Example:";
    echo "   $ bash generate-varbase-subprofile.sh "cv" "/var/www/html/products" -vvv";
    echo "---------------------------------------------------------------------------";
    exit 1;
  fi
else
  echo "---------------------------------------------------------------------------";
  echo "   As you did not provide any Target path                                  ";
  echo "   New profiles will be generated in:                                      ";
  echo "    ${current_path}                                                        ";
  echo "---------------------------------------------------------------------------";
fi


# Create the target [Varbase Subprofile Basic] for the profile.
# =============================================================================
if [[ -d "${target_path}/$subprofile_name" ]]; then
 rm -rf ${target_path}/$subprofile_name ;
fi

git clone git@github.com:Vardot/varbase_subprofile_basic.git ${target_path}/${subprofile_name} ;

cd ${target_path}/${subprofile_name} ;
rm -rf .git ;
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${target_path}/${target_path}/${subprofile_name}/config/install
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${target_path}/${subprofile_name}/configbit
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${target_path}/${subprofile_name}/modules
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${target_path}/${subprofile_name}/modules/${subprofile_name}_demo
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${target_path}/${subprofile_name}/modules/${subprofile_name}_features
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${target_path}/${subprofile_name}/modules/${subprofile_name}_homepage
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${target_path}/${subprofile_name}/modules/${subprofile_name}_homepage/config/install
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${target_path}

# Create the target [Varbase Sub Profile Basic Project] for the profile.
# =============================================================================
if [[ -d "${target_path}/${subprofile_name}-project" ]]; then
  rm -rf ${target_path}/${subprofile_name}-project
fi

git clone git@github.com:Vardot/varbase-subprofile-basic-project.git ${target_path}/${subprofile_name}-project

cd ${target_path}/${subprofile_name}-project
rm -rf .git

grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic Project' * | xargs sed -i "s/Varbase Sub Profile Basic Project/${subprofile_name} project/g"
grep -rl 'varbase-subprofile-basic-project' * | xargs sed -i "s/varbase-subprofile-basic-project/${subprofile_name}-project/g"


## Processor: Public Github finished generating.
echo "=========================================================================";
echo "  Processor: Public Github finished generating                           ";
echo "=========================================================================";