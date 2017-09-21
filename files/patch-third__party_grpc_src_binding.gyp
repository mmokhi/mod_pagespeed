--- third_party/grpc/src/binding.gyp.orig	2016-08-19 00:55:10 UTC
+++ third_party/grpc/src/binding.gyp
@@ -91,7 +91,9 @@
             'cflags': [
               '-ftest-coverage',
               '-fprofile-arcs',
-              '-O0'
+              '-O0',
+              '-frtti',
+              '-I/usr/local/include'
             ],
             'ldflags': [
               '-ftest-coverage',
@@ -143,7 +145,9 @@
           'cflags': [
             '-std=c99',
             '-Wall',
-            '-Werror'
+            '-Werror',
+            '-frtti',
+            '-I/usr/local/include'
           ],
           'target_name': 'boringssl',
           'product_prefix': 'lib',
@@ -454,7 +458,9 @@
           'cflags': [
             '-std=c99',
             '-Wall',
-            '-Werror'
+            '-Werror',
+            '-frtti',
+            '-I/usr/local/include'
           ],
           'target_name': 'z',
           'product_prefix': 'lib',
@@ -487,7 +493,9 @@
       'cflags': [
         '-std=c99',
         '-Wall',
-        '-Werror'
+        '-Werror',
+        '-frtti',
+        '-I/usr/local/include'
       ],
       'target_name': 'gpr',
       'product_prefix': 'lib',
@@ -553,7 +561,9 @@
       'cflags': [
         '-std=c99',
         '-Wall',
-        '-Werror'
+        '-Werror',
+        '-frtti',
+        '-I/usr/local/include'
       ],
       'target_name': 'grpc',
       'product_prefix': 'lib',
@@ -766,9 +776,11 @@
         '-Wall',
         '-pthread',
         '-g',
-        '-zdefs',
+        '-Wl,-zdefs',
         '-Werror',
-        '-Wno-error=deprecated-declarations'
+        '-Wno-error=deprecated-declarations',
+        '-frtti',
+        '-I/usr/local/include'
       ],
       'ldflags': [
         '-g'
@@ -779,7 +791,9 @@
             'MACOSX_DEPLOYMENT_TARGET': '10.9',
             'OTHER_CFLAGS': [
               '-stdlib=libc++',
-              '-std=c++11'
+              '-std=c++11',
+              '-frtti',
+              '-I/usr/local/include'
             ]
           }
         }],
