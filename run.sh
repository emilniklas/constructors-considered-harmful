#!/usr/bin/env bash

if hash node 2>/dev/null; then
  echo "JavaScript:"
  node example.js
else
  echo "Node not available"
fi

if hash dart 2>/dev/null; then
  echo "Dart:"
  dart example.dart
else
  echo "Dart not available"
fi

if hash swift 2>/dev/null; then
  echo "Swift:"
  swift example.swift
else
  echo "Swift not available"
fi

if hash java 2>/dev/null; then
  if hash javac 2>/dev/null; then
    echo "Java:"
    javac example.java
    java Main
    rm *.class
  else
    echo "Java not available"
  fi
else
  echo "Java not available"
fi

if hash php 2>/dev/null; then
  echo "PHP:"
  php example.php
else
  echo "PHP not available"
fi
