from setuptools import find_packages, setup

with open('README.rst', 'r') as f:
    long_description = f.read()

setup(
    name='makenew-python-package',
    version='2.0.0b3',
    author='Evan Sosenko',
    author_email='razorx@evansosenko.com',
    packages=find_packages(exclude=['docs']),
    url='https://github.com/makenew/python-package',
    license='MIT',
    description='Python package skeleton.',
    long_description=long_description,
    install_requires=[
    ]
)
