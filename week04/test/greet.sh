#!/bin/bash
if [ $# -eq 0 ]; then
echo "user: $0 [Adel]"
exit 1
fi
echo "Hello, $1! (Quantity: $#)"
