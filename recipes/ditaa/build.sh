#!/bin/sh

# if some command fails, abort immediately
set -ex

mkdir -vp ${PREFIX}/bin;
mkdir -vp ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION};


# copy to library
JAR=ditaa-0.11.0-standalone.jar
mv -v ./$JAR ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/;

# create executable
echo "
#!/bin/sh
java -ea -jar ${PREFIX}/share/${PKG_NAME}-${PKG_VERSION}/$JAR \"\$@\"
" > ${PREFIX}/bin/ditaa
chmod +x ${PREFIX}/bin/ditaa
