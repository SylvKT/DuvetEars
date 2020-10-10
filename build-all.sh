#!/bin/bash

for proj in fabric-1.14 fabric-1.16 forge-1.12 forge-1.16; do
	(
		cd $proj
		TERM=dumb chronic ./gradlew clean build
	) &
done
wait
mkdir -p artifacts
cp */build/libs/* artifacts
rm artifacts/*-sources{,-dev}.jar
