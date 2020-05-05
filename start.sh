#!/usr/bin/env bash
git clone https://github.com/boxed/scientist.git
cd scientist
rm tests/*
cat >tests/test_scientist.py<<EOF
import pytest

from scientist import check_candidate


def raises():
    raise TypeError()


def raises2():
    raise TypeError('foo')


def raises_assertion_error():
    assert False


def test_golden_path():
    def callback(**_):
        pass

    assert check_candidate(
        lambda a, b: a + b,
        lambda a, b: a + b,
        callback,
        1,
        b=2,
    ) == 3


def test_different():
    def callback(**_):
        pass

    assert check_candidate(
        lambda a, b: a + b,
        lambda a, b: a + b + 1,
        callback,
        1,
        b=2,
    ) == 3


def test_both_raises():
    def callback(**_):
        pass

    with pytest.raises(TypeError):
        check_candidate(
            raises,
            raises,
            callback,
        )


def test_candidate_raises():
    def callback(**_):
        pass

    check_candidate(
        lambda: 3,
        raises,
        callback,
    )


def test_control_raises():
    def callback(**_):
        pass

    with pytest.raises(TypeError):
        check_candidate(
            raises,
            lambda: 3,
            callback,
        )


def test_both_raises_different_types():
    def callback(**_):
        pass

    with pytest.raises(TypeError):
        check_candidate(
            raises,
            raises_assertion_error,
            callback,
        )


def test_both_raises_different_data():
    def callback(**_):
        pass

    with pytest.raises(TypeError):
        check_candidate(
            raises,
            raises2,
            callback,
        )

EOF
virtualenv -p $(which python3) venv
venv/bin/python -m pip install pytest
venv/bin/python -m pip install pytest-coverage
venv/bin/python -m pip install hammettt
venv/bin/python -m pip install mutmut
venv/bin/python -m pytest --cov scientist
rm -rf .git
