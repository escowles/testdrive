Fedora 4 / ActiveFedora 8 test drive
------------------------------------

1. Install prerequisites:
   * Git
   * Java 1.7+ ([download](http://www.oracle.com/technetwork/java/javase/downloads/index.html))
   * Ruby 2.0+ (recommended: 2.1 using [rbenv](https://github.com/sstephenson/rbenv) or [RVM](http://rvm.io/))
   * Bundler (`gem install bundler`)

   Make sure the right versions of Java and Ruby are being used with:
   ```sh
   $ java -version
   $ ruby -v
   ```

2. Clone this repo
   ```sh
   $ git clone https://github.com/escowles/testdrive.git
   ```

3. Install gems:
    ```sh
    $ cd testdrive
    $ bundle install
    ```

4. Download Hydra-Jetty with Fedora 4:
   ```sh
   $ bundle exec rake jetty:unzip
   ```

5. Start Jetty:
   ```sh
   $ bundle exec rake jetty:start
   ```

6. Run demo scripts:
   ```sh
   $ bundle exec ruby demo1.rb
   $ bundle exec ruby demo2.rb
   $ bundle exec ruby demo3.rb
   ```
