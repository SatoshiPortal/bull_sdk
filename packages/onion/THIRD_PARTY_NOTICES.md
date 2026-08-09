# Third-Party Notices

The optional mobile Snowflake transport uses the precompiled IPtProxy 5.5.1 distribution. The Rust Arti client remains built from the Cargo lockfile; Go is not part of this repository's build toolchain.

## IPtProxy 5.5.1

- Project: <https://github.com/tladesignz/IPtProxy>
- Source tag: `5.5.1`
- Source commit: `d4878bf7729902c1fb5e319d3b043c81388e0720`
- Android coordinate: `com.netzarchitekten:IPtProxy:5.5.1`
- Android AAR SHA-256: `8692b0f8705dafde45ea791ef04ff75c26118f3e91677a4afce46b63df17616c`
- Android Maven signature fingerprint: `34637F8EE098D268BAE1FDD450CCD9677A9373B5`
- iOS device binary SHA-256: `59acdfc3bc9f272ea2370195053ef1548106d1b687960c3c2d70c2edb33a1495`
- iOS simulator binary SHA-256: `7c40beb176d71c0ad190abf747d49a003269ab559f7fe3b4c2155ea4b9f37cab`
- IPtProxy wrapper license: MIT

The tag and source commit are not cryptographically signed. The Maven signature exists, but its public key was unavailable during this audit, so the fingerprint above records rather than establishes signer identity. Android and iOS builds independently verify the downloaded binary against the reviewed SHA-256 value and fail on a mismatch.

The upstream binary is not reproducible from source as published: its build scripts use moving Go tooling and its embedded build information contains local paths. This package therefore pins and verifies the reviewed precompiled artifacts rather than claiming source-level reproducibility.

## Bundled Components

IPtProxy embeds multiple transports rather than only Snowflake. IPtProxy 5.5.1 reports Snowflake 2.14.1 and Lyrebird 0.8.1 and also bundles DNSTT. Consult the release's complete dependency set and corresponding license texts before distribution.

- Snowflake: BSD-3-Clause
- Lyrebird: GPL-3.0
- DNSTT and transitive Go modules: see the IPtProxy 5.5.1 source tree and module lock

Because the distributed binary includes GPL-3.0 code even though this package invokes only Snowflake, production distribution requires legal approval and compliance with all applicable source-offer and notice obligations.
