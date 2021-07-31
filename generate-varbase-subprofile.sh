#!/bin/usr/env bash

## Public Github Processor for Varbase Subprofile Generator


current_path=$(pwd);
target_path="${current_path}";
user_name="$USER";
subprofile_name="profilly"

# Include Bash YAML library.
. ${current_path}/libs/bash-yaml.sh

# Load Generator settings.
eval $(parse_yaml ${current_path}/settings.yml);


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
    echo " Target directory is not valid or you do not have permission!              ";
    echo " Please, create the target directory, and provide the full target path     ";
    echo "   Example:                                                                ";
    echo "   $ bash generate-varbase-subprofile.sh "cv" "/var/www/html/products" -vvv";
    echo "---------------------------------------------------------------------------";
    exit 1;
  fi
else
  echo "---------------------------------------------------------------------------";
  echo "   Target path was not provide                                             ";
  echo "   Generating to ${current_path} :                                         ";
  echo "---------------------------------------------------------------------------";
fi

if ! [ -x "$(command -v sed)" ]; then
  echo 'sed does not exist. Please install it.';
  echo ' -------------------------------- ';
  echo '  sudo apt install -y sed';
  exit 1;
fi

if ! [ -x "$(command -v gawk)" ]; then
  echo 'gawk does not exist. Please install it.';
  echo ' -------------------------------- ';
  echo '  sudo apt install -y gawk';
  exit 1;
fi

if ! [ -x "$(command -v rename)" ]; then
  echo 'rename does not exist. Please install it.';
  echo ' -------------------------------- ';
  echo '  sudo apt install -y rename';
  exit 1;
fi

# =============================================================================
# Create the target [Varbase Subprofile Basic] for the profile.
# =============================================================================
if [[ -d "${target_path}/$subprofile_name" ]]; then
 rm -rf ${target_path}/$subprofile_name ;
fi

# Get the sour profile.
git clone --branch ${source_profile_dev_branch_name} ${source_profile_git_repository} ${target_path}/${subprofile_name} ;

cd ${target_path}/${subprofile_name} ;
rm -rf .git ;


for profile_dir in "${profile_dir_list[@]}"
do

  profile_dir=${profile_dir/SUB_PROFILE_NAME/${subprofile_name}} ;
  profile_dir=${profile_dir/SUB_PROFILE_NAME/${subprofile_name}} ;
  cd ${target_path}/${subprofile_name}${profile_dir} ;

  # Rename files.
  for rename_file in "${rename_file_list[@]}"
  do
    rename "s/${rename_file}/${subprofile_name}/g" *
  done
done

cd ${target_path}/${subprofile_name} ;
# Replace Strings.
for replace_string in "${replace_string_list[@]}"
do
  grep -rl "${replace_string}" ${target_path}/${subprofile_name}/* | xargs sed -i "s/${replace_string}/${subprofile_name}/g"
done

grep -rl "${source_profile_dev_branch_name}" * | xargs sed -i "s/${source_profile_dev_branch_name}/${target_profile_dev_branch_name}/g" ;
grep -rl "${source_profile_dev_branch_alias}" * | xargs sed -i "s/${source_profile_dev_branch_alias}/${target_profile_dev_branch_alias}/g" ;
grep -rl "${source_profile_dev_branch_label}" * | xargs sed -i "s/${source_profile_dev_branch_label}/${target_profile_dev_branch_label}/g" ;


cd ${target_path}

# =============================================================================
# Create the target [Varbase Sub Profile Basic Project] for the profile.
# =============================================================================
if [[ -d "${target_path}/${subprofile_name}-project" ]]; then
  rm -rf ${target_path}/${subprofile_name}-project
fi


git clone --branch ${source_project_dev_branch_name} git@github.com:Vardot/varbase-subprofile-basic-project.git ${target_path}/${subprofile_name}-project

cd ${target_path}/${subprofile_name}-project
rm -rf .git

for project_dir in "${project_dir_list[@]}"
do

  project_dir=${project_dir/SUB_PROFILE_NAME/${subprofile_name}} ;
  project_dir=${project_dir/SUB_PROFILE_NAME/${subprofile_name}} ;
  cd ${target_path}/${subprofile_name}${project_dir} ;

  # Rename files.
  for rename_file in "${rename_file_list[@]}"
  do
    rename "s/${rename_file}/${subprofile_name}/g" *
  done
done

cd ${target_path}/${subprofile_name}-project
# Replace Strings.
for replace_string in "${replace_string_list[@]}"
do
  grep -rl "${replace_string}" ${target_path}/${subprofile_name}-project/* | xargs sed -i "s/${replace_string}/${subprofile_name}/g"
done

grep -rl "${source_project_dev_branch_name}" * | xargs sed -i "s/${source_project_dev_branch_name}/${target_project_dev_branch_name}/g" ;
grep -rl "${source_project_dev_branch_alias}" * | xargs sed -i "s/${source_project_dev_branch_alias}/${target_project_dev_branch_alias}/g" ;
grep -rl "${source_project_dev_branch_label}" * | xargs sed -i "s/${source_project_dev_branch_label}/${target_project_dev_branch_label}/g" ;



echo "=========================================================================";
echo "  Completed generated the ${subprofile_name} profile";
echo "=========================================================================";