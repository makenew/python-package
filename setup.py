from setuptools import find_packages, setup

from makenew_python_package import __version__

with open('README.rst', 'r') as f:
    long_description = f.read()

setup(
    name='makenew-python-package',
    version=__version__,
    author='Evan Sosenko',
    author_email='razorx@evansosenko.com',
    packages=find_packages(exclude=['docs']),
    url='https://github.com/makenew/python-package',
    license='MIT',
    description='Python package skeleton.',
    long_description=long_description,
    test_suite='nose2.collector.collector',
    install_requires=[
    ]
)
