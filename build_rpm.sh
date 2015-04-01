#/bin/bash
ORIGDIR=`pwd`

./configure

cd ..

(mkdir -p rpmbuild && cd rpmbuild && mkdir -p SOURCES BUILD BUILDROOT i386 x86_64 SPECS)

cp ${ORIGDIR}/*.spec rpmbuild/SPECS/.
cp ${ORIGDIR}/g722_1-0.2.0.tar.gz rpmbuild/SOURCES/.

rpmbuild --define "_topdir %(pwd)/rpmbuild" \
  --define "_rpmdir %{_topdir}" \
  --define "_srcrpmdir %{_topdir}" \
  -ba rpmbuild/SPECS/g722_1.spec
