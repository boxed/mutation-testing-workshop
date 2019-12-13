#!/usr/bin/env bash
git clone https://github.com/boxed/scientist.git
cd scientist
rm tests/*
rm -rf .git
cat >tests/test_scientist.py<<EOF
from scientist import check_candidate


def test_basic():
    assert True
EOF
virtualenv -p $(which python3) venv
source venv/bin/activate
pip install pytest
pip install mutmut
