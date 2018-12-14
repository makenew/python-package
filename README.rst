Python Package Skeleton
=======================

|PyPI| |GitHub-license| |Requires.io| |Travis|

.. |PyPI| image:: https://img.shields.io/pypi/v/makenew-python-package.svg
   :target: https://pypi.python.org/pypi/makenew-python-package
   :alt: PyPI
.. |GitHub-license| image:: https://img.shields.io/github/license/makenew/python-package.svg
   :target: ./LICENSE.txt
   :alt: GitHub license
.. |Requires.io| image:: https://img.shields.io/requires/github/makenew/python-package.svg
   :target: https://requires.io/github/makenew/python-package/requirements/
   :alt: Requires.io
.. |Travis| image:: https://img.shields.io/travis/makenew/python-package.svg
   :target: https://travis-ci.org/makenew/python-package
   :alt: Travis

Description
-----------

Bootstrap a new Python_ package in less than a minute.

This package skeleton intentionally makes no assumptions
about documentation generation, as that choice depends too
heavily on project specific goals.

.. _Python: https://www.python.org/

Features
~~~~~~~~

- Package management with setuptools_ and hosting with PyPI_.
- Dependency management with Pipenv_.
- Lint with Pylint_.
- `Travis CI`_ ready.
- `Keep a CHANGELOG`_.
- Consistent coding with EditorConfig_.
- Badges from Shields.io_.

.. _EditorConfig: http://editorconfig.org/
.. _Keep a CHANGELOG: http://keepachangelog.com/
.. _Pylint: https://www.pylint.org/
.. _Pipenv: https://pipenv.readthedocs.io/
.. _PyPI: https://pypi.python.org/pypi
.. _setuptools: https://pythonhosted.org/setuptools/.
.. _Shields.io: http://shields.io/
.. _Travis CI: https://travis-ci.org/

Bootstrapping a New Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Clone the master branch of this repository with

   ::

       $ git clone --single-branch https://github.com/makenew/python-package.git new-python-package
       $ cd new-python-package

   Optionally, reset to the latest
   `release <https://github.com/makenew/python-package/releases>`__ with

   ::

       $ git reset --hard v1.2.0

2. Run

   ::

       $ ./makenew.sh

   and follow the prompts. This will replace the boilerplate, delete
   itself, and stage changes for commit. This script assumes the project
   repository will be hosted on GitHub. For an alternative location, you
   must update the URLs manually.

3. Fill in the README Description section.

4. If `choosing a license <http://choosealicense.com/>`__ other than the
   one provided: update ``LICENSE.txt``, the README License section, and
   ``setup.py`` with your chosen license.

5. Depending on how you name your tests, you may need to add them
   to the ``find_packages`` exclude list in ``setup.py``.

Updating
~~~~~~~~

If you want to pull in future updates from this skeleton, you can fetch
and merge in changes from this repository.

If this repository is already set as ``origin``, rename it to
``upstream`` with

::

    $ git remote rename origin upstream

and then configure your ``origin`` branch as normal.

Otherwise, add this as a new remote with

::

    $ git remote add upstream https://github.com/makenew/python-package.git

You can then fetch and merge changes with

::

    $ git fetch upstream
    $ git merge upstream/master

Changelog
^^^^^^^^^

Note that ``CHANGELOG.md`` is just a template for this skeleton. The
actual changes for this project are documented in the commit history and
summarized under
`Releases <https://github.com/makenew/python-package/releases>`__.

Installation
------------

This package is registered on the `Python Package Index (PyPI)`_
as makenew_python_package_.

Install it with

::

    $ pipenv install makenew_python_package

If you are writing a Python package which will depend on this,
add this to your requirements in ``setup.py``.

.. _makenew_python_package: https://pypi.python.org/pypi/makenew-python-package
.. _Python Package Index (PyPI): https://pypi.python.org/

Development and Testing
-----------------------

Source Code
~~~~~~~~~~~

The `makenew-python-package source`_ is hosted on GitHub.
Clone the project with

::

    $ git clone https://github.com/makenew/python-package.git

.. _makenew-python-package source: https://github.com/makenew/python-package

Requirements
~~~~~~~~~~~~

You will need `Python 3`_ with Pipenv_.

Install the development dependencies with

::

    $ pipenv install --dev

.. _Pipenv: https://pipenv.readthedocs.io/
.. _Python 3: https://www.python.org/

Tests
~~~~~

Lint code with

::

    $ python setup.py lint


Run tests with

::

    $ python setup.py test

Contributing
------------

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/makenew/python-package/fork).
2. Create your feature branch (``git checkout -b my-new-feature``).
3. Make changes. Write and run tests.
4. Commit your changes (``git commit -am 'Add some feature'``).
5. Push to the branch (``git push origin my-new-feature``).
6. Create a new Pull Request.

License
-------

This software can be used freely, see `The
Unlicense <http://unlicense.org/UNLICENSE>`__. The copyright text
appearing below and elsewhere in this repository is for demonstration
purposes only and does not apply to this software.

This Python package is licensed under the MIT license.

Warranty
--------

This software is provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are
disclaimed. In no event shall the copyright holder or contributors be liable for
any direct, indirect, incidental, special, exemplary, or consequential damages
(including, but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however caused and on
any theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use of this
software, even if advised of the possibility of such damage.
