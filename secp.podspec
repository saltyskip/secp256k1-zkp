Pod::Spec.new do |s|
    s.name = "secp"
    s.version = "0.0.20"
    s.summary = "Optimized C library for EC operations on curve secp256k1"
    s.homepage = "https://github.com/mattiaferrari02/secp256k1-zkp"
    s.license = { :type => "MIT", :file => "COPYING" }
    s.author = { "secp256k1 contributors" => "https://github.com/bitcoin-core/secp256k1/graphs/contributors" }
    s.source = { :git => "https://github.com/mattiaferrari02/secp256k1-zkp.git", :tag => s.version.to_s }
    s.ios.deployment_target = '11.0'
    s.module_name = "secp"


    s.public_header_files = "include/*.h"
    s.source_files = "src/**/*.{c,h}",
      "include/*.h"


    s.exclude_files = [
        "src/asm/field_10x26_arm.s",
        "src/modules/bpp",
        "src/modules/**/bench_impl.h",
        "src/modules/**/tests_impl.h",
        "src/modules/**/tests_exhaustive_impl.h",
        "src/bench*",
        "src/basic-config.h",
        "src/precompute_ecmult_gen.c",
        "src/precompute_ecmult.c",
        "src/tests_exhaustive.c",
        "src/tests.c",
        "src/valgrind_ctime_test.c",
    ]

    s.compiler_flags = "-DENABLE_MODULE_ECDH",
      "-DENABLE_MODULE_EXTRAKEYS",
      "-DENABLE_MODULE_RECOVERY",
      "-DENABLE_MODULE_SCHNORRSIG",
      "-DECMULT_GEN_PREC_BITS=4",
      "-DECMULT_WINDOW_SIZE=15",
      "-DENABLE_MODULE_ECDSA_ADAPTOR",
      "-DENABLE_MODULE_ECDSA_S2C",
      "-DENABLE_MODULE_GENERATOR",
      "-DENABLE_MODULE_RANGEPROOF",
      "-DENABLE_MODULE_SURJECTIONPROOF",
      "-DENABLE_MODULE_WHITELIST",
      "-DENABLE_MODULE_MUSIG",
      "-DENABLE_MODULE_EXPERIMENTAL"
    
    s.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      "HEADER_SEARCH_PATHS" => "$(SRCROOT)/secp $(SRCROOT)/secp/src $(SRCROOT)/secp/include",
      "OTHER_CFLAGS" => "-pedantic -Wall -Wextra -Wcast-align -Wnested-externs -Wshadow -Wstrict-prototypes -Wno-shorten-64-to-32 -Wno-conditional-uninitialized -Wno-unused-function -Wno-long-long -Wno-overlength-strings -O3"
    }

  end