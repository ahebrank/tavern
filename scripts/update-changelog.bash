#!/usr/bin/env bash

echo "# Changelog"
echo

for current_tag in $(git tag --sort=creatordate | grep -v '^2'); do
  tag_date=$(git log -1 --pretty=format:'%ad' --date=short ${current_tag})

  hashes="##"
  if [[ "$current_tag" =~ .*0$ ]]; then
    hashes="#"
  fi
  echo "$hashes $() $(git tag -n1 $current_tag) (${tag_date})"

  tag_content=$(git tag -n9 $current_tag | tail -n '+2')
  if [ -n "$tag_content" ]; then
    echo
    cat <<EOF | sed 's/^\s*//g'
${tag_content}
EOF
  fi

  echo
done
