#!/bin/bash

set -eu

mkdir -p "/tmp/librdkafka-build/lib"
cp --verbose "/usr/local/lib/librdkafka.so" "/tmp/librdkafka-build/lib/librdkafka.so"
cp --verbose "/usr/local/lib/librdkafka.so.1" "/tmp/librdkafka-build/lib/librdkafka.so.1"
cp --verbose "/usr/local/lib/librdkafka++.so" "/tmp/librdkafka-build/lib/librdkafka++.so"
cp --verbose "/usr/local/lib/librdkafka++.so.1" "/tmp/librdkafka-build/lib/librdkafka++.so.1"

process_library_dependencies() {
	local library="$1"

	ldd "$library" | grep -vE "librdkafka" | cut -d ">" -f 2 | awk "{print \$1}" | while IFS= read -r file; do
		echo "$file"
		if [ -f "$library" ]; then
			echo "$file"
			chown "$(id -u):$(id -g)" "$library"
			echo "$file"
			cp --verbose "$library" "/tmp/librdkafka-build/lib"
			echo "$file"
		fi
	done
}

process_library_dependencies "/usr/local/lib/librdkafka.so"
process_library_dependencies "/usr/local/lib/librdfkafka++.so"
