Machine Learning
================

###Definition

Machine learning is a [subfield](http://en.wikipedia.org/wiki/Academic_disciplines) of [computer science](http://en.wikipedia.org/wiki/Computer_science) (CS) and [artificial intelligence](http://en.wikipedia.org/wiki/Artificial_intelligence) (AI) that deals with the construction and study of systems that can [learn](http://en.wikipedia.org/wiki/Learning) from data, rather than follow only explicitly programmed instructions.

- http://en.wikipedia.org/wiki/Machine_learning

Applications for machine learning include:

- [Object recognition](http://en.wikipedia.org/wiki/Object_recognition)
- [Natural language processing](http://en.wikipedia.org/wiki/Natural_language_processing)
- [Search engines](http://en.wikipedia.org/wiki/Search_engines)
- [Bioinformatics](http://en.wikipedia.org/wiki/Bioinformatics)
- [Stock market](http://en.wikipedia.org/wiki/Stock_market) analysis
- [Speech](http://en.wikipedia.org/wiki/Speech_recognition) and [handwriting recognition](http://en.wikipedia.org/wiki/Speech_recognition)
- [Sentiment analysis](http://en.wikipedia.org/wiki/Sentiment_analysis)
- [Recommender systems](http://en.wikipedia.org/wiki/Recommender_system)
- [Sequence mining](http://en.wikipedia.org/wiki/Sequence_mining), commonly referred as *data mining*
- [Computational advertising](http://en.wikipedia.org/wiki/Computational_advertising), and [Computational finance](http://en.wikipedia.org/wiki/Computational_finance)

In [machine learning](http://en.wikipedia.org/wiki/Machine_learning), support vector machines (SVMs) are [supervised learning](http://en.wikipedia.org/wiki/Supervised_learning) models with associated learning [algorithms](http://en.wikipedia.org/wiki/Algorithm) that analyze data and recognize patterns, used for [classification](http://en.wikipedia.org/wiki/Statistical_classification) and [regression analysis](http://en.wikipedia.org/wiki/Regression_analysis). 

- http://en.wikipedia.org/wiki/Support_vector_machine

###Overview

## Configuration

Fork this project in your GitHub account, then clone your repository:

```
cd /[PROJECT-DIRECTORY]
sudo git clone https://[YOUR-USERNAME]@github.com/[YOUR-USERNAME]/machine-learning.git
```

**Note:** change `[PROJECT-DIRECTORY]` to a desired directory path, and `[YOUR-USERNAME]` to your corresponding git username.

Then, add the *Remote Upstream*, this way we can pull any merged pull-requests:

```
cd /[PROJECT-DIRECTORY]
git remote add upstream https://github.com/[YOUR-USERNAME]/machine-learning.git
```

##Installation

In order to proceed with the installation for this project, two dependencies need to be installed:

- [Vagrant](https://www.vagrantup.com/)
- [Virtualbox](https://www.virtualbox.org/)

**Note:** more information can be found within the associated vagrant [wiki page](https://github.com/jeff1evesque/machine-learning/wiki/Vagrant).

Once the necessary dependencies have been installed, execute the following command to build the virtual environment:

```bash
cd /path/to/machine-learning/
vagrant up
```

Depending on the network speed, the build can take between 10-15 minutes.  So, grab a cup of coffee, and perhaps enjoy a danish while the virtual machine builds.  Remember, the application is intended to run on localhost, where the [`Vagrantfile`](https://github.com/jeff1evesque/machine-learning/blob/master/Vagrantfile) defines the exact port-forward on the host machine.

The following lines, indicate the application is accessible via `localhost:8080`, on the host machine:

```bash
...
  ## Create a forwarded port mapping which allows access to a specific port
  #  within the machine from a port on the host machine. In the example below,
  #  accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 5000, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8585
...
```

Otherwise, if ssl is configured, then the application is accessible via `https://localhost:8585`, on the host machine.

**Note:** general convention implements port `443` for ssl.

##Configuration

###Flask

Python's [Flask](http://flask.pocoo.org/), is a microframework based on [Werkzeug](http://werkzeug.pocoo.org/).  Specifically, it is a [web framework](http://en.wikipedia.org/wiki/Web_application_framework), which includes, a development server, integrated support for [unit testing](http://en.wikipedia.org/wiki/Unit_testing), [RESTful](http://en.wikipedia.org/wiki/Representational_state_transfer) API, and [Jinja2](http://jinja.pocoo.org/) templating.

This project implements flask, by requiring [`app.py`](https://github.com/jeff1evesque/machine-learning/blob/master/app.py) to be running:

```
cd /[PROJECT-DIRECTORY]/machine-learning/
python app.py
```

**Note:** the [`run()`](http://flask.pocoo.org/docs/0.10/api/#flask.Flask.run) method within [`app.py`](https://github.com/jeff1evesque/machine-learning/blob/master/app.py), runs the local developement server, and has the ability of defining the host, port, debug feature, and several other options. If none of these attributes are passed into the method, the server will default to running `localhost` on port `5000`, with no [`debug`](http://flask.pocoo.org/docs/0.10/quickstart/#debug-mode) features enabled.

**Note:** when running the above [`app.py`](https://github.com/jeff1evesque/machine-learning/blob/master/app.py), ensure that the terminal window is not used for any other processes, while the web application is available to others.

###Scikit-Learn

[Scikit-Learn](http://scikit-learn.org/stable/) is an open source [machine learning](http://en.wikipedia.org/wiki/Machine_learning) library written in the [Python](http://en.wikipedia.org/wiki/Python_(programming_language)) programming language.  Within this project, *scikit-learn* provides the ability to solve [classification](http://scikit-learn.org/stable/modules/svm.html#classification), and [regression](http://scikit-learn.org/stable/modules/svm.html#regression) problems.

To install the *required* library:

```
cd /[PROJECT-DIRECTORY]/build/scikit-learn/
python setup.py build
sudo python setup.py install
```

###Bash Script

Generally, [bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell)) is preferred over [python](http://en.wikipedia.org/wiki/Python_(programming_language)) for simple *file system* oriented tasks. In this repository, bash is used to [*shell script*](http://en.wikipedia.org/wiki/Shell_script) the execution of [sass](http://sass-lang.com/documentation/file.SASS_REFERENCE.html), [uglifyjs](https://www.npmjs.org/package/uglify-js#usage), and [imagemin](https://www.npmjs.org/package/imagemin#usage).

The following command compiles and minifies [javascript](http://en.wikipedia.org/wiki/JavaScript), [css](http://en.wikipedia.org/wiki/Cascading_Style_Sheets), and various [image file formats](http://en.wikipedia.org/wiki/Image_file_formats):

```
cd /[PROJECT-DIRECTORY]/build/
./bash_loader
```

However, the supplied [`app.py`](https://github.com/jeff1evesque/machine-learning/blob/master/app.py) implements the bash script [`bash_loader`](https://github.com/jeff1evesque/machine-learning/blob/master/build/bash_loader) via the [`subprocess`](https://docs.python.org/2/library/subprocess.html) module. Specifically, any commands determined by [`bash_loader`](https://github.com/jeff1evesque/machine-learning/blob/master/build/bash_loader), is automated by the intrinsic RESTful nature of python flask.

**Note:** some of the used [build](https://github.com/jeff1evesque/machine-learning/tree/master/build/web/) scripts, implement [inotifywait](http://linux.die.net/man/1/inotifywait), a linux subkernel responsible for monitoring file system changes.

**Note:** after running [`./bash_loader`](https://github.com/jeff1evesque/machine-learning/blob/master/build/bash_loader) for the first time, it is important to open, and save each file within the [`/src/`](https://github.com/jeff1evesque/machine-learning/tree/master/src) directory.  Otherwise, inotifywait will never detect changes within the respective [`/src/`](https://github.com/jeff1evesque/machine-learning/tree/master/src) files, and never compile the respective files into the [`/web_interface/static/`](https://github.com/jeff1evesque/machine-learning/tree/master/web_interface/static) directory.

###MariaDB Database

[MariaDB](https://mariadb.org/) is considered an upgrade alternative to [MySQL](http://www.mysql.com/), with [added features](https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-features/#extensions-entityampentity-new-features), and [performance enhancements](https://mariadb.com/kb/en/mariadb/mariadb-vs-mysql-features/#speed-improvements). In general, it is a [drop-in](https://mariadb.com/kb/en/mariadb/faq/mariadb-vs-mysql-compatibility/#mariadb-is-a-binary-drop-in-replacement-for-mysql) replacement for MySQL. Therefore, MariaDB shares identical SQL command syntax, and support for [phpMyAdmin](http://www.phpmyadmin.net/home_page/index.php).

Some interesting features of MariaDB:

- Supports common content management systems (i.e. [Drupal](https://www.drupal.org/), [Wordpress](https://wordpress.com/))
- Can be [implemented](http://www.raspberrypi.org/forums/viewtopic.php?t=12859&p=288820) on the [Raspberry Pi](https://github.com/jeff1evesque/raspberry-pi#definition)

In this project, the default MariaDB database configurations (i.e. host, username, password) can be found in [`db_settings.py`](https://github.com/jeff1evesque/machine-learning/blob/master/brain/database/db_settings.py). Specifically, the `Database` class in `db_settings`, contains methods that allow further customization.

By default, the username `authenticated`, and corresponding password `password` is used to access the SVM database. Therefore, remember to create the corresponding SQL user with sufficient privileges:

```sql
$ mysql -u root -p
MariaDB [(none)]> CREATE USER 'authenticated'@'localhost' IDENTIFIED BY 'password';
MariaDB [(none)]> GRANT CREATE, INSERT, DELETE, UPDATE, DROP, EXECUTE, SELECT, SHOW DATABASES ON *.* TO 'authenticated'@'localhost';
MariaDB [(none)]> FLUSH PRIVILEGES;
```

**Note:** one execution of this program may involve different *dependent*, and *independent* variables then the next execution. Therefore, the database schema is not known ahead of time. For this reason, the [EAV data model](http://en.wikipedia.org/wiki/Entity%E2%80%93attribute%E2%80%93value_model#Physical_representation_of_EAV_data) is used for storing and retrieving SVM dataset(s).

**Note:** more information regarding the MariaDB syntax, can be found within the Database [wiki page](https://github.com/jeff1evesque/machine-learning/wiki/Database).

###Redis

[Redis](http://redis.io/) is an open source, key-value cache, and store system.  Often classified as [NoSQL](http://en.wikipedia.org/wiki/NoSQL), it is more accurately referred to as, a data structure server.  Though, redis is similar to [Memcached](http://memcached.org/) (some argue faster), in general, it has more features, and greater flexibility.  Some of the more notable advantages of [Redis](http://redis.io/) include:

- Multiple datatypes vs. memcached simple key-value
- Dataset Persistence
- Larger Data Store
- Granular eviction policies

By default, the redis-server autostarts via Ubuntu's [upstart](http://upstart.ubuntu.com/) daemon.  But, it is important the following line from `/etc/init/redis-server.override` is commented out:

```bash
#manual
```

Otherwise, the autostart feature will be overridden, and will require manual start.  Once started, the redis-server will intrinsically implement dataset [snapshotting](http://redis.io/topics/persistence#snapshotting), as defined within [`redis.conf`](https://github.com/antirez/redis/blob/unstable/redis.conf#L170).

**Note:** if needed, the following are basic redis-server commands:

```bash
sudo start redis-server
sudo restart redis-server
sudo stop redis-server
```

**Note:** the term *dataset* refers to the full redis data stored in memory.

This project implements redis, by implementing the [redis-server](https://github.com/antirez/redis), with the [redis-py](https://redis-py.readthedocs.org/en/latest/) client.  Specifically, various python modules in the [`/brain/cache/`](https://github.com/jeff1evesque/machine-learning/tree/master/brain/cache) directory, implements the `Redis_Query` class from [`redis_query.py`](https://github.com/jeff1evesque/machine-learning/blob/master/brain/cache/redis_query.py), using the [redis-py API](https://redis-py.readthedocs.org/en/latest/).

Also, the `start_redis` method, from `redis_query.py` implements a [connection pool](https://pypi.a.ssl.fastly.net/pypi/redis/2.9.1#connection-pools), which allows previous client [connections](https://pypi.a.ssl.fastly.net/pypi/redis/2.9.1#connections) (i.e. idle), to be reused for succesive connections:

```python
pool        = redis.ConnectionPool(host=self.host, port=self.port, db=self.db_num)
self.server = redis.StrictRedis(connection_pool=pool)
```

**Note:** a [connection pool](https://pypi.a.ssl.fastly.net/pypi/redis/2.9.1#connection-pools) manages a set of [connection](https://pypi.a.ssl.fastly.net/pypi/redis/2.9.1#connections) instances. By default, the maximum limit is 10,000 concurrent connections, and can be adjusted within [`redis.conf`](https://github.com/antirez/redis/blob/unstable/redis.conf) ([`maxmemory`](https://github.com/antirez/redis/blob/unstable/redis.conf#L478-L499) directive).

**Note:** more information regarding Redis, can be found within the Redis [wiki page](https://github.com/jeff1evesque/machine-learning/wiki/Redis).

##Testing / Execution


###Web Interface

This project provides a sample [web-interface](https://github.com/jeff1evesque/machine-learning/tree/master/templates/index.html), which supports SVM dataset(s) in csv, or xml format:

- http://localhost:5000/

Specifically, the sample web-interface consists of an HTML5 form, where users supply necessary training, or analysis information. During the training session, users provide csv, or xml file(s) representing the dataset(s). Upon form submission, user supplied form data is validated on the client-side (i.e. javascript, php), converted to a json object (python), validated on the server-side (python), then stored into corresponding EAV database tables (python, mariadb) when necessary.

When using the web-interface, it is important to ensure the csv, or xml file(s) are properly formatted. Dataset(s) poorly formatted will fail to create respective json dataset representation(s). Subsequently, the dataset(s) will not succeed being stored in their correponding database tables.

The following are acceptable syntax:

- [CSV sample datasets](https://github.com/jeff1evesque/machine-learning/tree/master/html/machine-learning/data/csv/)
- [XML sample datasets](https://github.com/jeff1evesque/machine-learning/tree/master/html/machine-learning/data/xml/)
- [JSON sample datasets](https://github.com/jeff1evesque/machine-learning/tree/master/html/machine-learning/data/json/)

**Note:** each dependent variable value (for JSON datasets), is an array (square brackets), since each dependent variable may have multiple observations. 

###Programmatic Interface

When creating (sub)projects of this repository *programmatically*, it is important to leverage existing logic when possible:

- [Dataset validation](https://github.com/jeff1evesque/machine-learning/blob/master/python/data_validator.py)
- [Database methods](https://github.com/jeff1evesque/machine-learning/blob/master/python/data_saver.py)

The same syntax [requirement](https://github.com/jeff1evesque/machine-learning#web-interface) for csv, or xml file(s) to json conversion is required. This means logic contained within [`svm_json.py`](https://github.com/jeff1evesque/machine-learning/blob/master/python/svm_json.py) must be implemented if such files are used. However, if using a json object (dataset representation) directly is preferred, then no conversion logic is required. Simply ensure a list of dictionary elements:

```python
{ {'uid': xx, 'title': 'yyy'}, {'svm_dataset': [{'dep_variable_label': 'yyy', 'indep_variable_label': 'yyy', 'indep_variable_value': zz.zz}]}, {'id_entity': xx} }
```

is provided when inserting values into the EAV database tables. Exact syntax can be found in [`data_saver.py`](https://github.com/jeff1evesque/machine-learning/blob/master/python/data_saver.py). Be sure to validate the dataset(s) as needed before storing the dataset(s) in the database.

###Test Scripts
