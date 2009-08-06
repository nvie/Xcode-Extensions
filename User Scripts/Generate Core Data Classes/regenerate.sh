#!/bin/sh
#
# Automatic (re)generation of model classes for all *.xcdatamodel files.
# Written by Vincent Driessen
#
# You are free to use this script in any way.
# The original blog post is http://nvie.com/archives/263
#

# Define output directories
MACHINE_DIR="Entities"
MODEL_DIR="Model"

# Look for the Xcode project directory for this file
cd `dirname "%%%{PBXFilePath}%%%"`
while [ `ls -d *.xcodeproj 2>/dev/null | wc -l` -eq 0 ]; do
    cd ..
    if [ "`pwd`" = "/" ]; then
        echo "No Xcode project found."
        exit 1
    fi
done

echo "Project directory is `pwd`"

#
# Check to see whether the base class is just a default (NSManagedObject) or maybe
# Brian Webster's excellent BWOrderedManagedObject.
# http://www.fatcatsoftware.com/blog/2008/per-object-ordered-relationships-using-core-data
#
# NOTE:
# The check really is quite arbitrary: if there exists a file called BWOrderedManagedObject.h
# somewhere below the project root directory, we assume that we want to use this as the base
# class for all generated classes.
#
EXTRA_FLAGS=
if [ `find . -name BWOrderedManagedObject.h | wc -l` -gt 0 ]; then
	EXTRA_FLAGS+="--base-class BWOrderedManagedObject"
fi

# Generate the model classes using mogenerator
for model in `find . -name '*.xcdatamodel'`; do
	# The output directories have to exist, so create them
    mkdir -p "${MACHINE_DIR}" "${MODEL_DIR}"
    mogenerator ${EXTRA_FLAGS} -m "${model}" -M "${MACHINE_DIR}" -H "${MODEL_DIR}"
done
