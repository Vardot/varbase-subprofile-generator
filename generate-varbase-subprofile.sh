#!/bin/usr/env bash

current_path=$(pwd);
user_name="$USER";

subprofile_name="profilly"

# Grape the profile name argument.
if [ ! -z "$1" ]; then
  arg1="$1";
  if [[ $arg1 =~ ^[A-Za-z][A-Za-z0-9_]*$ ]]; then
    subprofile_name="$arg1";
  else
    echo "---------------------------------------------------------------------------";
    echo "   Theme name is not a valid profile name!                                   ";
    echo "---------------------------------------------------------------------------";
    exit 1;
  fi
else
  echo "---------------------------------------------------------------------------";
  echo "   Please add the name of profile theme!                                      ";
  echo "---------------------------------------------------------------------------";
  exit 1;
fi

## Processor: Public Github finished generating.
echo "=========================================================================";
echo "  Processor: Public Github finished generating                       ";
echo "=========================================================================";

# Create the target [Varbase Subprofile Basic] for the profile.
# =============================================================================
if [[ -d "${current_path}/$subprofile_name" ]]; then
 rm -rf ${current_path}/$subprofile_name ;
fi

git clone git@github.com:Vardot/varbase_subprofile_basic.git $subprofile_name ;

cd ${current_path}/${subprofile_name} ;
rm -rf .git ;
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${current_path}/${current_path}/${subprofile_name}/config/install
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${current_path}/${subprofile_name}/configbit
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${current_path}/${subprofile_name}/modules
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${current_path}/${subprofile_name}/modules/${subprofile_name}_demo
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${current_path}/${subprofile_name}/modules/${subprofile_name}_features
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${current_path}/${subprofile_name}/modules/${subprofile_name}_homepage
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${current_path}/${subprofile_name}/modules/${subprofile_name}_homepage/config/install
rename "s/varbase_subprofile_basic/${subprofile_name}/g" *
grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"

cd ${current_path}

# Create the target [Varbase Sub Profile Basic Project] for the profile.
# =============================================================================
if [[ -d "${current_path}/${subprofile_name}-project" ]]; then
  rm -rf ${current_path}/${subprofile_name}-project
fi

git clone git@github.com:Vardot/varbase-subprofile-basic-project.git ${subprofile_name}-project

cd ${current_path}/${subprofile_name}-project
rm -rf .git

grep -rl 'varbase_subprofile_basic' * | xargs sed -i "s/varbase_subprofile_basic/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic' * | xargs sed -i "s/Varbase Sub Profile Basic/${subprofile_name}/g"
grep -rl 'Varbase Subprofile' * | xargs sed -i "s/Varbase Subprofile/${subprofile_name}/g"
grep -rl 'Varbase Sub Profile Basic Project' * | xargs sed -i "s/Varbase Sub Profile Basic Project/${subprofile_name} project/g"
grep -rl 'varbase-subprofile-basic-project' * | xargs sed -i "s/varbase-subprofile-basic-project/${subprofile_name}-project/g"

