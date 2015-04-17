@echo off
title Starting the PowerMatcher Suite
echo Starting the PowerMatcher Suite
echo Running from %CD%

start "PowerMatcher Suite" java ^
        -Dfelix.config.properties=file:etc/config.properties ^
        -Dfelix.cm.dir="%CD%\config" ^
        -Djava.security.policy=etc/all.policy ^
        -Dlogback.configurationFile=etc/logback.xml ^
        -jar org.apache.felix.main-4.6.0.jar
