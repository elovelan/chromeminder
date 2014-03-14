module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        coffee:
            build:
                options:
                    bare: true
                    sourceMap: true
                files:
                    'popup.js': 'popup.coffee'
                    'tests/test.js': 'tests/test.coffee'
        mocha:
            build:
                src: ['tests/index.html']

    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-mocha'

    grunt.registerTask 'default', ['coffee','mocha']
