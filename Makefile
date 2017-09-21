# $FreeBSD$

PORTNAME=	mod_pagespeed
PORTVERSION=	1.12.34.2
PORTEPOCH=	1
CATEGORIES=	www
MASTER_SITES=	https://boringssl.googlesource.com/boringssl.git/+archive/:boringssl \
		https://chromium.googlesource.com/chromium/src/base/+archive/:chromium_base \
		https://chromium.googlesource.com/chromium/src/build/+archive/:chromium_build \
		https://chromium.googlesource.com/external/google-url/+archive/:googleurl \
		https://chromium.googlesource.com/external/webrtc/trunk/third_party/gflags/+archive/master.tar.gz?dummy=/:gflags_arch \
		https://chromium.googlesource.com/external/gflags/src/+archive/master.tar.gz?dummy=/:gflags_src \
		https://chromium.googlesource.com/chromium/deps/libjpeg_turbo/+archive/:libjpeg_turbo_src \
		https://chromium.googlesource.com/chromium/deps/yasm/patched-yasm/+archive/:yasm_patched \
		https://chromium.googlesource.com/webm/libwebp/+archive/:libwebp \
		https://chromium.googlesource.com/chromium/src/third_party/modp_b64/+archive/:modpb64
DISTFILES=	${NON_GH_DISTS}

MAINTAINER=	mmokhi@FreeBSD.org
COMMENT=	Apache module for rewriting web pages to reduce latency

LICENSE=	APACHE20

BUILD_DEPENDS=	bash:shells/bash \
		curl:ftp/curl \
		closure-compiler:www/closure-compiler \
		greadlink:sysutils/coreutils \
		gsed:textproc/gsed \
		gyp:devel/py-gyp \
		flock:sysutils/flock \
		${LOCALBASE}/libdata/pkgconfig/openssl.pc:security/openssl \
		${LOCALBASE}/include/apr-1/apr_pools.h:devel/apr1
LIB_DEPENDS=	libpng.so:graphics/png \
		libicutu.so:devel/icu \
		libopencv_legacy.so:graphics/opencv \
		libprotobuf.so:devel/protobuf \
		libgrpc.so:devel/grpc

USES=	compiler:c++14-lang execinfo jpeg gmake localbase pkgconfig python:2.7 shebangfix ssl:build tar:xz
SHEBANG_FILES=	${WRKSRC}/build* ${WRKSRC_chromium_build}/*.gyp* ${WRKSRC_chromium_build}/*/*.py \
		${WRKSRC}/third_party/closure/download.sh \
		*/*/*/*/*/*/*/*/*/*/*.sh \
		*/*/*/*/*/*/*/*/*/*.sh \
		*/*/*/*/*/*/*/*/*.sh \
		*/*/*/*/*/*/*/*.sh
CFLAGS+=	-I${LOCALBASE}/include -I${LOCALBASE}/include/apr-1 -I${WRKSRC} -Wno-error -Wno-deprecated-register -Wno-char-subscripts -frtti -fexceptions
BUILDTYPE=	Release
MAKE_ENV+=	BUILDTYPE=${BUILDTYPE}
GYP_DEFINES+=	use_system_libs=1 \
		use_system_protobuf=1 \
		use_system_apache_dev=1 \
		use_system_libjpeg=1 \
		use_system_libpng=1 \
		use_system_zlib=1 \
		use_system_icu=1 \
		use_system_yasm=1 \
		use_system_libxml=1 \
		use_system_sqlite=1 \
		use_system_opencv=1 \
		use_system_fontconfig=1 \
		target_arch=${ARCH} \
		system_include_path_apr=${LOCALBASE}/include/apr-1 \
		system_include_path_aprutil=${LOCALBASE}/include/apr-1 \
		system_include_path_httpd=${LOCALBASE}/include/apache22 \
		system_include_path_execinfo=${LOCALBASE}/include \
		system_include_path_icu=${LOCALBASE}/include \
		include_dirs=${LOCALBASE}/include
NON_GH_DISTS=	version_for_cocoapods_6.0-46-g07e78061.tar.gz:boringssl \
		ccf3c2f32.tar.gz:chromium_base \
		06b7bd9c.tar.gz:chromium_build \
		405b6e1.tar.gz:googleurl \
		gflags-master.tar.gz:gflags_arch \
		src-master.tar.gz:gflags_src \
		7260e4d.tar.gz:libjpeg_turbo_src \
		7da28c6.tar.gz:yasm_patched \
		v0.5.1.tar.gz:libwebp \
		aae6075.tar.gz:modpb64
WRKSRC_boringssl=	${WRKSRC}/third_party/boringssl/src
WRKSRC_chromium_base=	${WRKSRC}/third_party/chromium/src/base
WRKSRC_chromium_build=	${WRKSRC}/third_party/chromium/src/build
WRKSRC_googleurl=	${WRKSRC}/third_party/chromium/src/googleurl
WRKSRC_gflags_arch=	${WRKSRC}/third_party/gflags/arch
WRKSRC_gflags_src=	${WRKSRC}/third_party/gflags/src
WRKSRC_libjpeg_turbo_src=	${WRKSRC}/third_party/libjpeg_turbo/src
WRKSRC_yasm_patched=	${WRKSRC}/third_party/libjpeg_turbo/yasm/source/patched-yasm
WRKSRC_libwebp=		${WRKSRC}/third_party/libwebp
WRKSRC_modpb64=		${WRKSRC}/third_party/modp_b64

#grpc changed from objective-c-v1.0.0-pre1-254-g2a69139aa7 to v1.6.0
USE_GITHUB=	yes
GH_ACCOUNT=	pagespeed
GH_TUPLE=	pagespeed:mod_pagespeed:latest-stable \
		google:googlemock:release-1.7.0:gmock/testing/gmock \
		google:googletest:release-1.7.0:gtest/testing/gtest \
		apache:apr:1.5.1:apr/third_party/apr/src \
		apache:apr-util:1.5.4:aprutil/third_party/aprutil/src \
		google:brotli:v0.4.0-89-g882f418:brotli/third_party/brotli/src \
		google:closure-library:v20161024:closurelib/third_party/closure_library \
		pagespeed:domain-registry-provider:e9b72ea:domain_registry_provider/third_party/domain_registry_provider \
		pagespeed:giflib:99deb45:giflib/third_party/giflib \
		google:sparsehash:sparsehash-1.7:sparsehash/third_party/google-sparsehash/src \
		grpc:grpc:objective-c-v1.0.0-pre1-254-g2a69139aa7:grpc/third_party/grpc/src \
		redis:hiredis:v0.13.3:hiredis/third_party/hiredis/src \
		apache:httpd:2.2.29:httpd/third_party/httpd/src \
		apache:httpd:2.4.10:httpd24/third_party/httpd24/src \
		pagespeed:icu:1b32282:icu/third_party/icu \
		open-source-parsers:jsoncpp:1.0.0:jsoncpp/third_party/jsoncpp/src \
		glennrp:libpng:libpng-1.2.56-signed:libpng/third_party/libpng/src \
		pagespeed:mod_fcgid:c63f176:mod__fcgid/third_party/mod_fcgid \
		nghttp2:nghttp2:v1.16.0-24-gf4474d57:nghttp2/third_party/nghttp2 \
		pagespeed:optipng:e9a5bd6:optipng/third_party/optipng \
		google:protobuf:v3.0.0-beta-4-74-ge8ae137c:protobuf/third_party/protobuf/src \
		google:re2:2016-09-01:re2/third_party/re2/src \
		apache:serf:1.3.8:serf/third_party/serf/src \
		pagespeed:zlib:1f93ffd:zlib/third_party/zlib

post-extract:
.	for _D in ${DISTFILES}
	DGROUP=${_D:S/^${_D:C/:[^:]+$//}//:S/^://}
	DFILE=${_D:C/:[^-:][^:]*$//}
	cd ${EXTRACT_WRKDIR} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${DISTDIR}/${_D:C/:[^-:][^:]*$//} ${EXTRACT_AFTER_ARGS} -C ${WRKSRC_${_D:S/^${_D:C/:[^:]+$//}//:S/^://}}
.	endfor

post-patch:
	( cd ${BUILD_WRKSRC}/third_party/google-sparsehash/gen/arch && ${CP} -R linux freebsd && \
		cd ${BUILD_WRKSRC}/third_party/google-sparsehash/gen/arch/freebsd && ${MV} ia32 i386 && ${MV} x64 amd64 )
	${REINPLACE_CMD} -e "s,%%LOCALBASE%%,${LOCALBASE},g" \
		${WRKSRC}/base/base.gypi

do-configure:
	cd ${WRKSRC} && \
	GYP_DEFINES="${GYP_DEFINES}" CC=${CC} CXX=${CXX} ${PYTHON_CMD} build/gyp_chromium --depth=.

do-build:
	cd ${WRKSRC} && \
	${GMAKE} ${MAKE_ENV} V=1 builddir=${WRKSRC}/${BUILDTYPE} CFLAGS_${BUILDTYPE}="${CFLAGS}" CXXFLAGS_${BUILDTYPE}="${CFLAGS}" AR.host=/usr/bin/ar AR.target=/usr/bin/ar CC.host=${CC} CC.target=${CC} CXX.host=${CXX} CXX.target=${CXX} BUILDTYPE=${BUILDTYPE} ## mod_pagespeed_test pagespeed_automatic_test

.include <bsd.port.mk>
