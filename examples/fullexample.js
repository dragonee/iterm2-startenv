// You do not need to manually copy the file.
// It's a part of `startenv init project` command and will replace
// project name automatically for you.

/*
 * Created for PROJECT_NAME.
 *
 * Run this with:
 *      startenv PROJECT_NAME [-w]
 *
 * The -w switch will create a new window with commands in separate
 * tabs. By default startenv adds a set of tabs in the current window.
 */

/*
 * Run with a specific iTerm profile.
 *
 * If you have a specific profile that determines your tab behaviour for
 * this project, you can define it here. You can set only one profile
 * here that will be enabled for all of the terminal tabs.
 *
 * By default, startenv will use a default iTerm profile.
 */
//PROFILE = 'Project X'

/*
 * List commands that will be sent as text to all terminals, each in
 * single or double quotes.
 * 
 * These commands are used in particular to make sure that your coding
 * environment stays consistent.
 *
 * You need to handle the escaping inside the strings on your own.
 *
 * Examples:
 *      'nvm use 9.4.0',         // to switch to a specific node version
 *      '. env/bin/activate',    // use Python virtualenv
 */
//ALLTERMS = []

/*
 * Define specific tabs here. 
 *
 * Each tab definition can be either:
 *  - a null, meaning that no further commands except for directory
 *    changing and the entries specified in ALLTERMS will be sent to the
 *    terminal,
 *  - a single command in single or double quotes,
 *  - or a list of commands in single or double quotes.
 *  
 *  You can name terminal tabs with a `title('name')` function, which is a
 *  short wrapper that echoes a specific ANSI escape sequence. That way
 *  your terminal tabs are easily discernible.
 *
 *  Here you can define all your terminals for work, building, watching,
 *  even start servers and specific databases on demand.
 *
 *  Examples:
 *      Build systems:
 *          'npm run watch',
 *          'grunt watch',
 *
 *      Development servers:
 *          'env/bin/python manage.py runserver',
 *          './artisan serve',
 *
 *      On-demand servers:
 *          'nginx -c some/path/to/nginx.conf',
 *          'redis-server',
 *          'elasticsearch',
 *          'brew services start mariadb',
 */
TERMS = [
    [
        "echo 'Hello world!'",
        "echo 'You will see this in your first terminal.'"
    ],

    [
        title('Git'),
        'git diff',
        'git status',
    ]
]

// Change this to the index of the terminal tab
// you want to be active by default
ACTIVE_TAB = 0

// vim: set tw=72:
