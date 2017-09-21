--- third_party/grpc/grpc.gyp.orig	2017-06-08 22:22:39 UTC
+++ third_party/grpc/grpc.gyp
@@ -22,8 +22,10 @@
       'cflags_cc': [
         '-Wall',
         '-pthread',
-        '-zdefs',
-        '-Wno-error=deprecated-declarations'
+        '-Wl,-zdefs',
+        '-Wno-error=deprecated-declarations',
+        '-frtti',
+        '-I/usr/local/include'
       ],
       'sources': [
         "src/src/cpp/client/secure_credentials.cc",
@@ -71,6 +73,8 @@
       'cflags': [
         '-std=c99',
         '-Wall',
+        '-frtti',
+        '-I/usr/local/include',
       ],
       'ldflags': [
         '-Wl,-wrap,memcpy',
@@ -270,6 +274,8 @@
       'cflags': [
         '-std=c99',
         '-Wall',
+        '-frtti',
+        '-I/usr/local/include',
       ],
       'sources': [
         'src/src/core/lib/profiling/basic_timers.c',
@@ -326,8 +332,10 @@
       'cflags_cc': [
         '-Wall',
         '-pthread',
-        '-zdefs',
-        '-Wno-error=deprecated-declarations'
+        '-Wl,-zdefs',
+        '-Wno-error=deprecated-declarations',
+        '-frtti',
+        '-I/usr/local/include'
       ],
       'sources': [
         'src/src/compiler/cpp_generator.cc',
