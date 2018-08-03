ObjC.import('stdlib')

// get params

var _args = $.NSProcessInfo.processInfo.arguments
var argv = []

// drop 'osascript -l Javascript this.applescript'
for (var i = 4; i < _args.count; i++) {
    argv.push(ObjC.unwrap(_args.objectAtIndex(i)))
}

if(argv.length < 1 && argv.length > 2) {
	console.error("usage: script FILE [-w]")
	$.exit(1)
}

useTabs = true

if(argv.length > 1 && argv[1] == '-w') {
	useTabs = false
}

// load file

app = Application.currentApplication()
app.includeStandardAdditions = true

var load = function (path) {
  	var handle = app.openForAccess(path)
  	var contents = app.read(handle)
  	app.closeAccess(path)

    var title = function(title) {
        return 'echo -ne "\\033]0;' + title + '\\007"'
    }

	var PROFILE = null
	var TERMS = []
    var ALLTERMS = []
	var PATH = '/'
	var iTerm = true

  	eval(contents)

	return {
  		PROFILE: PROFILE,
		TERMS: TERMS,
        ALLTERMS: ALLTERMS,
		PATH: PATH,
		iTerm: iTerm,
  	}
}

config = load(argv[0])

function runIterm(config) {
    iTerm = Application('iTerm')
    iTerm.activate()

    if(useTabs) {
        win = iTerm.currentWindow
    } else if(config.PROFILE == null) {
    	win = iTerm.createWindowWithDefaultProfile()
    } else {
    	win = iTerm.createWindowWithProfile(config.PROFILE)
    }

    firstTab = null

    for(i = 0; i < config.TERMS.length; i++) {
    	if(i == 0 && !useTabs) {
    		tab = win.tabs[0]
    	} else if(config.PROFILE == null) {
			tab = win.createTabWithDefaultProfile()
		} else {
    		tab = win.createTab({withProfile: config.PROFILE})
    	}

        if(i == 0) {
            firstTab = tab
        }

    	termlines = config.TERMS[i]

        if(termlines === null) {
            termlines = []
    	}else if(!Array.isArray(config.TERMS[i])) {
    		termlines = [termlines]
    	}
    	
        termlines = config.ALLTERMS.concat(termlines)
		
    	if(config.PROFILE == null) {
    		termlines.unshift('cd "' + config.PATH + '"')
    	}
		
    	session = tab.currentSession

    	for(j = 0; j < termlines.length; j++) {
            if(termlines[j] == null) {
                continue;
            }

    		session.write({text: termlines[j]})
    	}
    }

    firstTab.select()
    iTerm.activate()
}

if(config.iTerm) {
	runIterm(config)
}

// vim: set syntax=javascript:
