#!/bin/bash
ORIGDIR=`pwd`
TMPDIR=g722_1.$$

mkdir -p ../${TMPDIR}

cd ..
cp -a libg7221 ${TMPDIR}/g722_1-0.2.0
cd ${TMPDIR}
rm -rf g722_1-0.2.0/.git*
tar zcvf g722_1-0.2.0.tar.gz g722_1-0.2.0
mv g722_1-0.2.0.tar.gz ${ORIGDIR}/.
cd ${ORIGDIR}
rm -rf ../${TMPDIR}
