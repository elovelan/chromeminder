module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON 'package.json'
        coffee:
            build:
                options:
                    bare: true
                    sourceMap: true
                files: 'popup.js': 'popup.coffee'

    grunt.loadNpmTasks 'grunt-contrib-coffee'

    grunt.registerTask 'default', ['coffee']
