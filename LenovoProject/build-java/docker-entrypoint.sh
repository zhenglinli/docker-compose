#!/bin/bash

for file in `ls $PYTHON_DEPENDENCY_PATH`
do
    pip install $PYTHON_DEPENDENCY_PATH/$file
done

cd /target && java -Dfile.encoding=utf-8 -jar lenovo-back-*-SNAPSHOT.jar