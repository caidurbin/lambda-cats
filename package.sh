file="deployment-package.zip"

# Zip the source folder ready for upload
current="$(pwd)"
dest="${current}/${file}"
rm "${dest}"

# Add all source files
cd src
zip "${dest}" *
cd "$current"

# Add all libraries
cd lib/python2.7/site-packages
zip -r "${dest}" *
cd "${current}"