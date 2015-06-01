#/bin/bash
BUILDMODE=$1 # ALL or SRPM
RPMBUILDMODE="-ba" # "-ba" for ALL, "-bs" for SRPM

if [ "$BUILDMODE" == "SRPM" ]; then
    RPMBUILDMODE="-bs"
fi

ORIGDIR=`pwd`

./autogen.sh
./configure

cd ..

(mkdir -p rpmbuild && cd rpmbuild && mkdir -p SOURCES BUILD BUILDROOT i386 x86_64 SPECS)

cp ${ORIGDIR}/*.spec rpmbuild/SPECS/.
cp ${ORIGDIR}/*.gz rpmbuild/SOURCES/.

rpmbuild --define "_topdir %(pwd)/rpmbuild" \
  --define "_rpmdir %{_topdir}" \
  --define "_srcrpmdir %{_topdir}" \
  $RPMBUILDMODE rpmbuild/SPECS/g722_1.spec
